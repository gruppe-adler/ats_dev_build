params ["_train"];
private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
if(count _trainCars > 0) then {
	_trainCars select ((count _trainCars) - 1);
} else {
	objNull;
}