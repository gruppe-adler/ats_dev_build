params ["_track","_endPointIndex"];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[];};
_trackDef params ["_className","_centerOffset","_isIntersection","_isTermination",["_heightOffset",0]];

private _path = [];
private _trackPath = ([_track] call ATRAIN_fnc_getTrackWorldPaths) select _endPointIndex;
reverse _trackPath;
private _trackDirection = (_trackPath select 0) vectorFromTo (_trackPath select ((count _trackPath) - 1));
private _tracksInPath = [[_track, _trackDirection]];
private _pathDistance = [_path, _trackPath] call ATRAIN_fnc_addWorldPaths;
private _currentEndPointIndex = _endPointIndex;
private _currentTrack = _track;
private _reloadedNearObjects = false;

private _foundNodePath = while {true} do {

	// Find next attached track
	
	private _attachedTrackFound = [_currentTrack, _currentEndPointIndex] call ATRAIN_fnc_findAttachedTrack;

	if(count _attachedTrackFound == 0) then {
		// Force objects to load on the map by issuing nearObjects command, then try finding next track again
		private _lastPathPosition = _path select ((count _path)-1);
		[_lastPathPosition select 0, _lastPathPosition select 1, 0] nearObjects ["House", 500];
		_attachedTrackFound = [_currentTrack, _currentEndPointIndex] call ATRAIN_fnc_findAttachedTrack;
	};
	
	if(count _attachedTrackFound == 0) exitWith {
		// No attached track found - no node found
		[_currentTrack,_path,_pathDistance, _tracksInPath]
	};
	
	_attachedTrackFound params ["_foundTrack", "_foundTrackConnectionEndPoint"];
	private _foundTrackDef = [_foundTrack] call ATRAIN_fnc_getTrackDefinition;
	private _foundTrackIsIntersection = _foundTrackDef select 2;
	private _foundTrackIsTermination = _foundTrackDef select 3;	
	private _foundTrackWorldPath = ([_foundTrack] call ATRAIN_fnc_getTrackWorldPaths) select _foundTrackConnectionEndPoint;
	
	if(_foundTrack == _track) exitWith {
		// Track is a loop - no node found
		[_track,_path, _pathDistance, _tracksInPath]
	};	
	
	private _foundTrackDirection = (_foundTrackWorldPath select 0) vectorFromTo (_foundTrackWorldPath select ((count _foundTrackWorldPath) - 1));
	_tracksInPath pushBack [_foundTrack, _foundTrackDirection];
	private _distanceAdded = [_path, _foundTrackWorldPath, _foundTrackIsIntersection || _foundTrackIsTermination] call ATRAIN_fnc_addWorldPaths;
	_pathDistance = _pathDistance + _distanceAdded;
	
	if(_foundTrackIsIntersection || _foundTrackIsTermination) exitWith {
		// Attached track is an intersection or termination (aka a node)
		[_foundTrack,_path,_pathDistance, _tracksInPath]
	};
	
	_currentEndPointIndex = if (_foundTrackConnectionEndPoint > 0) then [{0},{1}];
	_currentTrack = _foundTrack;
		
};

_foundNodePath