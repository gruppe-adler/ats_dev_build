params ["_event","_eventParams"];

// change from player to train as the central object makes things *way* easier for AI control
private _train = player getVariable ["ATRAIN_Current_Train",objNull];

if(_event == "KeyDown") then {
	if(_eventParams select 1 in (actionKeys "MoveBack")) then {
		_train setVariable ["ATRAIN_Remote_Movement_Direction", -1, true];
	};
	if(_eventParams select 1 in (actionKeys "MoveForward")) then {
		_train setVariable ["ATRAIN_Remote_Movement_Direction", 1, true];
	};
	if(_eventParams select 1 in (actionKeys "TurnRight")) then {
		_train setVariable ["ATRAIN_Remote_Turn_Direction", 1, true];
	};
	if(_eventParams select 1 in (actionKeys "TurnLeft")) then {
		_train setVariable ["ATRAIN_Remote_Turn_Direction", -1, true];
	};
	if((_eventParams select 1 == 48) or (_eventParams select 1 in (actionKeys "carHandBrake"))) then {  //B
		_train setVariable ["ATRAIN_Remote_brake_Enabled", true, true];
	};
	if(_eventParams select 1 == 35) then {  //H
		_train setVariable ["ATRAIN_Remote_Horn_Enabled", true, true];
	};
	if(_eventParams select 1 == 34) then {  //G
		_train setVariable ["ATRAIN_Remote_Bell_Enabled", true, true];
	};
	if((_eventParams select 1 == 156) or (_eventParams select 1 in (actionKeys "personView"))) then {  //Numpad Enter
		if(missionNamespace getVariable ["ATRAIN_3rd_Person_Camera_Distance",8] == 3) then {
			ATRAIN_3rd_Person_Camera_Distance = 8;
		} else {
			ATRAIN_3rd_Person_Camera_Distance = 3;
		};
	};	
	if(_eventParams select 1 == 18) then {  //E
		// Toggle engine on/off when not moving
		private _train = player getVariable ["ATRAIN_Current_Train",objNull];
		if(!isNull _train) then {
			private _trainSpeed = abs (_train getVariable ["ATRAIN_Velocity",0]);
			if(_trainSpeed == 0) then {
				private _enginedEnabled = _train getVariable ["ATRAIN_Remote_Engine_Enabled", true];
				_train setVariable ["ATRAIN_Remote_Engine_Enabled", !_enginedEnabled, true];
			};
		};
	};
};

if(_event == "KeyUp") then {
	if(_eventParams select 1 in (actionKeys "Headlights")) then {
        [] call ATRAIN_fnc_toggleLights;
	};
	if(_eventParams select 1 in (actionKeys "MoveBack")) then {
		_train setVariable ["ATRAIN_Remote_Movement_Direction", 0, true];
	};
	if(_eventParams select 1 in (actionKeys "MoveForward")) then {
		_train setVariable ["ATRAIN_Remote_Movement_Direction", 0, true];
	};
	if(_eventParams select 1 in (actionKeys "TurnRight")) then {
		_train setVariable ["ATRAIN_Remote_Turn_Direction", 0, true];
	};
	if(_eventParams select 1 in (actionKeys "TurnLeft")) then {
		_train setVariable ["ATRAIN_Remote_Turn_Direction", 0, true];
	};
	if(_eventParams select 1 == 46) then {  // C
		[] call ATRAIN_fnc_toggleCruiseControl;
	};
	if((_eventParams select 1 == 48) or (_eventParams select 1 in (actionKeys "carHandBrake"))) then {  //B
		_train setVariable ["ATRAIN_Remote_brake_Enabled", false, true];
	};
	if((_eventParams select 1 == 211) or (_eventParams select 1 in (actionKeys "GetOut"))) then { // Delete
		[] call ATRAIN_fnc_exitTrain;
	};
	if(_eventParams select 1 == 35) then {  //H
		_train setVariable ["ATRAIN_Remote_Horn_Enabled", false, true];
	};
	if(_eventParams select 1 == 34) then {  //G
		_train setVariable ["ATRAIN_Remote_Bell_Enabled", false, true];
	};
};
