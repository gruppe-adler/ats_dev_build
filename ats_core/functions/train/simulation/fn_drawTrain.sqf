params ["_train"];
private _trainCalculationsQueued = _train getVariable ["ATRAIN_Calculations_Queued",true];
private _lastAttachmentTime = _train getVariable ["ATRAIN_Local_Last_Attachment_Time",0];
private _currentTime = diag_tickTime;
private _lastSeen = _train getVariable ["ATRAIN_New_Alignment_Last_Seen",diag_tickTime];
private _timeSinceLastSeen = _currentTime - _lastSeen;
private _trainSpeed = _train getVariable ["ATRAIN_Velocity",0];
private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
private _trainDerailedSimulated = _train getVariable ["ATRAIN_Local_Train_Derailed_Simulated",false];
private _maxAnimatedCars = missionNamespace getVariable ["ATRAIN_MAX_CARS_SIMULATED_ENABLED", 3];
private _carsWithAnimationEnabled = 0;	

if(_trainDerailedSimulated) exitWith {};

{
	private _trainCar = _x;	
	private _lastDrawPosition = _trainCar getVariable ["ATRAIN_Last_Draw_Position",getPosASLVisual _trainCar];	
	private _lastDrawDirection = _trainCar getVariable ["ATRAIN_Last_Draw_Vector_Dir",vectorDirVisual _trainCar];
	private _lastDrawVectorUp = _trainCar getVariable ["ATRAIN_Last_Draw_Vector_Up",vectorUpVisual _trainCar];
	private _newDrawDirection = _trainCar getVariable ["ATRAIN_New_Draw_Vector_Dir",_lastDrawDirection];
	private _newDrawVectorUp = _trainCar getVariable ["ATRAIN_New_Draw_Vector_Up",_lastDrawVectorUp];
	private _velocityFromLastToNewPosition = _trainCar getVariable ["ATRAIN_Velocity_From_Last_To_New_Position",0];
	private _directionFromLastToNewPosition = _trainCar getVariable ["ATRAIN_Direction_From_Last_To_New_Position",_lastDrawDirection];
	private _distanceFromLastToNewPosition = _trainCar getVariable ["ATRAIN_Distance_From_Last_To_New_Position", 0];
	private _animateTrain = _trainCar getVariable ["ATRAIN_Remote_Animate_Train",false];
	private _isCableCar = _trainCar getVariable ["ATRAIN_Remote_Is_Cable_Car",false];

	/*
	if(_distanceFromLastToNewPosition > 0.01) then {
		if(_carsWithAnimationEnabled < _maxAnimatedCars) then {
			_carsWithAnimationEnabled = _carsWithAnimationEnabled + 1;
			if(!simulationEnabled _trainCar) then {
				_trainCar enableSimulation true;
			};
		} else {
			if(simulationEnabled _trainCar) then {
				_trainCar enableSimulation false;
			};
		};
	} else {
		if(simulationEnabled _trainCar) then {
			_trainCar enableSimulation false;
		};
	};
	*/
	
	// prevent flipping
	// if(_distanceFromLastToNewPosition > 0.01) then {
		private _distanceMovedFromLastPosition = _timeSinceLastSeen * _velocityFromLastToNewPosition;
		private _percentMovedFromLastPosition = 0;
		if(_distanceFromLastToNewPosition != 0) then {
			_percentMovedFromLastPosition = _distanceMovedFromLastPosition / _distanceFromLastToNewPosition;
		};
		_percentMovedFromLastPosition = (_percentMovedFromLastPosition max 0) min 1;
		private _currentDrawDirection = vectorNormalized ((_lastDrawDirection vectorMultiply (1-_percentMovedFromLastPosition)) vectorAdd (_newDrawDirection vectorMultiply _percentMovedFromLastPosition));
		private _currentDrawVectorUp = vectorNormalized ((_lastDrawVectorUp vectorMultiply (1-_percentMovedFromLastPosition)) vectorAdd (_newDrawVectorUp vectorMultiply _percentMovedFromLastPosition));
		private _currentDrawPosition = _lastDrawPosition vectorAdd (_directionFromLastToNewPosition vectorMultiply (_distanceMovedFromLastPosition min _distanceFromLastToNewPosition));
		
		if(_isCableCar) then {
			_currentDrawDirection set [2,0];
		};
		
		if (_trainCar getVariable ["ATRAIN_curatorMoved", false]) exitWith {
			systemChat "dragged";
		};

		if(_distanceFromLastToNewPosition > 0.01) then {
			_trainCar setVelocityTransformation [
				_lastDrawPosition, 
				_currentDrawPosition, 
				_lastDrawDirection vectorMultiply _trainSpeed, 
				_currentDrawDirection vectorMultiply _trainSpeed, 
				_lastDrawDirection, 
				_currentDrawDirection, 
				_lastDrawVectorUp, 
				_currentDrawVectorUp, 
				linearConversion [_lastSeen, (missionNamespace getVariable ["ATS_trainSimulation_Interval", 1]), _timeSinceLastSeen, 0, 1]
			];
		} else {
			_trainCar setPosASL _lastDrawPosition;
			_trainCar setVectorUp _lastDrawVectorUp;
		};
		// linearConversion [_lastSeen, _currentTime+0.1, _currentTime, 0, 1]
		
		_trainCar setVariable ["ATRAIN_Current_Draw_Position", _currentDrawPosition];
	//};

} forEach _trainCars;

