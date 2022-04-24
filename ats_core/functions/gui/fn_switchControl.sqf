params [["_lever", objNull], ["_switchCtrl", controlNull]];

systemChat (str _lever + " " + str _switchCtrl);

_switchCtrl params [["_ctrl", controlNull]];
if (!isNull _ctrl) then {
    _lever = _ctrl getVariable ["ATRAIN_switchObject", objNull];
};

private _state = _lever getVariable ["ATRAIN_switch", -1];
private _dir = getDir _lever;

if (_state == -1) then {
    _lever animate ["lever_rot", 1, 2];
    _lever setVariable ["ATRAIN_switch", 1, true];

    private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {

        [_visualizer, [_dir + 30, 0, 0]] call BIS_fnc_setObjectRotation;
    };
} else {
    _lever animate ["lever_rot", 0, 2];
    _lever setVariable ["ATRAIN_switch", -1, true];

    private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {
        [_visualizer, [_dir - 30, 0, 0]] call BIS_fnc_setObjectRotation;
    };
};
