params ["_vehicle",["_positionATL",[0,0,0]]];
private _trainCar = objNull;
if(typeName _vehicle == "STRING") then {
	// Create new train car
	_trainCar = [_vehicle, _positionATL] call ATRAIN_fnc_createTrainCar;
} else {
	 _trainCar = [_vehicle] call ATRAIN_fnc_getTrainCar;
	if(isNull _trainCar) then {
		_trainCar = [_vehicle] call ATRAIN_fnc_createTrainCar;
	};
};
_trainCar