params ["_trackMap"];
if(!isServer) exitWith { [_this, "ATRAIN_fnc_updateTrackMap",true] call ATRAIN_fnc_RemoteExecServer };
[_trackMap] call ATRAIN_fnc_updateServerTrackMap;