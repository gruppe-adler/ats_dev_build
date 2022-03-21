params ["_trainCar",["_collidedWith", objNull],["_vectorDir",[0,0,0]]];

private _train = _trainCar getVariable ["ATRAIN_Current_Train",objNull];

if(isNull _train) exitWith {};

private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];

// Train hit end of track
if(isNull _collidedWith) then {
	//diag_log str ["Hit End", _train];
	_train setVariable ["ATRAIN_Velocity_Update",0];
	private _maxSpeedTrain = _train getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
	private _maxCollisionDamageSpeed = _maxSpeedTrain;
	private _minCollisionDamageSpeed = _maxSpeedTrain * 0.8;
	private _collisionSpeed = abs _trainVelocity;
	private _carsDamagedCount = ceil ((((_collisionSpeed-_minCollisionDamageSpeed)/(_maxCollisionDamageSpeed-_minCollisionDamageSpeed)) max 0) * 3);
	if(_carsDamagedCount > 0) then {
		//[_trainCar] call ATRAIN_fnc_handleKilled;
		//private _carsDamaged = [_trainCar,_carsDamagedCount] call ATRAIN_fnc_getNearestTrainCars;
		[_train] call ATRAIN_fnc_derailTrain;
	};
} else {
	private _trainDef = [_collidedWith] call ATRAIN_fnc_getTrainDefinition;
	private _otherTrain = (_collidedWith getVariable ["ATRAIN_Current_Train",objNull]);
	private _lastTrainCollision = _train getVariable ["ATRAIN_Last_Train_Collision", objNull];
	// Train hit another train
	if(count _trainDef > 0  && !isNull _otherTrain && _lastTrainCollision != _collidedWith && _otherTrain != _train) then {
		
		//diag_log str ["Hit Another Train", _train, _otherTrain, _lastTrainCollision];
		// Get vector dir of car
		private _carVectorDir = vectorDirVisual _trainCar;
		private _carIsBackwards = _trainCar getVariable ["ATRAIN_Remote_Is_Backwards", false];
		if(_carIsBackwards) then {
			_carVectorDir = _carVectorDir vectorMultiply -1;
		};
		// Get vector dir of other car
		private _otherCarVectorDir = vectorDirVisual _collidedWith;
		private _otherCarIsBackwards = _collidedWith getVariable ["ATRAIN_Remote_Is_Backwards", false];
		if(_otherCarIsBackwards) then {
			_otherCarVectorDir = _otherCarVectorDir vectorMultiply -1;
		};
		private _otherTrainVelocity = _otherTrain getVariable ["ATRAIN_Velocity",0];
		private _newVelocity = (vectorMagnitude ((_carVectorDir vectorMultiply abs _trainVelocity) vectorAdd (_otherCarVectorDir vectorMultiply abs _otherTrainVelocity))) * 0.5;
		_train setVariable ["ATRAIN_Velocity_Update", _newVelocity];
		_train setVariable ["ATRAIN_Last_Train_Collision", _collidedWith];
		[_collidedWith,_trainCar] spawn ATRAIN_fnc_simulateTrainCollision;
		private _maxSpeedTrain = _otherTrain getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
		private _maxSpeedOtherTrain = _train getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
		private _maxCollisionDamageSpeed = _maxSpeedTrain + _maxSpeedOtherTrain;
		private _minCollisionDamageSpeed = _maxSpeedTrain / 2;
		private _collisionSpeed = vectorMagnitude ((_carVectorDir vectorMultiply abs _trainVelocity) vectorDiff (_otherCarVectorDir vectorMultiply abs _otherTrainVelocity));
		private _carsDamagedCount = ceil((((_collisionSpeed-_minCollisionDamageSpeed)/(_maxCollisionDamageSpeed-_minCollisionDamageSpeed)) max 0) * 5);
		if(_carsDamagedCount > 0) then {
			//[_trainCar] call ATRAIN_fnc_handleKilled;
			//private _carsDamaged = [_trainCar,_carsDamagedCount] call ATRAIN_fnc_getNearestTrainCars;
			[_train] call ATRAIN_fnc_derailTrain;
		};
	};
	// Train hit an unattached train car
	if(count _trainDef > 0  && isNull _otherTrain && _lastTrainCollision != _collidedWith) then {
	
		//diag_log str ["Hit Unattached Car", _train];
		
		_train setVariable ["ATRAIN_Velocity_Update",_trainVelocity * 0.5];
		_train setVariable ["ATRAIN_Last_Train_Collision", _collidedWith];
		private _maxSpeedTrain = _otherTrain getVariable ["ATRAIN_Remote_Train_Max_Velocity",12];
		private _maxCollisionDamageSpeed = _maxSpeedTrain;
		private _minCollisionDamageSpeed = _maxSpeedTrain * 0.8;
		private _collisionSpeed = abs _trainVelocity;
		private _carsDamagedCount = ceil ((((_collisionSpeed-_minCollisionDamageSpeed)/(_maxCollisionDamageSpeed-_minCollisionDamageSpeed)) max 0) * 2);
		if(_carsDamagedCount > 0) then {
			//[_trainCar] call ATRAIN_fnc_handleKilled;
			//private _carsDamaged = [_trainCar,_carsDamagedCount] call ATRAIN_fnc_getNearestTrainCars;
			[_train] call ATRAIN_fnc_derailTrain;
		};
	};
	// Train hit another object + object is NOT attached via ViV
	if(count _trainDef == 0 && local _collidedWith && ((getVehicleCargo _trainCar) find _collidedWith > -1)) then {
		//diag_log str ["Hit Object", _train];
		private _newVelocity = ((velocity _collidedWith) vectorAdd (_vectorDir vectorMultiply abs _trainVelocity));
		_newVelocity = (vectorNormalized _newVelocity) vectorMultiply ((vectorMagnitude _newVelocity) min abs _trainVelocity);
		private _deltaSpeed = abs vectorMagnitude ((velocity _collidedWith) vectorDiff _newVelocity);
		_collidedWith setVelocity _newVelocity;
		private _minDamageSpeed = (_train getVariable ["ATRAIN_Remote_Train_Max_Velocity",12]) * 0.75;
		if(_deltaSpeed > _minDamageSpeed) then {
			_collidedWith setDamage 1;
		};
	};
};

