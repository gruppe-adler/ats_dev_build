params ["_train"];
private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
private _trainCarsCount = count _trainCars;
private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;
private _trainEngineIndex = _trainCars find _trainEngine;

// Initialize train cars in front of engine
private _lastCarSeen = _trainEngine;
for [{_i=_trainEngineIndex-1}, {_i>=0}, {_i=_i-1}] do
{
	private _trainCar = _trainCars select _i;
	// Point car at current train
	if([_trainCar] call ATRAIN_fnc_getTrain != _train) then {
		_trainCar setVariable ["ATRAIN_Current_Train", _train, true];
	};
	// Define if car is facing backwards relative to train direction
	private _trainCar = [_trainCar] call ATRAIN_fnc_getTrainCar;
	private _frontCarSearchVectorDir = vectorDirVisual ([_lastCarSeen] call ATRAIN_fnc_getTrainCar);
	private _frontCarIsBackwards = _lastCarSeen getVariable ["ATRAIN_Is_Backwards", false];
	if(!_frontCarIsBackwards) then {
		_frontCarSearchVectorDir = _frontCarSearchVectorDir vectorMultiply -1;
	};
	private _carIsBackwards = (_frontCarSearchVectorDir vectorDotProduct (vectorDir _trainCar)) > 0;
	if(str (_trainCar getVariable ["ATRAIN_Is_Backwards", false]) != str _carIsBackwards) then {
		_trainCar setVariable ["ATRAIN_Is_Backwards", _carIsBackwards, true];
	};
	private _priorCarLength = _lastCarSeen getVariable ["ATRAIN_Remote_Car_Length", 6];
	private _priorCarDistanceFronEngine = _lastCarSeen getVariable ["ATRAIN_Offset_From_Engine", 0];
	private _carLength = _trainCar getVariable ["ATRAIN_Remote_Car_Length", 6];
	private _carDistanceFrontEngine = _priorCarDistanceFronEngine - (( _priorCarLength * 0.5 ) + ( _carLength * 0.5 ));
	_trainCar setVariable ["ATRAIN_Offset_From_Engine", _carDistanceFrontEngine, true];
	_lastCarSeen = _trainCar;
};

// Initialize train cars behind engine
_lastCarSeen = _trainEngine;
for [{_i=_trainEngineIndex+1}, {_i<_trainCarsCount}, {_i=_i+1}] do
{
	private _trainCar = _trainCars select _i;
	// Point car at current train
	if([_trainCar] call ATRAIN_fnc_getTrain != _train) then {
		_trainCar setVariable ["ATRAIN_Current_Train", _train, true];
	};
	// Define if car is facing backwards relative to train direction
	private _trainCar = [_trainCar] call ATRAIN_fnc_getTrainCar;
	private _rearCarSearchVectorDir = vectorDirVisual ([_lastCarSeen] call ATRAIN_fnc_getTrainCar);
	private _rearCarIsBackwards = _lastCarSeen getVariable ["ATRAIN_Is_Backwards", false];
	if(!_rearCarIsBackwards) then {
		_rearCarSearchVectorDir = _rearCarSearchVectorDir vectorMultiply -1;
	};
	private _carIsBackwards = (_rearCarSearchVectorDir vectorDotProduct (vectorDir _trainCar)) > 0;
	if(str (_trainCar getVariable ["ATRAIN_Is_Backwards", false]) != str _carIsBackwards) then {
		_trainCar setVariable ["ATRAIN_Is_Backwards", _carIsBackwards, true];
	};
	private _priorCarLength = _lastCarSeen getVariable ["ATRAIN_Remote_Car_Length", 6];
	private _priorCarDistanceFronEngine = _lastCarSeen getVariable ["ATRAIN_Offset_From_Engine", 0];
	private _carLength = _trainCar getVariable ["ATRAIN_Remote_Car_Length", 6];
	private _carDistanceFrontEngine = _priorCarDistanceFronEngine + (( _priorCarLength * 0.5 ) + ( _carLength * 0.5 ));
	_trainCar setVariable ["ATRAIN_Offset_From_Engine", _carDistanceFrontEngine, true];
	_lastCarSeen = _trainCar;
};

_train setVariable ["ATRAIN_Rear_Car", [_train] call ATRAIN_fnc_findRearCar, true];
_train setVariable ["ATRAIN_Front_Car", [_train] call ATRAIN_fnc_findFrontCar, true];
_train setVariable ["ATRAIN_Car_Count", _trainCarsCount, true];