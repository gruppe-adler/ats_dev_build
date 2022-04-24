/*
    
    onSliderPosChanged

*/

params ["_control", "_newValue"];
systemChat str _this;

private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
if (_id < 0) exitWith {};
private _trains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
if (count _trains < 1) exitWith {};
private _train = _trains select (_id-1);
if (isNull _train) exitWith {};

["ATRAIN_velocityHandler", [_train, _newValue]] call CBA_fnc_serverEvent;
