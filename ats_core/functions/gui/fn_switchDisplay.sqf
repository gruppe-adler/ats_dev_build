params ["_switch", "_ctrl"];


private _subtitle = if (_switch getVariable ["ATRAIN_switch", -1]) then { "Left" } else { "Right" };
_ctrl ctrlSetText _subtitle;
_ctrl ctrlsettext "ats\core\gui\lights_on.paa";
_ctrl ctrlCommit 0;
