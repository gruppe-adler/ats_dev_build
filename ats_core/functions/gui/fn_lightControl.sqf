private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};

private _lights = _train getVariable ["ATRAIN_Remote_lights_Enabled", false];
_train setVariable ["ATRAIN_Remote_lights_Enabled", !_lights, true];
