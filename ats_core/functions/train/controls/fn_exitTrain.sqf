
private _train = player getVariable ["ATRAIN_Current_Train",objNull];
private _trainCar = player getVariable ["ATRAIN_Current_Train_Car",objNull];

player setVariable ["ATRAIN_Current_Train", nil];
player setVariable ["ATRAIN_Current_Train_Car", nil];

[] call ATRAIN_fnc_disableTrainPassengerInputHandlers;

if(!isNull _train) then {
	private _trainDriver = _train getVariable ["ATRAIN_Remote_Driver", objNull];
	if(_trainDriver == player) then {
		_train setVariable ["ATRAIN_Remote_Driver", nil, true];
	};
};

if(!isNull _trainCar) then {
	private _trainPos = getPosVisual _trainCar;
	private _trainVectorDir = vectorDirVisual _trainCar;
	private _trainVectorUp = vectorUpVisual _trainCar;
	private _trainVectorLeft = _trainVectorDir vectorCrossProduct _trainVectorUp;
	private _exitPos = _trainPos vectorAdd (_trainVectorLeft vectorMultiply 3);
	private _ground = lineIntersectsSurfaces [
		AGLToASL _exitPos vectorAdd [0,0,6], 
		AGLToASL _exitPos vectorAdd [0,0,-6], 
		player
	];
	if (count _ground == 0) then {
		_exitPos set [2,0];
		player setPos _exitPos;
	} else {
		player setPosASL (_ground select 0 select 0);
	};
	player setdir (getdir player + 180);
};

[player,false] call ATRAIN_fnc_hidePlayerObjectGlobal;
player enableSimulation true;
player allowDamage true;
[] call ATRAIN_fnc_disable3rdPersonCamera;
[] spawn ATRAIN_fnc_disableHud;
