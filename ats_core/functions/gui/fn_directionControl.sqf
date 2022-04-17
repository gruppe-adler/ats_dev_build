params ["_forward"];

private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};

_train setVariable ["ATRAIN_Movement_Direction", [-1, 1] select _forward];