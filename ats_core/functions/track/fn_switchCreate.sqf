private _switches = missionNamespace getVariable ["ATRAIN_Registered_Switches", []];
if (_switches find _track > -1) exitWith {};
diag_log "creating switch";
private _lever = "Land_Track_01_switch_F" createVehicle [0,0,0];
private _position = (getPos _track) findEmptyPosition [0,10,"Land_Track_01_switch_F"];
_lever setPos _position;
_lever setDir (getDir _track);
_lever setVariable ["ATRAIN_switch", -1, true];

private _id = missionNamespace getVariable ["ATRAIN_switchCount", 0];
_id = _id + 1;
missionNamespace setVariable ["ATRAIN_switchCount", _id, true];
_lever setVariable ["ATRAIN_switchID", _id, true];

private _visualizer = "Sign_Arrow_Direction_Green_F" createVehicle [0,0,0];
_visualizer attachTo [_lever, [0,0,1]];

private _dir = getDir _lever;
[_visualizer, [_dir + 30, 0, 0]] call BIS_fnc_setObjectRotation;
_lever setVariable ["ATRAIN_switchVisualizer", _visualizer, true];

[_lever] remoteExec ["ATRAIN_fnc_switchAction", [0,-2] select isDedicated, true];

private _levers = missionNamespace getVariable ["ATRAIN_Registered_Levers", []];
_levers pushBackUnique _lever;
missionNamespace setVariable ["ATRAIN_Registered_Levers", _levers, true];

_switches pushBackUnique _track;
missionNamespace setVariable ["ATRAIN_Registered_switches", _switches, true];
