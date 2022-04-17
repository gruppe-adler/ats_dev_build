/*
    
    onSliderPosChanged

*/

params ["_control", "_newValue"];
private _id = _control getVariable ["ATRAIN_zeusTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};
_train setVariable ["ATRAIN_targetSpeed", _newValue, true];