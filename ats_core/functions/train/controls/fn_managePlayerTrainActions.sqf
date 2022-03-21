ATRAIN_Player_Actions = missionNamespace getVariable ["ATRAIN_Player_Actions",[]];
// start a player's eyes
private _searchStartPointASL = eyePos player;
// end 2 meters in front of where player is looking
private _searchEndPointASL = _searchStartPointASL vectorAdd ((_searchStartPointASL vectorFromTo (ATLtoASL screenToWorld [0.5,0.5])) vectorMultiply 2);
private _objects = lineIntersectsWith [_searchStartPointASL,_searchEndPointASL];
private _trainFound = objNull;
{
	if(count ([_x] call ATRAIN_fnc_getTrainDefinition) > 0) exitWith {
		_trainFound = _x;
	};
} forEach _objects;

if(!isNull _trainFound && count ATRAIN_Player_Actions == 0) then {
	private _trainDef = [_trainFound] call ATRAIN_fnc_getTrainDefinition;
	_trainDef params ["_className", "_isDrivable", "_isRideable"];
	private _isDerailed = _trainFound getVariable ["ATRAIN_Remote_Train_Car_Derailed",false];
	
	if(_isDerailed) exitWith {};
	
	// Add actions
	if(_isDrivable) then {
		private _mainEngine = _trainFound getVariable ["ATRAIN_Current_Train", _trainFound];
		private _currentDriver = _mainEngine getVariable ["ATRAIN_Remote_Driver", objNull];
		private _isKilled = _trainFound getVariable ["ATRAIN_Remote_Killed", false];
		if((isNull _currentDriver || !alive _currentDriver || _currentDriver == player) && !_isKilled) then {		
			private _driveAction = player addAction ["Get in Train as Driver", {
				(_this select 3) params ["_mainEngine","_trainCar"];
				private _currentDriver = _mainEngine getVariable ["ATRAIN_Remote_Driver", objNull];
				if(isNull _currentDriver || !alive _currentDriver || _currentDriver == player) then {	
					[_trainCar] call ATRAIN_fnc_getInTrainDriver;
				};
			},[_mainEngine,_trainFound]];
			ATRAIN_Player_Actions pushBack _driveAction;
		};
	};

	private _mainEngine = _trainFound getVariable ["ATRAIN_Current_Train", _trainFound];
	if((_mainEngine getVariable ["ATRAIN_Velocity",0]) == 0) then {
		private _disconnectAction = player addAction ["Disconnect Car", {
			(_this select 3) params ["_trainCar"];
			[_trainCar] call ATRAIN_fnc_disconnectTrainCar;
		},_trainFound];
		ATRAIN_Player_Actions pushBack _disconnectAction;

		if (vehicleCargoEnabled _trainFound) then {
			{
				private _cargo = _x;
				private _unloadAction = player addAction [("Unload " + ([configFile >> "CfgVehicles" >> typeOf _cargo] call BIS_fnc_displayName)), {
					(_this select 3) params ["_trainCar", "_cargo"];
					objNull setVehicleCargo _cargo;
				},[_trainFound, _cargo]];
				ATRAIN_Player_Actions pushBack _unloadAction;
			} forEach (getVehicleCargo _trainFound);
		};
	};
	
	
	if(_isRideable) then {
		private _isKilled = _trainFound getVariable ["ATRAIN_Remote_Killed", false];
		if(!_isKilled && alive _trainFound) then {
			private _rideAction = player addAction ["Ride Train", {
				[_this select 3] call ATRAIN_fnc_getInTrainPassenger;
			},_trainFound];
			ATRAIN_Player_Actions pushBack _rideAction;
		};
	};
};

if(isNull _trainFound && count ATRAIN_Player_Actions > 0) then {
	{
		player removeAction _x;
	} forEach ATRAIN_Player_Actions;
	ATRAIN_Player_Actions = [];
};

