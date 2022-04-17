params ["_train"];
private _movementDirection = _train getVariable ["ATRAIN_Remote_Movement_Direction",0];
private _actualSpeed = _train getVariable ["ATRAIN_Velocity", 0];
private _targetSpeed = (_train getVariable ["ATRAIN_targetSpeed", 0]);
private _diffSpeed = _targetSpeed - _actualSpeed;
if (_diffSpeed < 0) then { _diffSpeed = -_diffSpeed; }; // abs is real number only?

if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 1) then {
    _train setVariable ["ATRAIN_Remote_Movement_Direction", 1];
};

if (_targetSpeed < _actualSpeed) then {
    if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != -1) then {
        _train setVariable ["ATRAIN_Remote_Movement_Direction", -1];
    };
};

if (_targetSpeed > 1 && {_diffSpeed < .5}) then {
    if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 0) then {
        _train setVariable ["ATRAIN_Remote_Movement_Direction", 0];
    };
};

if (_targetSpeed == 0 && {_diffSpeed < .1}) then {
    if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 0) then {
        _train setVariable ["ATRAIN_Remote_Movement_Direction", 0];
        _train setVariable ["ATRAIN_Velocity", 0, true];
    };
};



private _currentCalcTime = diag_tickTime;
private _lastCalcTime = _train getVariable ["ATRAIN_Local_Last_Velocity_Calculation_Time",_currentCalcTime];
private _deltaCalcTime = (_currentCalcTime - _lastCalcTime);
if(_deltaCalcTime > 2) then {
	_deltaCalcTime = 0;
};
private _carCount = _train getVariable ["ATRAIN_Car_Count",1];

private _trainAccelerationMin = _train getVariable ["ATRAIN_Local_Train_Acceleration_Min", 0.7];
private _trainAccelerationMax = _train getVariable ["ATRAIN_Local_Train_Acceleration_Max", 1.2];
private _trainAccelerationRange = _trainAccelerationMax - _trainAccelerationMin;
private _trainAcceleration = _trainAccelerationMin + (_trainAccelerationRange * (1 - (((_carCount / 20) min 1))));

private _trainDragMin = _train getVariable ["ATRAIN_Local_Train_Drag_Min", 0.7];
private _trainDragMax = _train getVariable ["ATRAIN_Local_Train_Drag_Max", 1.2];
private _trainDragRange = _trainDragMax - _trainDragMin;
private _trainDrag = _trainDragMin + (_trainDragRange * (1 - ((_carCount / 20) min 1)));

private _cruiseControlEnabled = _train getVariable ["ATRAIN_Remote_Cruise_Control_Enabled", false];
private _breakEnabled = player getVariable ["ATRAIN_Remote_brake_Enabled", false];
private _isDerailed = _train getVariable ["ATRAIN_Remote_Train_Derailed",false];
private _isCarDerailed = _train getVariable ["ATRAIN_Remote_Train_Car_Derailed",false];

private _isKilled = _train getVariable ["ATRAIN_Remote_Killed", false];

if(_isDerailed || _isCarDerailed || _isKilled) then {

	_trainAcceleration = 0;
	_movementDirection = 0;
	_trainDrag = _trainDrag * 4;
	
} else {

	if(_breakEnabled) then {
		_trainAcceleration = 0;
		_movementDirection = 0;
		_trainDrag = _trainDrag * 2;
	};
	
	if(_cruiseControlEnabled && !_breakEnabled) then {
		_trainDrag = 0;
	};
	
};

private _trainModelReversed = _train getVariable ["ATRAIN_Remote_Is_Model_Reversed",false];
if(_trainModelReversed) then {
	_movementDirection = _movementDirection * -1;
};

private _trainMaxVelocity = _train getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];
_trainVelocity = (_trainVelocity + (_trainAcceleration * _movementDirection * _deltaCalcTime)) min _trainMaxVelocity max -_trainMaxVelocity;
if(_trainVelocity > 0 && _movementDirection == 0) then {
	_trainVelocity = (_trainVelocity - (_trainDrag * _deltaCalcTime)) max 0;
};
if(_trainVelocity < 0 && _movementDirection == 0) then {
	_trainVelocity = (_trainVelocity + (_trainDrag * _deltaCalcTime)) min 0;
};
private _localVelocityUpdate = _train getVariable ["ATRAIN_Velocity_Update",nil];
if(!isNil "_localVelocityUpdate") then {
	_trainVelocity = _localVelocityUpdate;
	_train setVariable ["ATRAIN_Velocity_Update",nil];
};
_train setVariable ["ATRAIN_Velocity",_trainVelocity, true];
_train setVariable ["ATRAIN_Local_Last_Velocity_Calculation_Time",_currentCalcTime];

// Enable the train's engine automatically when the train starts moving
private _enginedEnabled = _train getVariable ["ATRAIN_Remote_Engine_Enabled", false];
if(_trainVelocity != 0 && !_enginedEnabled) then {
	_train setVariable ["ATRAIN_Remote_Engine_Enabled", true, true];
};


// diag_log format ["ATRAIN simulate train velocity: %1", _trainVelocity];