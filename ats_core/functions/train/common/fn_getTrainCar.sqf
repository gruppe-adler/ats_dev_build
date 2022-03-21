params ["_trainCar"];
if(_trainCar getVariable ["ATRAIN_Remote_Is_Train_Car",false]) then {
	_trainCar;
} else {
	objNull;
}