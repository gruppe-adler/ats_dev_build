params ["_posAGL"];

private _switches = nearestObjects [_posAGL, ["Land_Track_01_switch_F"], 10];
_switches params [["_switch", objNull]];

_switch
