params ["_train"];

private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];
private _carLengthMultiplier = 0.53;

// Check for cars in rear
if(_trainVelocity < 0) then {
	private _rearCar = _train getVariable ["ATRAIN_Rear_Car",_train];	
	if(isNull _rearCar) exitWith {};
	private _rearCarPosASL = getPosASLVisual _rearCar;
	private _rearCarSearchVectorDir = vectorDir _rearCar;
	private _rearCarIsBackwards = _rearCar getVariable ["ATRAIN_Remote_Is_Backwards", false];
	if(!_rearCarIsBackwards) then {
		_rearCarSearchVectorDir = _rearCarSearchVectorDir vectorMultiply -1;
	};

	// switch management
	private _lever = [getPos _rearCar] call ATRAIN_fnc_getSwitch;
	if (!isNull _lever) then {
		systemChat str _lever;
		private _leverPosition = _lever getVariable ["ATRAIN_switch", 0];
		_train setVariable ["ATRAIN_Remote_Turn_Direction", _leverPosition, true];
	};

	private _rearCarLength = _rearCar getVariable ["ATRAIN_Remote_Car_Length",6];
	private _intersectStartASL = _rearCarPosASL vectorAdd (_rearCarSearchVectorDir vectorMultiply (_rearCarLength*_carLengthMultiplier)) vectorAdd [0,0,3];
	private _intersectEndASL = _intersectStartASL vectorAdd [0,0,-3];
	private _newCars = lineIntersectsWith [_intersectStartASL,_intersectEndASL,_rearCar];
	{
		private _trainCar = _x;
		private _trainDef = [_trainCar] call ATRAIN_fnc_getTrainDefinition;
		private _otherTrain = (_trainCar getVariable ["ATRAIN_Current_Train",objNull]);
		private _isDerailed = _otherTrain getVariable ["ATRAIN_Remote_Train_Derailed",false];
		if(alive _trainCar && count _trainDef > 0 && !_isDerailed) then {
			[_rearCar,_trainCar] call ATRAIN_fnc_simulateTrainCollision;
			[_train, _trainCar, false] call ATRAIN_fnc_attachTrainCar;
		} else {
			private _trackDef = [_trainCar] call ATRAIN_fnc_getTrackDefinition;
			if(count _trackDef == 0 && !_isDerailed) then {
				[_rearCar,_trainCar,_rearCarSearchVectorDir] call ATRAIN_fnc_simulateTrainCollision;
			};
		};
	} forEach _newCars;

	/*
	hintSilent parseText format [
                "New Cars rear: %1",
                _newCars
            ];
    */
};


// Check for cars in front
if(_trainVelocity > 0) then {
	private _frontCar = _train getVariable ["ATRAIN_Front_Car",_train];
	if(isNull _frontCar) exitWith {};
	private _frontCarPosASL = getPosASLVisual _frontCar;
	private _frontCarSearchVectorDir = vectorDir _frontCar;
	private _frontCarIsBackwards = _frontCar getVariable ["ATRAIN_Remote_Is_Backwards", false];
	if(_frontCarIsBackwards) then {
		_frontCarSearchVectorDir = _frontCarSearchVectorDir vectorMultiply -1;
	};

	// switch management
	private _lever = [getPos _frontCar] call ATRAIN_fnc_getSwitch;
	if (!isNull _lever) then {
		systemChat str _lever;
		private _leverPosition = _lever getVariable ["ATRAIN_switch", 0];
		_train setVariable ["ATRAIN_Remote_Turn_Direction", _leverPosition, true];		
	};
	

	private _frontCarLength = _frontCar getVariable ["ATRAIN_Remote_Car_Length",6];
	private _intersectStartASL = _frontCarPosASL vectorAdd (_frontCarSearchVectorDir vectorMultiply (_frontCarLength*_carLengthMultiplier)) vectorAdd [0,0,3];
	private _intersectEndASL = _intersectStartASL vectorAdd [0,0,-3];
	private _newCars = lineIntersectsWith [_intersectStartASL,_intersectEndASL,_frontCar];
	{
		private _trainCar = _x;
		private _trainDef = [_trainCar] call ATRAIN_fnc_getTrainDefinition;
		private _otherTrain = (_trainCar getVariable ["ATRAIN_Current_Train",objNull]);
		private _isDerailed = _otherTrain getVariable ["ATRAIN_Remote_Train_Derailed",false];
		if(alive _trainCar && count _trainDef > 0 && !_isDerailed ) then {
			[_frontCar,_trainCar] call ATRAIN_fnc_simulateTrainCollision;
			[_train, _trainCar, true] call ATRAIN_fnc_attachTrainCar;
		} else {
			private _trackDef = [_trainCar] call ATRAIN_fnc_getTrackDefinition;
			if(count _trackDef == 0 && !_isDerailed && alive _trainCar) then {
				[_frontCar,_trainCar,_frontCarSearchVectorDir] call ATRAIN_fnc_simulateTrainCollision;
			};
		};
	} forEach _newCars;

	/*
	hintSilent parseText format [
                "New Cars front: %1<br/>",
                _newCars
            ];
    */
};