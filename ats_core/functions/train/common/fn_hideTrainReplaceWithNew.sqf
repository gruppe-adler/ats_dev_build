/*

	// Swap out A3 trains with custom wrappers if addon is installed	

*/

params ["_train"];

private _newTrain = objNull;
private _trainType = [_train] call ATRAIN_fnc_getTypeOf;
_trainType params ["_className","_isStatic"];

if(ATRAIN_Has_Trains_Addon) then {
	if(_className == "Land_Locomotive_01_v1_F") then { _className = "ATS_Trains_A3_Loco_1" };
	if(_className == "Land_Locomotive_01_v2_F") then { _className = "ATS_Trains_A3_Loco_2" };
	if(_className == "Land_Locomotive_01_v3_F") then { _className = "ATS_Trains_A3_Loco_3" };
	if(_className == "Land_RailwayCar_01_passenger_F") then { _className = "ATS_Trains_A3_Passenger" };
	if(_className == "Land_RailwayCar_01_sugarcane_empty_F") then { _className = "ATS_Trains_A3_Sugar_Empty" };
	if(_className == "Land_RailwayCar_01_sugarcane_F") then { _className = "ATS_Trains_A3_Sugar_Full" };
	if(_className == "Land_RailwayCar_01_tank_F") then { _className = "ATS_Trains_A3_Tank" };
};

private _position = (ASLToAGL getPosASLVisual _train);
private _vectorDir = vectorDir _train;
private _vectorUp = vectorUp _train;
deleteVehicle _train;

private _newTrain = createVehicle [_className, _position, [], 0, "CAN_COLLIDE"];

if (vehicleCargoEnabled _train && {count getVehicleCargo _train > 0}) then {
	{
		objNull setVehicleCargo _x;
		_newTrain setVehicleCargo _x;
		//_x enableSimulation false;
	} forEach (getVehicleCargo _train);
};
_newTrain setVectorDirAndUp [_vectorDir, _vectorUp];
_newTrain setPosASL _position;

_newTrain