params ["_track","_endPointIndex"];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[];};
_trackDef params ["_className","_centerOffset","_isIntersection","_isTermination",["_heightOffset",0]];


// create switch lever for switch handling, let server manage
if (isServer && _isIntersection) then {
	[] call ATRAIN_fnc_switchCreate;
};


private _trackEndPoints = [_track] call ATRAIN_fnc_getTrackEndpoints;
private _startPointIndex = 0;
if(_endPointIndex == 0) then {
	_startPointIndex = 1;
};
if(_endPointIndex == 1) then {
	_startPointIndex = 0;
};
if(_endPointIndex == 2) then {
	_startPointIndex = 1;
};
private _startPoint = _trackEndPoints select _startPointIndex;
private _endPoint = _trackEndPoints select _endPointIndex;
private _searchVectorDirection = _startPoint vectorFromTo _endPoint;
private _searchPositions = [
	(_endPoint vectorAdd (_searchVectorDirection vectorMultiply 0.5)),
	(_endPoint vectorAdd (_searchVectorDirection vectorMultiply 1)),
	(_endPoint vectorAdd (_searchVectorDirection vectorMultiply 1.25)),
	(_endPoint vectorAdd (_searchVectorDirection vectorMultiply -0.5)),
	(_endPoint vectorAdd (_searchVectorDirection vectorMultiply -1))
];
private _foundTracksAndSearchPosition = {
	private _tracksAtPosition = [_x, _track] call ATRAIN_fnc_getTracksAtPosition;
	if(missionNamespace getVariable ["ATRAIN_Track_Debug_Enabled",false]) then {
		private _arrow = "Sign_Arrow_F" createVehicle [0,0,0];
		_arrow setPosASL _x;
	};
	if(count _tracksAtPosition > 0) exitWith {[_tracksAtPosition, _x]};

} forEach _searchPositions;

if(isNil "_foundTracksAndSearchPosition") then {
	// Search for cup tracks
	private _centerPoint = _endPoint vectorAdd (_searchVectorDirection vectorMultiply 1);
	private _sideSearchVectorDirection = (_searchVectorDirection vectorCrossProduct [0,0,1]);
	for "_i" from 0 to 25 do
	{
		_centerPoint = _centerPoint vectorAdd (_sideSearchVectorDirection vectorMultiply 0.05);
		private _tracksAtPosition = [_centerPoint, _track] call ATRAIN_fnc_getTracksAtPosition;
		if(missionNamespace getVariable ["ATRAIN_Track_Debug_Enabled",false]) then {
			//private _arrow = "Sign_Arrow_F" createVehicle [0,0,0];
			//_arrow setPosASL _centerPoint;
		};
		if(count _tracksAtPosition > 0) exitWith {
			_foundTracksAndSearchPosition = [_tracksAtPosition, _centerPoint]
		};
	};
};

private _bestTrackConnectionDotProduct = 1;
private _bestTrackConnection = [];

if(!isNil "_foundTracksAndSearchPosition") then {
	_foundTracksAndSearchPosition params ["_foundTracks", "_searchPosition"];
	private _foundTracksContainsIntersections = false;
	{
		private _foundTrack = _x;
		private _foundTrackDef = [_foundTrack] call ATRAIN_fnc_getTrackDefinition;
		private _foundTrackIsIntersection = _foundTrackDef select 2;
		if(_foundTrackIsIntersection && !_foundTracksContainsIntersections) then {
			_foundTracksContainsIntersections = true;
			private _bestTrackConnectionDotProduct = 1;
			private _bestTrackConnection = [];
		};
		if((_foundTracksContainsIntersections && _foundTrackIsIntersection) || !_foundTracksContainsIntersections) then {
			private _foundTrackEndPoints = [_foundTrack] call ATRAIN_fnc_getTrackEndpoints;
			private _foundTrackEndPointsIndex = 0;
			{
				private _connectionDotProduct = (_x vectorFromTo _startPoint) vectorDotProduct (_x vectorFromTo _searchPosition);
				if(_connectionDotProduct <= _bestTrackConnectionDotProduct ) then {
					_bestTrackConnection = [_foundTrack, _foundTrackEndPointsIndex];
					_bestTrackConnectionDotProduct = _connectionDotProduct;
				};
				_foundTrackEndPointsIndex = _foundTrackEndPointsIndex + 1;
			} forEach _foundTrackEndPoints;
		};
	} forEach _foundTracks;
};

_bestTrackConnection;
