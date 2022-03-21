params ["_train"];
private _trainPositionASL = getPosASLVisual _train;
private _trainVectorDir = vectorDir _train;
private _offset = _train getVariable ["ATRAIN_Remote_Position_Offset",[0,0,0]];
_trainPositionASL = _trainPositionASL vectorAdd (_offset vectorMultiply -1);
private _tracks = [_trainPositionASL,_train,_trainVectorDir] call ATRAIN_fnc_getTracksAtPosition;

if(count _tracks == 0) then {
	// Search for cup tracks
	private _centerPoint = _trainPositionASL;
	private _sideSearchVectorDirection = (_trainVectorDir vectorCrossProduct [0,0,1]);
	for "_i" from 0 to 25 do
	{
		_centerPoint = _centerPoint vectorAdd (_sideSearchVectorDirection vectorMultiply 0.05);
		_tracks = [_centerPoint, _train] call ATRAIN_fnc_getTracksAtPosition;
		if(count _tracks > 0) exitWith {};
	};
};


private _foundTrack = objNull;
if(count _tracks > 0) then {
	_foundTrack = _tracks select 0;
};
_foundTrack;
