params [["_vehicle",objNull],["_positionATL",[0,0,0]]];

private _trainCar = [_vehicle, _positionATL] call ATRAIN_fnc_getOrCreateTrainCar;

if (!isNull ([_trainCar] call ATRAIN_fnc_getTrain)) exitWith { diag_log "train already there"; };

private _train = createVehicle ["Land_Locomotive_01_v1_F", [-1000,-1000,2000], [], 0, "CAN_COLLIDE"];
_train allowDamage false; 
_train enableSimulationGlobal false;
[_train, true, true] call ATRAIN_fnc_hideTrainObjectGlobal;
_train setVariable ["ATRAIN_Node_Path", nil, true];
_train setVariable ["ATRAIN_Node_Path_Distance", nil, true];
_train setVariable ["ATRAIN_Remote_Driver", nil, true];
_train setVariable ["ATRAIN_Remote_Train_Max_Velocity",_trainCar getVariable ["ATRAIN_Remote_Train_Max_Velocity",12],true];

//_trainCar setVariable ["ATRAIN_Is_Backwards", false, true];
_trainCar setVariable ["ATRAIN_Current_Train", _train, true];
_trainCar setVariable ["ATRAIN_Offset_From_Engine", 0, true];
_train setVariable ["ATRAIN_Remote_Engine", _trainCar, true];	
_train setVariable ["ATRAIN_Remote_Train_Cars", [_trainCar], true];
_train setVariable ["ATRAIN_Rear_Car", _trainCar, true];
_train setVariable ["ATRAIN_Front_Car", _trainCar, true];
_train setVariable ["ATRAIN_Car_Count", 1, true];

[_train] call ATRAIN_fnc_registerTrain;

_train;