if(!_trainCalculationsQueued) then {
	{
		private _trainCar = _x;
		private _newAlignment = _trainCar getVariable ["ATRAIN_Alignment",nil];
		private _currentPosition = _trainCar getVariable ["ATRAIN_Current_Draw_Position", getPosASLVisual _trainCar];
		if(!isNil "_newAlignment") then {
			private _frontAlignmentPoint = _newAlignment select 0;
			private _frontAlignmentPointPosition = _frontAlignmentPoint select 0;
			private _rearAlignmentPoint = _newAlignment select 1;
			private _rearAlignmentPointPosition = _rearAlignmentPoint select 0;
			private _vectorUp = [0,0,1];
			if(count _newAlignment > 2) then {
				_vectorUp = _newAlignment select 2;
			};
			private _trainVectorDirection = _rearAlignmentPointPosition vectorFromTo _frontAlignmentPointPosition;
			private _trainPosition = _frontAlignmentPointPosition vectorAdd ((_rearAlignmentPointPosition vectorDiff _frontAlignmentPointPosition) vectorMultiply 0.5);
			private _trainIsBackwards = _trainCar getVariable ["ATRAIN_Remote_Is_Backwards", false];
			private _animateTrain = _trainCar getVariable ["ATRAIN_Remote_Animate_Train",false];
			if(_trainIsBackwards) then {
				_trainVectorDirection = _trainVectorDirection vectorMultiply -1;
			};
			// Offset position based on train model params
			private _positionOffset = _trainCar getVariable ["ATRAIN_Remote_Position_Offset", [0,0,0]];
			_trainPosition = _trainPosition vectorAdd (_trainVectorDirection vectorMultiply (_positionOffset select 0));
			_trainPosition = _trainPosition vectorAdd ((_trainVectorDirection vectorCrossProduct [0,0,1]) vectorMultiply (_positionOffset select 1));
			_trainPosition = _trainPosition vectorAdd [0,0,(_positionOffset select 2)];
			_trainCar setVariable ["ATRAIN_New_Draw_Vector_Dir",_trainVectorDirection];
			_trainCar setVariable ["ATRAIN_New_Draw_Vector_Up",_vectorUp];
			_trainCar setVariable ["ATRAIN_Distance_From_Last_To_New_Position",_currentPosition distance _trainPosition];
			private _velocityFromLastToNewPosition = _trainCar getVariable ["ATRAIN_Velocity_From_Last_To_New_Position",0];
			if(_timeSinceLastSeen == 0) then {
				_velocityFromLastToNewPosition = ( _velocityFromLastToNewPosition  * 0.5);
			} else {
				private _newVelocityFromLastToNewPosition = ((_currentPosition distance _trainPosition) / _timeSinceLastSeen);
				_velocityFromLastToNewPosition = ( _velocityFromLastToNewPosition  * 0.5) + ( _newVelocityFromLastToNewPosition * 0.5);
			};
			_trainCar setVariable ["ATRAIN_Velocity_From_Last_To_New_Position", _velocityFromLastToNewPosition ];
			_trainCar setVariable ["ATRAIN_Direction_From_Last_To_New_Position",_currentPosition vectorFromTo _trainPosition];
			if(_animateTrain) then {
				[_trainCar,_trainSpeed,_trainIsBackwards] call ATRAIN_fnc_setWheelSpeed;
			};
		};
		_trainCar setVariable ["ATRAIN_Last_Draw_Position",_currentPosition];
		_trainCar setVariable ["ATRAIN_Last_Draw_Vector_Dir",vectorDirVisual _trainCar];
		_trainCar setVariable ["ATRAIN_Last_Draw_Vector_Up",vectorUpVisual _trainCar];
	} forEach _trainCars;
	_train setVariable ["ATRAIN_Calculations_Queued",true];
	_train setVariable ["ATRAIN_New_Alignment_Last_Seen",_currentTime];
};

