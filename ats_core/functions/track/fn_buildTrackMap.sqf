params ["_track"];
private _startNodes = [_track] call ATRAIN_fnc_findPathsToNearestNodes;
if(count _startNodes == 0) exitWith {[]};
private _firstStartNode = _startNodes select 0;
private _firstStartNodeTrack = _firstStartNode select 0;
private _nodesToProcess = [[_firstStartNodeTrack]];
private _nodeMap = [];
while { count _nodesToProcess > 0 } do {
	private _currentNodeToProcess = _nodesToProcess deleteAt 0;
	private _currentNodeTrack = _currentNodeToProcess select 0;
	private _nodeSeen = false;
	{
		if(_x select 0 == _currentNodeTrack) exitWith {
			_nodeSeen = true;
		};
	} forEach _nodeMap;
	if(!_nodeSeen) then {
		private _connectedNodes = _currentNodeToProcess call ATRAIN_fnc_findPathsToNearestNodes;
		_nodeMap pushBack [_currentNodeTrack,_connectedNodes];
		{
			_x params ["_connectedNodeTrack","_path","_pathDistance","_connectionTracks"];
			private _reversePathCopy = +_path;
			reverse _reversePathCopy;
			private _connectionTracksReversed = [];
			{
				_connectionTracksReversed pushBack [_x select 0, (_x select 1) vectorMultiply -1];
			} forEach _connectionTracks;
			_nodesToProcess pushBack [_connectedNodeTrack,[_currentNodeTrack,_reversePathCopy,_pathDistance,_connectionTracksReversed]];
			if(missionNamespace getVariable ["ATRAIN_Track_Debug_Enabled",false]) then {
				{
					[_x] call ATRAIN_fnc_createMarker;
				} forEach _path;
			};
		} forEach _connectedNodes;
	};
};
_nodeMap;
