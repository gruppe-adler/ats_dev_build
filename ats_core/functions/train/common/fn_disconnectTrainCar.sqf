params ["_trainCar"];
private _trainCar = [_trainCar] call ATRAIN_fnc_getTrainCar;
private _train = [_trainCar] call ATRAIN_fnc_getTrain;
private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;
private _trainCarIndex = (_trainCars find _trainCar);
private _trainCarBehindEngine = true;
if(!isNull _trainEngine) then {
	_trainCarBehindEngine = _trainCarIndex > (_trainCars find _trainEngine);
};
private _trainCarsToKeep = [];
private _trainCarsToDetach = [];
{
	if(_trainCarBehindEngine) then {
		if(_forEachIndex < _trainCarIndex) then {
			_trainCarsToKeep pushBack _x;
		} else {
			_trainCarsToDetach pushBack _x;
		};
	} else {
		if(_forEachIndex > _trainCarIndex) then {
			_trainCarsToKeep pushBack _x;
		} else {
			_trainCarsToDetach pushBack _x;
		};
	};
} forEach _trainCars;

private _detachedTrain = [_trainCarsToDetach select 0] call ATRAIN_fnc_createTrainCar;
[_trainCar, _trainsCarToDetach select 0, false] call ATRAIN_fnc_clutchConnect;


_detachedTrain setVariable ["ATRAIN_Remote_Train_Cars", _trainCarsToDetach, true];
[_detachedTrain] call ATRAIN_fnc_rebuildTrain;

_train setVariable ["ATRAIN_Remote_Train_Cars", _trainCarsToKeep, true];
[_train] call ATRAIN_fnc_rebuildTrain;