
params ["_train"];

private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;
private _currentSimulationTime = diag_tickTime;
private _lastSimulationTime = _train getVariable ["ATRAIN_Last_Simulation_Time",_currentSimulationTime];
_train setVariable ["ATRAIN_Last_Simulation_Time",_currentSimulationTime];
private _deltaSimulationTime = _currentSimulationTime - _lastSimulationTime;

if(_deltaSimulationTime > (missionNamespace getVariable ["ATS_trainSimulation_Interval", 1])) then {
	_deltaSimulationTime = 0;
};

// Simulate train derailment
private _isDerailed = _train getVariable ["ATRAIN_Train_Derailed",false];
if(_isDerailed) exitWith {
	private _trainDerailedSimulated = _train getVariable ["ATRAIN_Local_Train_Derailed_Simulated",false];
	private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
	if(!_trainDerailedSimulated) then {
		_train setVariable ["ATRAIN_Local_Train_Derailed_Simulated",true];
		private _derailSpeed = _train getVariable ["ATRAIN_Train_Derailed_Speed",0];
		{ 
			private _trainCar = _x;
			private _trainCarVectorDir = vectorDirVisual _trainCar;
			// _trainCar enableSimulationGlobal true;
			private _trainDerailVectorDir = _trainCarVectorDir vectorCrossProduct [0,0,1];
			if(random 1 > 0.5) then {
				_trainDerailVectorDir = _trainDerailVectorDir vectorMultiply -1;
			};
			_trainCar setVelocity ((_trainDerailVectorDir vectorAdd [0,0,0.1]) vectorMultiply 6);
			if(random 1 > 0.7) then {
				[_trainCar] call ATRAIN_fnc_handleKilled;
			};
		} forEach _trainCars;
		_trainCars spawn {
			sleep 20;
			{ 
				private _trainCar = _x;
				_trainCar enableSimulationGlobal false;
			} forEach _this;
		};
	};
	{
		private _trainCar = _x;
		if(simulationEnabled _trainCar) then {
			private _trainCarLength = _trainCar getVariable ["ATRAIN_Remote_Car_Length",6];
			private _trainCarVectorDir = vectorDirVisual _trainCar;
			private _trainCarPosASL = getPosASLVisual _trainCar;
			private _trainCarVectorUp = vectorUpVisual _trainCar;
			private _alignment = [[_trainCarPosASL vectorAdd (_trainCarVectorDir vectorMultiply (_trainCarLength * 0.4))], 
				[_trainCarPosASL vectorAdd (_trainCarVectorDir vectorMultiply (_trainCarLength * -0.4))],_trainCarVectorUp];
			_trainCar setVariable ["ATRAIN_Alignment", _alignment, true];
		};
	} forEach _trainCars;
};

// Braking FX
private _breakEnabled = _train getVariable ["ATRAIN_Remote_brake_Enabled", false];
if (_breakEnabled && random 10 > 9) then {
	private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
	private _trainCar = selectRandom _trainCars;
	private _selectionPosition = _trainCar selectionposition (selectRandom ["wheel1", "wheel2", "wheel3", "wheel4"]);
	if (_selectionPosition isNotEqualTo [0,0,0]) then {
		["ATRAIN_sparkSmall", [_trainCar, _selectionPosition]] call CBA_fnc_globalEvent;
	};
};


// Calculate train distance from start of path
private _trainDistanceFromFront = _train getVariable ["ATRAIN_Distance_From_Front",0];
private _trainVelocity = _train getVariable ["ATRAIN_Velocity",0];
_trainDistanceFromFront = _trainDistanceFromFront - (_trainVelocity * _deltaSimulationTime);

private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
private _frontCar = _train getVariable ["ATRAIN_Front_Car",_train];
private _rearCar = _train getVariable ["ATRAIN_Rear_Car",_train];

{
	private _currentCar = _x;
	private _offsetFromEngine = _currentCar getVariable ["ATRAIN_Offset_From_Engine", 0];
	private _alignment = [_train,_currentCar,_offsetFromEngine + _trainDistanceFromFront] call ATRAIN_fnc_calculateTrainAlignment;
	_currentCar setVariable ["ATRAIN_Alignment", _alignment];
} forEach _trainCars;

private _distanceFromEngineToRear = (_rearCar getVariable ["ATRAIN_Offset_From_Engine", 0]) + ((_rearCar getVariable ["ATRAIN_Remote_Car_Length", 6])*0.5);
private _distanceFromEngineToFront = abs(_frontCar getVariable ["ATRAIN_Offset_From_Engine", 0]) + ((_frontCar getVariable ["ATRAIN_Remote_Car_Length", 6])*0.5);

