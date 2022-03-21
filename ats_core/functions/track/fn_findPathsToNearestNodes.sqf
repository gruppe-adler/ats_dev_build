params ["_track",["_sourceConnection",[]]];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[]};

private _trackIsTermination = _trackDef select 3;	
private _foundPaths = [];
private _trackEndPoints = [_track] call ATRAIN_fnc_getTrackEndpoints;
private _trackEndPointsIndex = 0;
{

	// Check to see if the path is heading back in the direction of the path we just followed
	// If it is, use the source connection path instead of retracing the steps back
	private _sourceConnectionUsed = false;
	if(count _sourceConnection > 0) then {
		private _sourceConnectionPath = _sourceConnection select 1;
		private _sourceConnectionPathSecondPosition = _sourceConnectionPath select 1;
		if( _sourceConnectionPathSecondPosition distance _x == 0) then {
			_foundPaths pushBack _sourceConnection;
			_sourceConnectionUsed = true;
		};
	};

	if(!_sourceConnectionUsed) then {
		private _pathFound = [_track, _trackEndPointsIndex] call ATRAIN_fnc_findPathToNearestNode;
		if(_pathFound select 0 != _track) then {
			_foundPaths pushBack _pathFound;
		} else {
			if(count (_pathFound select 3) > 1) then {
				// Supports endless loops
				_foundPaths pushBack _pathFound;
			};
		};
	};
	
	if(_trackIsTermination) exitWith {
		// Only search from end point index 0 if track is termination piece
	};
	
	_trackEndPointsIndex = _trackEndPointsIndex + 1;
} forEach _trackEndPoints;
_foundPaths