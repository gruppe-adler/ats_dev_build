params ["_target"];

private _state = _target getVariable ["ATRAIN_switch", -1];
private _green = "#(argb,8,8,3)color(0.1,1,0.1,1.000000,ca)";
private _red =  "#(argb,8,8,3)color(1,0.1,0.1,1.000000,ca)";

if (_state == -1) then {
    _target animate ["lever_rot", 1, 0.25];
    _target setVariable ["ATRAIN_switch", 1, true];

    private _visualizer = _target getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {
        _visualizer setObjectTextureGlobal [0, _green];
    };
} else {
    _target animate ["lever_rot", 0, 0.25];
    _target setVariable ["ATRAIN_switch", -1, true];

    private _visualizer = _target getVariable ["ATRAIN_switchVisualizer", objNull];
    if (!isNull _visualizer) then {
        _visualizer setObjectTextureGlobal [0, _red];
    };
};
