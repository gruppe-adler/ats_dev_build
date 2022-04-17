params ["_trainCar"];

private _trainDriveCondition = call ATRAIN_fnc_getTrainDriveCondition;
_trainDriveCondition params ["_driveCondition","_driveConditionMessage"];
if(!([player] call _driveCondition)) exitWith {
	hint _driveConditionMessage;
};

private _trainCar = [_trainCar] call ATRAIN_fnc_getOrCreateTrainCar;
private _train = [_trainCar] call ATRAIN_fnc_getTrain;
if(isNull _train) then {
	_train = [_trainCar] call ATRAIN_fnc_createTrain;
};
player setVariable ["ATRAIN_Current_Train",_train];
player setVariable ["ATRAIN_Current_Train_Car",_trainCar];
_train setVariable ["ATRAIN_Remote_Driver", player, true];

[player,true] call ATRAIN_fnc_hidePlayerObjectGlobal;
// player enableSimulationGlobal false;
player allowDamage false;
[_trainCar, _trainCar getVariable "ATRAIN_Remote_First_Person_Position"] call ATRAIN_fnc_enable3rdPersonCamera;
[] spawn ATRAIN_fnc_enableHud;
["<t size='0.6'>Press [delete] to exit train</t>",0.02,0.9,5,2,0,3001] spawn bis_fnc_dynamicText;