// Calculate track node updates
private _nodePath = _train getVariable ["ATRAIN_Node_Path",[]];
private _trainNodePathDistance = _train getVariable ["ATRAIN_Node_Path_Distance",0];
if((_trainDistanceFromFront - _distanceFromEngineToFront) < 0 || (_trainDistanceFromFront + _distanceFromEngineToRear) > _trainNodePathDistance) then {
	private _trainInReverse = _trainVelocity < 0;
	private _turnDirection = _train getVariable ["ATRAIN_Turn_Direction",0];
	systemChat str _turnDirection;
	private _trainAlignment = [_train,_frontCar,_trainDistanceFromFront - _distanceFromEngineToFront] call ATRAIN_fnc_calculateTrainAlignment;
	diag_log format ["trainAlignment %1", _trainAlignment];
	private _trainDirection = (_trainAlignment select 0) select 1;
	if(_trainInReverse) then {
		_trainAlignment = [_train,_rearCar,_trainDistanceFromFront + _distanceFromEngineToRear] call ATRAIN_fnc_calculateTrainAlignment;
		_trainDirection = ((_trainAlignment select 1) select 1) vectorMultiply -1;
	};
	private _trainDirectionRight = _trainDirection vectorCrossProduct [0,0,1];
	private _finalNodeIndex = _nodePath select 0;
	if(_trainInReverse) then {
		_finalNodeIndex = _nodePath select ((count _nodePath) - 1);
	};
	private _possibleNextNodes = [];
	private _mapFinalNode = ATRAIN_Map select _finalNodeIndex;
	{
		private _connectedNodeIndex = _x select 0;
		private _connectedNodeDistance = _x select 1;
		private _connectedNodePath = _x select 2;
		private _connectedNodePathStartPositionASL = (_connectedNodePath select 0);
		private _connectedNodePathSecondPositionASL = (_connectedNodePath select 1);
		private _connectedNodeDirection = _connectedNodePathStartPositionASL vectorFromTo _connectedNodePathSecondPositionASL;
		if(_trainDirection vectorDotProduct _connectedNodeDirection > 0) then {
			_possibleNextNodes pushBack [_connectedNodeIndex, _connectedNodeDirection, _connectedNodeDistance];
		};
	} forEach _mapFinalNode;
	private _nextNodeIndex = -1;
	private _nextNodeDistance = -1;
	private _nextNodeIndexMinValue = 0;
	{
		private _dirDotProduct = _trainDirectionRight vectorDotProduct (_x select 1);
		private _dirDotProductDelta = abs (_turnDirection - _dirDotProduct);
		if(_nextNodeIndex == -1 || _dirDotProductDelta < _nextNodeIndexMinValue) then {
			_nextNodeIndex = _x select 0;
			_nextNodeDistance = _x select 2;
			_nextNodeIndexMinValue = _dirDotProductDelta;
		};
	} forEach _possibleNextNodes;
	if(_nextNodeIndex != -1) then {
		if(_trainInReverse) then {
			_nodePath = _nodePath + [_nextNodeIndex];
		} else {
			_nodePath = [_nextNodeIndex] + _nodePath;
			_trainDistanceFromFront = _trainDistanceFromFront + _nextNodeDistance;
		};
		_trainNodePathDistance = _trainNodePathDistance + _nextNodeDistance;
		_train setVariable ["ATRAIN_Node_Path",_nodePath];
		_train setVariable ["ATRAIN_Node_Path_Distance",_trainNodePathDistance];
	} else {
		if((_trainDistanceFromFront - _distanceFromEngineToFront) < 0) then {
			_trainDistanceFromFront = _distanceFromEngineToFront;
			[_frontCar] call ATRAIN_fnc_simulateTrainCollision;
		} else {
			_trainDistanceFromFront = _trainNodePathDistance - _distanceFromEngineToRear;
			[_rearCar] call ATRAIN_fnc_simulateTrainCollision;
		};
	};
};

_train setVariable ["ATRAIN_Distance_From_Front",_trainDistanceFromFront];

if(count _nodePath > 2) then {
	[_train, _distanceFromEngineToRear, _distanceFromEngineToFront] call ATRAIN_fnc_cleanUpNodePath;
};

// Enable lights

private _lightsEnabled = _train getVariable ["ATRAIN_Remote_Lights_Enabled", false];
if(!isNull _train) then {
	if(_lightsEnabled && !islighton _trainEngine) then {
		// _trainEngine enableSimulationGlobal true;
		_trainEngine setPilotLight true;
	};
	if(!_lightsEnabled && islighton _trainEngine) then {
		// _trainEngine enableSimulationGlobal true;
		_trainEngine setPilotLight false;

	};
	/*
	[{
		_this enableSimulationGlobal false;
	}, _trainEngine] call CBA_fnc_execNextFrame;
	*/
};
