params ["_vehicle",["_positionATL",[0,0,0]]];
private _trainCar = _vehicle;
if(typeName _vehicle == "STRING") then {
	// Create new train car
	_trainCar = createVehicle [_vehicle, _positionATL, [], 0, "CAN_COLLIDE"];
};

private _trainType = [_trainCar] call ATRAIN_fnc_getTypeOf;
_trainType params ["_className","_isStatic"];
if(_isStatic) then {
	_trainCar = [_trainCar] call ATRAIN_fnc_hideTrainReplaceWithNew;
};

if(_trainCar getVariable ["ATRAIN_Remote_Is_Train_Car",false]) exitWith {
	// Train car already created
	_trainCar;
};

private _trainDef = [_trainCar] call ATRAIN_fnc_getTrainDefinition;
if (count _trainDef < 1) exitWith { diag_log "ATS: createTrainCar empty train definition"; };
_trainDef params ["_className", "_isDrivable", "_isRideable", "_carLength", "_maxSpeed", "_positionOffset","_animateTrain", "_isModelReversed", "_particleEffects", "_isCableCar", "_firstPersonPosition", ["_lightOffsets",[]]];
_trainCar setVariable ["ATRAIN_Remote_Car_Length",_carLength,true];
_trainCar setVariable ["ATRAIN_Remote_Train_Max_Velocity",_maxSpeed,true];
_trainCar setVariable ["ATRAIN_Remote_Position_Offset",_positionOffset,true];
_trainCar setVariable ["ATRAIN_Remote_Animate_Train",_animateTrain,true];
_trainCar setVariable ["ATRAIN_Remote_Is_Model_Reversed",_isModelReversed,true];
_trainCar setVariable ["ATRAIN_Remote_Particle_Effects",_particleEffects,true];
_trainCar setVariable ["ATRAIN_Remote_Is_Cable_Car",_isCableCar,true];
_trainCar setVariable ["ATRAIN_Remote_First_Person_Position",_firstPersonPosition,true];
_trainCar setVariable ["ATRAIN_Remote_Is_Train_Car",true,true];
_trainCar setVariable ["ATRAIN_Remote_Killed",!alive _trainCar,true];
_trainCar setVariable ["ATRAIN_Static_Position",[getPosASLVisual _trainCar, [vectorDirVisual _trainCar, vectorUpVisual _trainCar]], true];

[_trainCar] call ATRAIN_fnc_clutchCreate;

if (_isDrivable) then {
	// _trainCar enableSimulationGlobal false;
	
	//if (count _lightOffsets > 0) then {
		[_trainCar] remoteExec ["ATRAIN_fnc_attachLights",0,true];
	//};
	
} else {
	_trainCar enableSimulationGlobal true;
};

[_trainCar] call ATRAIN_fnc_registerTrainCar;
[_trainCar] call ATRAIN_fnc_attachCargo;

_trainCar;