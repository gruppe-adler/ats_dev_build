params ["_trainCar"];
_trainCar = [_trainCar] call ATRAIN_fnc_getTrainCar;
private _train = _trainCar getVariable ["ATRAIN_Current_Train", objNull];
_train
