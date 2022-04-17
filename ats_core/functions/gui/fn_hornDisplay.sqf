params ["_ctrl"];

private _id = uiNamespace getVariable ["ATRAIN_interfaceTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};
if (_train getVariable ["ATRAIN_Remote_Horn_Enabled", false]) then {
    _ctrl ctrlsettext "ats\core\gui\horn_on.paa";
    _ctrl ctrlCommit 0;
} else {
    _ctrl ctrlsettext "ats\core\gui\horn_off.paa";
    _ctrl ctrlCommit 0;
};