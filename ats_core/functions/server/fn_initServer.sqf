if(isServer) then {
	
	// Remotely installs ATS (if clients doesn't have it installed)
	[[], {
		if(isNil "ATRAIN_fnc_init") then {
			if(!isNil "ExileClient_system_network_send") then {
				waitUntil { (missionNamespace getVariable ["ExileClientSessionId",""]) != "" };
				["AdvancedTrainSimulatorRemoteExecServer",[[clientOwner],"ATRAIN_fnc_requestATSInstall",false]] call ExileClient_system_network_send;
			} else {
				[clientOwner] remoteExec ["ATRAIN_fnc_requestATSInstall", 2];
			};
		};
	}] remoteExec ["spawn", -2, true];

	// Adds support for exile network calls (Only used when running exile) //

	ExileServer_AdvancedTrainSimulator_network_AdvancedTrainSimulatorRemoteExecServer = {
		params ["_sessionId", "_messageParameters",["_isCall",false]];
		_messageParameters params ["_params","_functionName"];
		if(_isCall) then {
			_params call (missionNamespace getVariable [_functionName,{}]);
		} else {
			_params spawn (missionNamespace getVariable [_functionName,{}]);
		};
	};

	ExileServer_AdvancedTrainSimulator_network_AdvancedTrainSimulatorRemoteExecClient = {
		params ["_sessionId", "_messageParameters"];
		_messageParameters params ["_params","_functionName","_target",["_isCall",false]];
		if(_isCall) then {
			_params remoteExecCall [_functionName, _target];
		} else {
			_params remoteExec [_functionName, _target];
		};
	};
	
	// Disable trains once they stop moving and have no driver
	/*
	[] spawn {
		while {true} do {
			private _unregisterTrains = [];
			private _registeredTrains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
			{
				private _train = _x;
				private _driver = _train getVariable ["ATRAIN_Remote_Driver", objNull];
				private _velocity = _train getVariable ["ATRAIN_Velocity",0];
				private _trainDerailed = _train getVariable ["ATRAIN_Train_Derailed",false];
				if(_trainDerailed && _velocity == 0) then {
					{
						if(_x getVariable ["ATRAIN_Remote_Train_Car_Derailed", false]) then {
							private _localCar = _x getVariable ["ATRAIN_Local_Copy", _x];
							_x setVariable ["ATRAIN_Current_Train",nil,true];
							_x setVariable ["ATRAIN_Static_Position",[getPosASLVisual _localCar, [vectorDirVisual _localCar, vectorUpVisual _localCar]], true];
						};
					} forEach ([_train] call ATRAIN_fnc_getTrainCars);
					if(_train getVariable ["ATRAIN_Remote_Train_Car_Derailed", false]) then {
						_unregisterTrains pushBack _train;
					} else {
						if(!isNull _driver) then {
							[_train] call ATRAIN_fnc_createTrain;
						};
					};
					_train setVariable ["ATRAIN_Train_Derailed",nil,true];
				};
				if(isNull _driver && _velocity == 0) then {
					_unregisterTrains pushBack _train;
					{
						private _localCar = _x getVariable ["ATRAIN_Local_Copy", _x];
						_x setVariable ["ATRAIN_Current_Train",nil,true];
						_x setVariable ["ATRAIN_Static_Position",[getPosASLVisual _localCar, [vectorDirVisual _localCar, vectorUpVisual _localCar]], true];
					} forEach ([_train] call ATRAIN_fnc_getTrainCars);
				};
			} forEach _registeredTrains;
			if(count _unregisterTrains > 0) then {
				_registeredTrains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
				_registeredTrains = _registeredTrains - _unregisterTrains;
				missionNamespace setVariable ["ATRAIN_Registered_Trains",_registeredTrains, true];
			};
			sleep 10;
		};
	};
	*/
	
};