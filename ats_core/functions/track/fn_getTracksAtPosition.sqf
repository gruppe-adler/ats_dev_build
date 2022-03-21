params ["_positionASL",["_ignoreObject",objNull]];
private _intersectStartASL = _positionASL vectorAdd [0,0,2];
private _intersectEndASL = _positionASL vectorAdd [0,0,-2];
private _objects = lineIntersectsWith [_intersectStartASL,_intersectEndASL,_ignoreObject];
private _foundTracks = [];
private _trackDef = [];
{
	private _object = _x;
	if(!isNull _object) then {
		_trackDef = [_object] call ATRAIN_fnc_getTrackDefinition;
		if(count _trackDef > 0) then {
			_foundTracks pushBack _object;
		};
	};
} forEach _objects;

// Alternative seach to support CUP tracks
if(count _foundTracks == 0) then {
	private _fireObjects = lineIntersectsSurfaces [
		_intersectStartASL, 
		_intersectEndASL, 
		_ignoreObject,
		objNull,
		true,
		-1,
		"FIRE",
		"FIRE"
	];
	{
		private _object = _x select 2;
		if(!isNull _object) then {
			_trackDef = [_object] call ATRAIN_fnc_getTrackDefinition;
			if(count _trackDef > 0) then {
				_foundTracks pushBack _object;
			};
		};
	} forEach _fireObjects;
};

_foundTracks;
