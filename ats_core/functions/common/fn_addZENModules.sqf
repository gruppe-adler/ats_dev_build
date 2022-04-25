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
               if (isNull _trainCar) exitWith {
                 if (_entity isKindOf "Land_Track_01_switch_F") then {
                    [_entity, 312] call ATRAIN_fnc_createSwitchControl;
                    [] call ATRAIN_fnc_closeControlEH;
                 };
               };
               private _trainDef = [_entity] call ATRAIN_fnc_getTrainDefinition;
               _trainDef params ["_className", "_isDrivable", "_isRideable"];
               if (_isDrivable) then {
                    private _train = [_trainCar] call ATRAIN_fnc_getTrain;
                    [_train, 312] call ATRAIN_fnc_createZeusControl;
                    [] call ATRAIN_fnc_closeControlEH;
               } else {
                    player setVariable ["ATRAIN_interfaceOpened", objNull]; // closes zeus control
               };
          }];

          /*
          (findDisplay 312) displayAddEventhandler ["MouseButtonDown", {
               uiNamespace setVariable ["ATS_mouseButtonDown", true];
          }];

          (findDisplay 312) displayAddEventhandler ["MouseButtonUp", {
               uiNamespace setVariable ["ATS_mouseButtonDown", false];
               private _moveCache = missionNamespace setVariable ["ATRAIN_curatorMoveCache", _trainCar];
               if (!isNull _moveCache) then {
                    _moveCache setVariable ["ATRAIN_curatorMoved", false];
                    missionNamespace setVariable ["ATRAIN_curatorMoveCache", objNull];
               };
          }];

          (findDisplay 312) displayAddEventhandler ["MouseMoving", {
               params ["_display", "_xPos", "_yPos"];

               if (count (curatorSelected#0) > 0 && uiNamespace getVariable ["ATS_mouseButtonDown", false]) then {
                    systemChat "moving";
                    private _trainCar = [_entity] call ATRAIN_fnc_isTrain;
                    if (isNull _trainCar) exitWith {};

                    private _trainDef = [_entity] call ATRAIN_fnc_getTrainDefinition;
                    _trainCar setVariable ["ATRAIN_curatorMoved", true];
                    missionNamespace setVariable ["ATRAIN_curatorMoveCache", _trainCar];
               };
          }];

          (findDisplay 312) displayAddEventhandler ["MouseHolding", {
               params ["_display", "_xPos", "_yPos"];

               if (count (curatorSelected#0) > 0 && uiNamespace getVariable ["ATS_mouseButtonDown", false]) then {
                    systemChat "holding";
                    private _trainCar = [_entity] call ATRAIN_fnc_isTrain;
                    if (isNull _trainCar) exitWith {};

                    private _trainDef = [_entity] call ATRAIN_fnc_getTrainDefinition;
                    _trainCar setVariable ["ATRAIN_curatorMoved", true];
                    missionNamespace setVariable ["ATRAIN_curatorMoveCache", _trainCar];
               };
          }];
          */

          _curator addCuratorEditableObjects [(missionNamespace getVariable ["ATRAIN_Registered_TrainEngines", []]), false];
          _curator addCuratorEditableObjects [(missionNamespace getVariable ["ATRAIN_Registered_Levers", []]), false];

     } forEach allcurators;

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

}] call CBA_fnc_waitUntilAndExecute;
