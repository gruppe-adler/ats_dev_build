params ["_track","_endPointIndex"];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[];};
_trackDef params ["_className","_centerOffset","_isIntersection","_isTermination",["_heightOffset",0]];


// create switch lever for switch handling, let server manage
if (isServer && _isIntersection) then {

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

	private _visualizer = "Sign_Sphere100cm_Geometry_F" createVehicle [0,0,0];
	_visualizer setObjectTextureGlobal [0,"#(argb,8,8,3)color(0.1,1,0.1,1.000000,ca)"];
	_visualizer attachTo [_lever, [0,0,0]];
	_lever setVariable ["ATRAIN_switchVisualizer", _visualizer, true];


	[_lever] remoteExec ["ATRAIN_fnc_switchAction", [0,-2] select isDedicated, true];

	private _levers = missionNamespace getVariable ["ATRAIN_Registered_Levers", []];
	_levers pushBackUnique _lever;
	missionNamespace setVariable ["ATRAIN_Registered_Levers", _levers, true];

	_switches pushBackUnique _track;
	missionNamespace setVariable ["ATRAIN_Registered_switches", _switches, true];
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
