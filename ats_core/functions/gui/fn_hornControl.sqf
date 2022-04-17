params ["_ctrl", "_button"];

private _id = _button getVariable ["ATRAIN_zeusTrainID", -1];
private _train = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]) select (_id-1);
if (isNull _train) exitWith {};
if (_train getVariable ["ATRAIN_Remote_Horn_Enabled", false] == false) then {
    _train setVariable ["ATRAIN_Remote_Horn_Enabled", true, true];
    _ctrl ctrlsettext "ats\core\gui\horn_on.paa";
    _ctrl ctrlCommit 0;
} else {
    _train setVariable ["ATRAIN_Remote_Horn_Enabled", false, true];
    _ctrl ctrlsettext "ats\core\gui\horn_off.paa";
    _ctrl ctrlCommit 0;
};