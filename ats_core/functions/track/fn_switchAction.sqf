params ["_lever"];

_lever addAction
[
    "Switch Track to L",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target] call ATRAIN_fnc_switchControl;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_target getVariable ['ATRAIN_switch', -1] == -1", // _target, _this, _originalTarget
    3,
    false,
    "",
    ""
];

_lever addAction
[
    "Switch Track to R",
    {
        params ["_target", "_caller", "_actionId", "_arguments"];

        [_target] call ATRAIN_fnc_switchControl;
    },
    nil,
    1.5,
    true,
    true,
    "",
    "_target getVariable ['ATRAIN_switch', -1] == 1", // _target, _this, _originalTarget
    3,
    false,
    "",
    ""
];
