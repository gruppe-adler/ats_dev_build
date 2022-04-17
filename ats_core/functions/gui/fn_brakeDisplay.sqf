params ["_ctrl"];

private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};
if (_train getVariable ["ATRAIN_Remote_brake_Enabled", false]) then {
    _train setVariable ["ATRAIN_Remote_brake_Enabled", true, true];
    _ctrl ctrlsettext "ats\core\gui\brake_on.paa";
    _ctrl ctrlCommit 0;
} else {
    _train setVariable ["ATRAIN_Remote_brake_Enabled", false, true];
    _ctrl ctrlsettext "ats\core\gui\brake_off.paa";
    _ctrl ctrlCommit 0;
};