params ["_track"];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[];};
_trackDef params ["_className","_centerOffset","_isIntersection","_isTermination",["_heightOffset",0]];
private _trackEndPoints = [_track] call ATRAIN_fnc_getTrackEndPoints;
_trackEndPoints params ["_trackEnd1", "_trackEnd2", "_trackEnd3"];

private _trackWorldPaths = [];

if(!_isIntersection && !_isTermination) then {
	private _worldPath = [];
	_worldPath pushBack _trackEnd1;
	private _trackPosition = _track selectionPosition "track1";
	if(_trackPosition distance [0,0,0] != 0) then {
		private _trackIndex = 1;
		while {_trackPosition distance [0,0,0] != 0} do {
			_worldPath pushBack (AGLtoASL (_track modelToWorld (_trackPosition)));
			_trackIndex = _trackIndex + 1;
			_trackPosition = _track selectionPosition (format ["track%1", _trackIndex]);
		};
	} else {		
		if(_centerOffset != 0) then {
			private _pathMidpoint = _trackEnd1 vectorAdd ((_trackEnd2 vectorDiff _trackEnd1) vectorMultiply 0.5);
			_pathMidpoint = _pathMidpoint vectorAdd (((vectorUp _track) vectorCrossProduct (_trackEnd1 vectorFromTo _trackEnd2)) vectorMultiply _centerOffset);
			_worldPath pushBack _pathMidpoint;
		};
	};
	_worldPath pushBack _trackEnd2;
	_trackWorldPaths pushBack _worldPath;
	private _worldPathReverse = +_worldPath;
	reverse _worldPathReverse;
	_trackWorldPaths pushBack _worldPathReverse;
};

if(_isTermination) then {
	private _pathMidpoint = _trackEnd1 vectorAdd ((_trackEnd2 vectorDiff _trackEnd1) vectorMultiply 0.5);
	_trackWorldPaths pushBack [_trackEnd1, _pathMidpoint];
	_trackWorldPaths pushBack [_trackEnd2, _pathMidpoint];
};

if(_isIntersection) then {
	private _pathMidpoint = _trackEnd1 vectorAdd ((_trackEnd2 vectorDiff _trackEnd1) vectorMultiply 0.9);
	_trackWorldPaths pushBack [_trackEnd1, _pathMidpoint];
	_trackWorldPaths pushBack [_trackEnd2, _pathMidpoint];
	private _worldPath = [];
	_worldPath pushBack _trackEnd3;
	private _pathMidpoint2 = _trackEnd3 vectorAdd ((_pathMidpoint vectorDiff _trackEnd3) vectorMultiply 0.5);
	_pathMidpoint2 = _pathMidpoint2 vectorAdd (((vectorUp _track) vectorCrossProduct (_trackEnd3 vectorFromTo _pathMidpoint)) vectorMultiply _centerOffset);
	_worldPath pushBack _pathMidpoint2;
	_worldPath pushBack _pathMidpoint;
	_trackWorldPaths pushBack _worldPath;
};
_trackWorldPaths;
