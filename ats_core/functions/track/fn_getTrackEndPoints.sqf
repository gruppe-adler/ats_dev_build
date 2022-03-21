params ["_track"];
private _trackDef = [_track] call ATRAIN_fnc_getTrackDefinition;
if(count _trackDef == 0) exitWith {[];};
_trackDef params ["_className","_centerOffset","_isIntersection","_isTermination",["_heightOffset",0],["_map",[]]];
if(count _map == 0) then {
	private _obj = _className createVehicleLocal [0,0,1000];
	if(!isNull _obj) then {
		_obj enableSimulation false;
		_obj allowDamage false;
		_map =  [_obj selectionPosition "map1", _obj selectionPosition "map2", _obj selectionPosition "map3"];
		deleteVehicle _obj;
		
		if("CUP_Railway_rails_v_LB_RE" == _className) then {
			_map =  [(_map select 0) vectorAdd [0,10,0], _map select 0, _map select 1];
		};
		
		if("CUP_Railway_rails_v_LE_RB" == _className) then {
			_map =  [(_map select 0) vectorAdd [1,-10,0], (_map select 0) vectorAdd [1,6,0], _map select 1];
		};
		
	} else {
		_map = [[0,0,0], [0,0,0], [0,0,0]];
		_trackDef pushBack _map;
	};
	_trackDef pushBack _map;
};
_map params ["_map1", "_map2", "_map3"];
_map1 = _map1 vectorAdd [0,0,_heightOffset];
_map2 = _map2 vectorAdd [0,0,_heightOffset];
_map3 = _map3 vectorAdd [0,0,_heightOffset];
private _trackEndPoints = [AGLtoASL (_track modelToWorld (_map1)), AGLtoASL (_track modelToWorld (_map2))];
if(_isIntersection) then {
	_trackEndPoints pushBack (AGLtoASL (_track modelToWorld (_map3)));
};
//diag_log str [_trackDef, _trackEndPoints];
_trackEndPoints;