params ["_train"];
private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];
_train setVariable ["ATRAIN_Train_Derailed",true,true];
_train setVariable ["ATRAIN_Train_Derailed_Speed",_trainVelocity,true];
private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
{
	_x setVariable ["ATRAIN_Remote_Train_Car_Derailed",true,true];
} forEach _trainCars;