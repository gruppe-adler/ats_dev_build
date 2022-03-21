/*

	registers train on server

*/

params ["_train",["_player",player]];

if(!isServer) exitWith { [[_train,_player], "ATRAIN_fnc_registerTrain",true] call ATRAIN_fnc_RemoteExecServer; };

private _registeredTrains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
if (_registeredTrains find _train > -1) exitWith { diag_log "ATRAIN already registered train"; };

if(_train getVariable ["ATRAIN_Loaded_Track_Map",false]) exitWith {};
_train setVariable ["ATRAIN_Loaded_Track_Map",true, true];
private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;
private _track = [_trainEngine] call ATRAIN_fnc_getTrackUnderTrainCar;
if (isNull _track) exitWith {
	diag_log ("ATS: no track engine for " + str _train);
};
if (isNull _trainEngine) exitWith {
	diag_log ("ATS: no train engine for " + str _train);
};
private _trackMap = [_track] call ATRAIN_fnc_buildTrackMap;
[_trackMap] call ATRAIN_fnc_updateTrackMap;

[_train] call ATRAIN_fnc_attachTrainToTrackMap;

// dont add twice
_registeredTrains pushBackUnique _train;
_train setVariable ["ATRAIN_trainID",(count _registeredTrains), true];		
missionNamespace setVariable ["ATRAIN_Registered_Trains",_registeredTrains,true];