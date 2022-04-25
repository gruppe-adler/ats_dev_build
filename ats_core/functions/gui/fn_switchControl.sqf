params [["_lever", objNull], ["_switchCtrl", controlNull]];

systemChat (str _lever + " " + str _switchCtrl);

_switchCtrl params [["_ctrl", controlNull]];
if (!isNull _ctrl) then {
    _lever = _ctrl getVariable ["ATRAIN_switchObject", objNull];
};

private _dir = getDir _lever;

if ([_target] call ATRAIN_fnc_switchIsRight) then {
    _lever animate ["lever_rot", 0, 2];
    _lever setVariable ["ATRAIN_switch", 1, true];

    private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {

        [_visualizer, [_dir - 30, 0, 0]] call BIS_fnc_setObjectRotation;
    };
} else {
    if ([_target] call ATRAIN_fnc_switchIsLeft) then {
        _lever animate ["lever_rot", 1, 2];
        _lever setVariable ["ATRAIN_switch", -1, true];

        private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
        if (!isNull _visualizer) then {
            [_visualizer, [_dir - 70, 0, 0]] call BIS_fnc_setObjectRotation;
        };
    };
};
