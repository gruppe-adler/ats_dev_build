[{
     (isClass(configFile >> "CfgPatches" >> "zen_main")) &&
     !(isNull (findDisplay 312))
}, 
{
     // add handler to show interface
     {
          _curator = _x;
          _curator addEventHandler ["CuratorObjectSelectionChanged",{
               params ["_curator", "_entity"];

               private _trainCar = [_entity] call ATRAIN_fnc_isTrain;
               if (isNull _trainCar) exitWith {};
               private _trainDef = [_entity] call ATRAIN_fnc_getTrainDefinition;
               _trainDef params ["_className", "_isDrivable", "_isRideable"];
               if (_isDrivable) then {
                    private _train = [_trainCar] call ATRAIN_fnc_getTrain;
                    [_train] call ATRAIN_fnc_createZeusControl;
               } else {
                    player setVariable ["ATRAIN_interfaceOpened", objNull]; // closes zeus control
               };
          }];

          
          _curator addEventHandler ["CuratorObjectSelectionChanged", {
                params ["_curator", "_entity"];

                [{
                    (
                         count (curatorSelected select 0) +
                         count (curatorSelected select 1) +
                         count (curatorSelected select 2) +
                         count (curatorSelected select 3)
                     ) == 0
                 },
                 {
                    player setVariable ["ATRAIN_interfaceOpened", objNull]; // closes zeus control
                 }, []] call CBA_fnc_waitUntilAndExecute;
          }];

          _curator addCuratorEditableObjects [(missionNamespace getVariable ["ATRAIN_Registered_TrainEngines", []]), false];

     } forEach allcurators;
    /*
    ["ATS Trains", "Create remote controllable Train", {
         params ["_position", "_object"];

        private _trainCar = [_object] call ATRAIN_fnc_isTrain;

        if (!isNull _trainCar) then {
            private _train = [_trainCar] call ATRAIN_fnc_getTrain;
            _train = [_trainCar] call ATRAIN_fnc_createTrain;
            _train setVariable ["ATRAIN_Remote_Cruise_Control_Enabled", true, true];
            hintSilent "ATRAIN_Remote_Cruise_Control_Enabled TRUE";
            [] call ATRAIN_fnc_createZeusControl;
        } else { hint "not supported train object"; };
                
    }] call zen_custom_modules_fnc_register;

    ["ATS Trains", "Remove remote control from Train", {
         params ["_position", "_object"];

        private _trainCar = [_object] call ATRAIN_fnc_isTrain;

        if (!isNull _trainCar) then {
            private _train = [_trainCar] call ATRAIN_fnc_getTrain;
            _train setVariable ["ATRAIN_Remote_Cruise_Control_Enabled", false, true];
            hintSilent "ATRAIN_Remote_Cruise_Control_Enabled FALSE";
        } else { hint "not supported train object"; };
                
    }] call zen_custom_modules_fnc_register;
    */

    ["ATS Trains", "Lock all Trains", {
         params ["_position", "_object"];

         [{false},"Locked"] call ATRAIN_fnc_setTrainDriveCondition;
         [{false},"Locked"] call ATRAIN_fnc_setTrainRideCondition;
                
    }] call zen_custom_modules_fnc_register;


    ["ATS Trains", "Unlock all Trains", {
         params ["_position", "_object"];

         [{true},""] call ATRAIN_fnc_setTrainDriveCondition;
         [{true},""] call ATRAIN_fnc_setTrainRideCondition;
                
    }] call zen_custom_modules_fnc_register;

    /*
    ["ATS Trains", "Toggle Train Light", {
          params ["_position", "_object"];

          private _trainCar = [_object] call ATRAIN_fnc_isTrain;

          if (!isNull _trainCar) then {
               private _train = [_trainCar] call ATRAIN_fnc_getTrain;
               [_train] call ATRAIN_fnc_toggleLights;
          } else { 
               //systemchat "not a train"; 
          };
                
    }] call zen_custom_modules_fnc_register;


    ["ATS Trains", "Toggle Switch Lever", {
          params ["_position", "_object"];

          if (_object isKindOf "Land_Track_01_switch_F") then {
               private _var = _object getVariable ["ATRAIN_switch", -1];
               if (_var == -1) then {
                    _object animate ["lever_rot", 1, 0.25];
                    _object setVariable ["ATRAIN_switch", 1, true];
               } else {
                    _object animate ["lever_rot", 0, 0.25];
                    _object setVariable ["ATRAIN_switch", -1, true];
               };
          };
                
    }] call zen_custom_modules_fnc_register;
    */

}] call CBA_fnc_waitUntilAndExecute;

