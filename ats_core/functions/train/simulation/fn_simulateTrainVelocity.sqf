params ["_train"];
private _thrust = _train getVariable ["ATRAIN_Thrust", 1]; // 0
private _actualSpeed = _train getVariable ["ATRAIN_Velocity", 0];
private _targetSpeed = (_train getVariable ["ATRAIN_targetSpeed", 0]);
private _diffSpeed = _targetSpeed - _actualSpeed;
if (_diffSpeed < 0) then { _diffSpeed = -_diffSpeed; }; // abs is real number only?


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
private _isDerailed = _train getVariable ["ATRAIN_Train_Derailed",false];
private _isCarDerailed = _train getVariable ["ATRAIN_Remote_Train_Car_Derailed",false];

private _isKilled = _train getVariable ["ATRAIN_Remote_Killed", false];

if(_isDerailed || _isCarDerailed || _isKilled) then {

	_trainAcceleration = 0;
	_thrust = 0;
	_trainDrag = _trainDrag * 4;
	
} else {

	// emergency break == no acceleration possible
	if(_breakEnabled) then {
		_trainAcceleration = 0;
		_thrust = 0;
		_trainDrag = _trainDrag * 8;
	};

	// dont decelerate (default behaviour)
	if(_cruiseControlEnabled && !_breakEnabled) then {
		_trainDrag = 0;
	};

	// grind to halt when close to zero speed
	if (_targetSpeed == 0 && _diffSpeed < 0.1) then {
		_trainAcceleration = 0;
		_thrust = 0;
		_trainDrag = _trainDrag * 2;
	};

	// if set higher than target speed, reduce speed
	if (_actualSpeed > _targetSpeed) then {
		_thrust = -1;
	};

	// if set lower than target speed, raise speed
	if (_actualSpeed < _targetSpeed) then {
		_thrust = 1;
	};

	// dont accelerate further if speed is reached
	if (_diffSpeed < 0.1 && !_breakEnabled) then {
		_trainAcceleration = 0;
		_thrust = 0;
	};	
};


private _trainModelReversed = _train getVariable ["ATRAIN_Remote_Is_Model_Reversed",false];
if(_trainModelReversed) then {
	_thrust = _thrust * -1;
};

private _trainMaxVelocity = _train getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];
_trainVelocity = (_trainVelocity + (_trainAcceleration * _thrust * _deltaCalcTime)) min _trainMaxVelocity max -_trainMaxVelocity;
if(_trainVelocity > 0 && _thrust == 0) then {
	_trainVelocity = (_trainVelocity - (_trainDrag * _deltaCalcTime)) max 0;
};
if(_trainVelocity < 0 && _thrust == 0) then {
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