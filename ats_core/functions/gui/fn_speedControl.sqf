/*
    
    onSliderPosChanged

*/

params ["_control", "_newValue"];
private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};

["ATRAIN_velocityHandler", [_train, _newValue]] call CBA_fnc_serverEvent;
