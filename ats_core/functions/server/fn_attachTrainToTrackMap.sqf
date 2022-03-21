params ["_train"];
private _nodePath = _train getVariable ["ATRAIN_Node_Path",[]];
// Exit if train already attached to the track
if(count _nodePath > 0) exitWith {true};
private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;
private _trackMapPosition = [_trainEngine] call ATRAIN_fnc_lookupTrackMapPosition;
if(count _trackMapPosition == 0) exitWith { false };
_trackMapPosition params ["_startNodeIndex","_endNodeIndex","_distanceFromStart","_trackDistance"];
_train setVariable ["ATRAIN_Node_Path",[_startNodeIndex, _endNodeIndex],true];
_train setVariable ["ATRAIN_Distance_From_Front",_distanceFromStart,true];
_train setVariable ["ATRAIN_Node_Path_Distance",_trackDistance,true];
true;
