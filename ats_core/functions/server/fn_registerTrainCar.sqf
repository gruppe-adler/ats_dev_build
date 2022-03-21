params ["_trainCar"];
if(!isServer) exitWith { [_this, "ATRAIN_fnc_registerTrainCar", true] call ATRAIN_fnc_RemoteExecServer };
private _trainCars = missionNamespace getVariable ["ATRAIN_Registered_Train_Cars",[]];
_trainCars pushBackUnique _trainCar;
missionNamespace setVariable ["ATRAIN_Registered_Train_Cars",_trainCars,true];