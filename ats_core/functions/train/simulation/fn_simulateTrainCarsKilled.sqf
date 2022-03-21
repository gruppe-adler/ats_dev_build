private _registeredTrainCars = missionNamespace getVariable ["ATRAIN_Registered_Train_Cars",[]];
{
	private _trainCar = _x;
	private _isKilled = _trainCar getVariable ["ATRAIN_Remote_Killed", false];
	private _isKilledHandled = _trainCar getVariable ["ATRAIN_Local_Killed_Handled", false];
	if(_isKilled && !_isKilledHandled) then {
		private _train = [_trainCar] call ATRAIN_fnc_getTrain;
		if(!isNull _trainCar) then {
			_trainCar setVariable ["ATRAIN_Local_Killed_Handled", true];
			// If TNT or is current engine, blow up nearby cars
			if(_trainCar isKindOf "ATS_Trains_A2Wagon_TNT" || _trainCar == ([_train] call ATRAIN_fnc_getTrainEngine)) then {
				"Bo_GBU12_LGB" createVehicleLocal (ASLToAGL (getPosASLVisual _trainCar));
				private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
				private _trainCarIndex = _trainCars find _trainCar;
				if(_trainCarIndex > 0) then {
					[_trainCars select (_trainCarIndex-1)] spawn {
						params ["_car"];
						sleep (random 1);
						[_car] call ATRAIN_fnc_handleKilled;
					};
				};
				if(_trainCarIndex < ((count _trainCars) - 1)) then {
					[_trainCars select (_trainCarIndex+1)] spawn {
						params ["_car"];
						sleep (random 1);
						[_car] call ATRAIN_fnc_handleKilled;
					};
				};
			} else {
				"HelicopterExploBig" createVehicleLocal (ASLToAGL (getPosASLVisual _trainCar));
			};
			_trainCar setDamage 1;
			_trainCar enableSimulationGlobal true;
			/*
			[_trainCar] spawn {
				params ["_localTrainCar"];
				sleep 2;
				// _localTrainCar enableSimulationGlobal false;
			};*/
			private _currentTrainCar = player getVariable ["ATRAIN_Current_Train_Car",objNull];
			if(_trainCar == _currentTrainCar) then {
				[] spawn {
					sleep 3;
					[] call ATRAIN_fnc_exitTrain;
					player setDamage 1;
				};
			};
		};
	};
} forEach _registeredTrainCars;