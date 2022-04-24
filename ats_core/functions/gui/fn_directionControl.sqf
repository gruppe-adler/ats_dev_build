private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};

private _direction = _train getVariable ["ATRAIN_Movement_Direction", -1];
if (_direction == -1) then {
    _direction = 1;
} else {
    _direction = -1;  
};
_train setVariable ["ATRAIN_Movement_Direction", _direction, true];
