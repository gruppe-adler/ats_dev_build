params ["_trainCar"];
_trainCar = [_trainCar] call ATRAIN_fnc_getTrainCar;
private _isKilled = _trainCar getVariable ["ATRAIN_Remote_Killed", false];
if(!_isKilled) then {
	_trainCar setVariable ["ATRAIN_Remote_Killed", true, true];
};
_trainCar removeEventHandler ["Killed",0];