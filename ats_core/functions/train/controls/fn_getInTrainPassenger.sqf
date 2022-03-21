params ["_trainCar"];

private _trainRideCondition = call ATRAIN_fnc_getTrainRideCondition;
_trainRideCondition params ["_rideCondition","_rideConditionMessage"];
if(!([player] call _rideCondition)) exitWith {
	hint _rideConditionMessage;
};

_trainCar = [_trainCar] call ATRAIN_fnc_createTrainCar;
player setVariable ["ATRAIN_Current_Train_Car",_trainCar];
[player,true] call ATRAIN_fnc_hidePlayerObjectGlobal;
// player enableSimulationGlobal false;
player allowDamage false;
[_trainCar, _trainCar getVariable "ATRAIN_Remote_First_Person_Position"] call ATRAIN_fnc_enable3rdPersonCamera;
[] call ATRAIN_fnc_enableTrainPassengerInputHandlers;
["<t size='0.6'>Press [delete] to exit train</t>",0.02,0.9,5,2,0,3001] spawn bis_fnc_dynamicText;