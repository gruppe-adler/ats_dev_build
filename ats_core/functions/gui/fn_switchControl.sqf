params [["_lever", objNull], ["_switchCtrl", controlNull]];

systemChat (str _lever + " " + str _switchCtrl);

_switchCtrl params [["_ctrl", controlNull]];
if (!isNull _ctrl) then {
    _lever = _ctrl getVariable ["ATRAIN_switchObject", objNull];
};

private _state = _lever getVariable ["ATRAIN_switch", -1];
private _green = "#(argb,8,8,3)color(0.1,1,0.1,1.000000,ca)";
private _red =  "#(argb,8,8,3)color(1,0.1,0.1,1.000000,ca)";

if (_state == -1) then {
    _lever animate ["lever_rot", 1, 0.25];
    _lever setVariable ["ATRAIN_switch", 1, true];

    private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {
        _visualizer setObjectTextureGlobal [0, _green];
    };
} else {
    _lever animate ["lever_rot", 0, 0.25];
    _lever setVariable ["ATRAIN_switch", -1, true];

    private _visualizer = _lever getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {
        _visualizer setObjectTextureGlobal [0, _red];
    };
};
