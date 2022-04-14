
ATRAIN_Has_Trains_Addon = isClass (configFile >> "cfgPatches" >> "ATS_Trains");

ATRAIN_Train_Definitions = missionNamespace getVariable ["ATRAIN_Train_Definitions",[]];

// [Class Name, Is Drivable, Is Rideable, Length In Meters, maxspeed, Model Position Offset, Animate Train, Is Direction Reversed, Particle Effects, Is Cable Car, lightOffsets (((frontWhite,frontWhite,frontWhite),(frontRed,frontRed,frontRed)),((backWhite,backWhite,backWhite),(backRed,backRed,backRed)))]
ATRAIN_Train_Definitions append [

	// Arma 3
	["Land_Locomotive_01_v1_F", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["Land_Locomotive_01_v2_F", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["Land_Locomotive_01_v3_F", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["Land_RailwayCar_01_passenger_F", false, true, 5.5, 12, [0,0,0.06],true,false, [], false, [-0.6,1.3,-1]],
	["Land_RailwayCar_01_sugarcane_empty_F", false, true, 3.2, 12, [0,0,0.052],true,false, [], false, [0,0,0]],
	["Land_RailwayCar_01_sugarcane_F", false, false, 3.2, 12, [0,0,0.052],true,false, [], false, [0,0,0]],
	["Land_RailwayCar_01_tank_F", false, false, 5.5, 12, [0,0,0.08],true,false, [], false, [0,0,0]],
	
	// Arma 3 (Wrapper)
	["ATS_Trains_A3_Loco_1", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["ATS_Trains_A3_Loco_2", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["ATS_Trains_A3_Loco_3", true, false, 5.3, 12, [0,0,0.052],true,false, [], false, [1.2,-0.8,-0.6]],
	["ATS_Trains_A3_Passenger", false, true, 5.5, 12, [0,0,0.06],true,false, [], false, [-0.6,1.3,-1]],
	["ATS_Trains_A3_Sugar_Empty", false, true, 3.2, 12, [0,0,0.052],true,false, [], false, [0,0,0]],
	["ATS_Trains_A3_Sugar_Full", false, false, 3.2, 12, [0,0,0.052],true,false, [], false, [0,0,0]],
	["ATS_Trains_A3_Tank", false, false, 5.5, 12, [0,0,0.08],true,false, [], false, [0,0,0]],

	// CUP
	["Land_loco_742_blue", true, false, 13.5, 19.4, [0,-0.06,-0.14],false,false, [], false, [1.1,-3.4,-1.3]],
	["Land_loco_742_red", true, false, 13.5, 19.4, [0,-0.06,-0.14],false,false, [], false, [1.1,-3.4,-1.3]],
	["Land_wagon_box", false, true, 12, 19.4, [0,-0.43,0.02],false,false, [], false, [-0.8,0.1,-0.9]],
	["Land_wagon_flat", false, true, 17.1, 19.4, [0,-0.02,0.04],false,false, [], false, [0,0,0.5]],
	["Land_wagon_tanker", false, false, 11.5, 19.4, [0,-0.05,0.02],false,false, [], false, [0,0,0]],
	
	// Arma 2
	["ATS_Trains_A2Locomotive_Blue", true, false, 13.5, 19.4, [0,-0.03,-0.04],true,true, [], false, [-1.1,-3.4,-1.3],[[[[-0.71,6,-0.097],[0.71,6,-0.097],[0,6,1.67]],[[-0.71,6,-0.349],[0.71,6,-0.349]]],[[[-0.71,-6,-0.0969486],[0.71,-6,-0.0939875],[0,-6,1.67]],[[-0.71,-6,-0.349],[0.71,-6,-0.349]]]]],
	["ATS_Trains_A2Locomotive_Red", true, false, 13.5, 19.4, [0,-0.03,-0.04],true,true, [], false, [-1.1,-3.4,-1.3],[[[[-0.71,6,-0.097],[0.71,6,-0.097],[0,6,1.67]],[[-0.71,6,-0.349],[0.71,6,-0.349]]],[[[-0.71,-6,-0.0969486],[0.71,-6,-0.0939875],[0,-6,1.67]],[[-0.71,-6,-0.349],[0.71,-6,-0.349]]]]],
	["ATS_Trains_A2Wagon_Box", false, true, 12, 19.4, [0, 0, 0],false,false, [], false, [-0.8,0.1,-0.9]],
	["ATS_Trains_A2Wagon_Flat", false, true, 17.1, 19.4, [0,0,0],false,false, [], false, [0,0,-3.5]],
	["ATS_Trains_A2Wagon_Tanker", false, false, 11.5, 19.4, [0,0,0],false,false, [], false, [0,0,0]],
	["ATS_Trains_A2Wagon_TNT", false, true, 12, 19.4, [0, 0, 0],false,false, [], false, [-0.8,0.1,-0.9]],

	// Custom
	["ATS_Trains_Steam_Small", true, false, 12, 19.4, [0,0.03,0],false,false, [["steam","steam"]], false, [0.6,0,-1.1] ],
	["ATS_Trains_Steam_Large", true, false, 12.5, 19.4, [0,0.05,-0.05],false,false, [["steam","steam"]], false , [1,-2.3,-1.2]],
	["ATS_Trains_Cable_Car", true, true, 2, 8, [0,0,-7.32],false,false, [], true, [0,0,0]],
	["ATS_Trains_AE_Engine", true, false, 19.6, 40, [0,0,0.04],true,false, [], false, [0.5,6.8,-1.3] ],
	["ATS_Trains_AE_Wagon", false, true, 24, 40, [0,0,0.04],true,false, [], false, [-0.9,-0.2,-1.8] ],
	["ATS_Trains_SD60_Engine", true, false, 20, 31.1, [0,0.05,0.04],false,false, [], false, [1.8,7.4,-1.3] ],
	["ATS_Trains_SD60_Flatbed", false, true, 17.25, 31.1, [0,0.05,0.04],false,false, [], false, [0,0,0] ],
	["ATS_Trains_SD60_Oil_Tank", false, false, 17.5, 31.1, [0,0.05,0.04],false,false, [], false, [0,0,0] ],
	["ATS_Trains_SD60_Open_Wagon", false, true, 16, 31.1, [0,0.05,0.04],false,false, [], false, [1.1,0.1,0.2] ],
	["ATS_Trains_SD60_Covered_Wagon", false, true, 18, 31.1, [0,0.05,0.04],false,false, [], false, [2,0,-1.8] ],
	["ATS_Trains_SD60_Covered_Wagon_Black", false, true, 18, 31.1, [0,0.05,0.04],false,false, [], false, [2,0,-1.8] ],
	["ATS_Trains_SD60_Covered_Wagon_Blue", false, true, 18, 31.1, [0,0.05,0.04],false,false, [], false, [2,0,-1.8] ],
	["ATS_Trains_SD60_Covered_Wagon_Green", false, true, 18, 31.1, [0,0.05,0.04],false,false, [], false, [2,0,-1.8] ],
	["ATS_Trains_SD60_Covered_Wagon_Grey", false, true, 18, 31.1, [0,0.05,0.04],false,false, [], false, [2,0,-1.8] ],
	["ATS_Trains_VL_Elgolova", true, true, 18.8, 19.4, [0,0,0],false,true, [], false, [0.7,-7.89999,-2]],
	["ATS_Trains_VL_EW", true, true, 18.8, 19.4, [0,0,0],false,true, [], false, [-1,-1.7,-1.5]],
	["ATS_Trains_VL_EE", true, true, 18.8, 19.4, [0,0,0],false,true, [], false, [-1,-1.7,-3.1]],
	["ATS_Trains_VL_M62", true, true, 17.35, 19.4, [0,0.03,-0.12],false,true, [], false, [-0.9,-6.9,-1.6]],
	["ATS_Trains_VL_VL10", true, false, 16, 19.4, [0,0,0],false,true, [], false, [0.9,-6.4,-2.9]],
	["ATS_Trains_VL_TVZ", true, true, 23.5, 19.4, [0,0,0],false,true, [], false, [1.1,0.3,-2]],
	["ATS_Trains_VL_CH4", true, true, 19.5, 19.4, [0,0,0],false,true, [], false, [0.7,8.09999,-2.9]],
	["ATS_Trains_VL_CI", false, false, 12, 19.4, [0,0,0],false,true, [], false, [0,0,0]],
	["ATS_Trains_Metro_Car_LA", true, true, 21.7, 12, [0,0,0.04],true,false, [], false, [-0.8,9.7,-3]]
];

ATRAIN_Object_Model_To_Type_Map = missionNamespace getVariable ["ATRAIN_Object_Model_To_Type_Map",[]];

ATRAIN_Object_Model_To_Type_Map append [
	["locomotive_01_v1_f.p3d",["Land_Locomotive_01_v1_F",true]],
	["locomotive_01_v2_f.p3d",["Land_Locomotive_01_v2_F",true]],
	["locomotive_01_v3_f.p3d",["Land_Locomotive_01_v3_F",true]],
	["railwaycar_01_passenger_f.p3d",["Land_RailwayCar_01_passenger_F",true]],
	["railwaycar_01_sugarcane_empty_f.p3d",["Land_RailwayCar_01_sugarcane_empty_F",true]],
	["railwaycar_01_sugarcane_f.p3d",["Land_RailwayCar_01_sugarcane_F",true]],
	["railwaycar_01_tank_f.p3d",["Land_RailwayCar_01_tank_F",true]],
	["ats_trains_steam_small.p3d",["ATS_Trains_Steam_Small",true]],
	["ats_trains_steam_large.p3d",["ATS_Trains_Steam_Large",true]],
	["ats_trains_cable_car.p3d",["ATS_Trains_Cable_Car",true]],
	["ats_trains_sd60_engine.p3d",["ATS_Trains_SD60_Engine",true]],
	["ats_trains_sd60_flatbed.p3d",["ATS_Trains_SD60_Flatbed",true]],
	["ats_trains_sd60_oil_tank.p3d",["ATS_Trains_SD60_Oil_Tank",true]],
	["ats_trains_sd60_open_wagon.p3d",["ATS_Trains_SD60_Open_Wagon",true]],
	["ats_trains_sd60_covered_wagon.p3d",["ATS_Trains_SD60_Covered_Wagon",true]],
	["ats_trains_sd60_covered_wagon_black.p3d",["ATS_Trains_SD60_Covered_Wagon_Black",true]],
	["ats_trains_sd60_covered_wagon_blue.p3d",["ATS_Trains_SD60_Covered_Wagon_Blue",true]],
	["ats_trains_sd60_covered_wagon_green.p3d",["ATS_Trains_SD60_Covered_Wagon_Green",true]],
	["ats_trains_sd60_covered_wagon_grey.p3d",["ATS_Trains_SD60_Covered_Wagon_Grey",true]],
	["ats_trains_ae_engine.p3d",["ATS_Trains_AE_Engine",true]],
	["ats_trains_ae_wagon.p3d",["ATS_Trains_AE_Wagon",true]],
	["metro.p3d",["ATS_Trains_Metro_Car_LA",true]]
	
	
];

[] call ATRAIN_fnc_rebuildArrayLookupIndexes;

if (isServer) then {
	{ 
		private _candidate = _x;
		private _trainCar = [_candidate] call ATRAIN_fnc_isTrain;
        if (!isNull _trainCar) then {
        	private _trainDef = [_trainCar] call ATRAIN_fnc_getTrainDefinition;
			_trainDef params ["_className", "_isDrivable", "_isRideable", "_carLength", "_maxSpeed", "_positionOffset","_animateTrain", "_isModelReversed", "_particleEffects", "_isCableCar", "_firstPersonPosition", ["_lightOffsets",[]]];
			if (_isDrivable) then {
            	private _train = [_trainCar] call ATRAIN_fnc_getTrain;
            	_train = [_trainCar] call ATRAIN_fnc_createTrain;
            	diag_log "ATS: creating server train";
            	_train setVariable ["ATRAIN_Remote_Cruise_Control_Enabled", true, true];
            };
        };
	} forEach allMissionObjects "all";
};


// Start train drawing handler

if (isServer) then {
	addMissionEventHandler ["EachFrame", {call ATRAIN_fnc_drawEventHandler}];
};

// Start player action handler
if(hasInterface) then {
	[] spawn {
		while {true} do {
			[] call ATRAIN_fnc_managePlayerTrainActions;
			sleep 0.1;
		};
	};
};

// Start train particle effects simulation handler
[] spawn {
	while {true} do {
		private _registeredTrains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
		{
			[_x] call ATRAIN_fnc_simulateTrainParticleEffects;
		} forEach _registeredTrains;
		sleep 1;
	};
};

// Start train simulation handlers
if (isServer) then {
	[] spawn {
		while {true} do {
			private _registeredTrains = missionNamespace getVariable ["ATRAIN_Registered_Trains",[]];
			{
				if(_x getVariable ["ATRAIN_Calculations_Queued",true]) then {
					[_x] call ATRAIN_fnc_simulateTrainVelocity;
					[_x] call ATRAIN_fnc_simulateTrain;
					[_x] call ATRAIN_fnc_simulateTrainAttachment;
					[_x] call ATRAIN_fnc_simulateTrainSound;
					_x setVariable ["ATRAIN_Calculations_Queued",false];
				};
			} forEach _registeredTrains;
			sleep 0.1;
		};
	};
};

// Start attach player to moving train handler
if(hasInterface) then {
	[] spawn {
		while {true} do {
			private _ridingOnTrain = player getVariable ["ATRAIN_Riding_On_Train", objNull];
			private _currentPassengerCar = player getVariable ["ATRAIN_Current_Train_Car",objNull];
			if(isNull _ridingOnTrain && isNull _currentPassengerCar) then {
				if((getPosATL player) select 2 > 0.5) then {
					private _train = [player] call ATRAIN_fnc_getTrainUnderPlayer;
					if(!isNull _train) then {
						player setVariable ["ATRAIN_Riding_On_Train", _train];
						[player,_train] spawn ATRAIN_fnc_rideOnTrain;
					};
				};
			};
			sleep 0.5;
		};
	};
};

// Update player position to follow train
if(hasInterface) then {
	[] spawn {
		while {true} do {
			private _currentCar = player getVariable ["ATRAIN_Current_Train_Car",objNull];
			if(!isNull _currentCar) then {
				player setPos (getPos _currentCar);
			};
			sleep 5;
		};
	};
};

// Start train car killed simulation handler
[] spawn {
	while {true} do {
		[] call ATRAIN_fnc_simulateTrainCarsKilled;
		sleep 0.1;
	};
};

// Draw static train cars if not connected to train
[] spawn {
	while {true} do {
		private _registeredCars = missionNamespace getVariable ["ATRAIN_Registered_Train_Cars",[]];
		{
			private _trainCar = _x;
			if(isNull _trainCar) then {
				_trainCar = [_trainCar] call ATRAIN_fnc_createTrainCar;
			};
			private _currentTrain = _trainCar getVariable ["ATRAIN_Current_Train",objNull];
			private _staticPosition = _trainCar getVariable ["ATRAIN_Static_Position",nil];
			if(isNull _currentTrain && !isNil "_staticPosition") then {
				_trainCar setPosASL (_staticPosition select 0);
				_trainCar setVectorDirAndUp (_staticPosition select 1);
				// _trainCar enableSimulationGlobal false;
			};
		} forEach _registeredCars;
		sleep 10;
	};
};


// Start train derailment simulation handler
/*
[] spawn {
	while {true} do {
		private _registeredCars = missionNamespace getVariable ["ATRAIN_Registered_Train_Cars",[]];
		private _trainCarsDerailed = [];
		{
			private _trainCar = _x;
			private _trainCarLocal = _trainCar getVariable ["ATRAIN_Local_Copy", objNull];
			private _train = _trainCar getVariable ["ATRAIN_Current_Train", objNull];
			private _trainCarDerailed = _trainCar getVariable ["ATRAIN_Remote_Train_Car_Derailed",false];
			private _trainDerailedSimulated = _trainCar getVariable ["ATRAIN_Local_Train_Derailed_Simulated",false];
			if(_trainCarDerailed && !_trainDerailedSimulated && !isNull _trainCarLocal) then {
				_trainCarLocal enableSimulation true;
				_trainCar setVariable ["ATRAIN_Local_Train_Derailed_Simulated",true];
				_trainCarsDerailed pushBack _trainCar;
				if(random 1 > 0.9) then {
					[_trainCar] call ATRAIN_fnc_handleKilled;
				};
			};
		} forEach _registeredCars;
		if(count _trainCarsDerailed > 0) then {
			[_trainCarsDerailed] spawn {
				params ["_trainCarsDerailed"];
				sleep 10;
				{
					private _trainCar = _x;
					private _trainCarLocal = _trainCar getVariable ["ATRAIN_Local_Copy", objNull];
					private _train = _trainCar getVariable ["ATRAIN_Current_Train", objNull];
					if(random 1 > 0.7) then {
						[_trainCar] call ATRAIN_fnc_handleKilled;
						sleep (1 + (random 2));
					};
					_trainCarLocal enableSimulation false;
				} forEach _trainCarsDerailed;
			};
		};
		sleep 0.1;
	};
};
*/
