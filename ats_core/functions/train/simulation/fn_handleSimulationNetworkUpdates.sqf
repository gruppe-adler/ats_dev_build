params ["_train"];
private _currentTime = diag_tickTime;
private _lastUpdateTime = _train getVariable ["ATRAIN_Local_Last_Simulation_Network_Update_Time",0];
if(_currentTime - _lastUpdateTime > (missionNamespace getVariable ["ATS_trainSimulation_Interval", 1])) then {
	private _distanceFromFront = _train getVariable ["ATRAIN_Distance_From_Front",0];
	private _nodePath = _train getVariable ["ATRAIN_Node_Path",[]];
	private _nodePathDistance = _train getVariable ["ATRAIN_Node_Path_Distance",0];
	private _simulationState = [_distanceFromFront, _nodePath, _nodePathDistance];
	private _remoteSimulationState = _train getVariable ["ATRAIN_Remote_Simulation_State",[]];
	if(str _simulationState != str _remoteSimulationState) then {
		//diag_log ("Sending Network Message: " + str _remoteSimulationState);
		_train setVariable ["ATRAIN_Remote_Simulation_State",_simulationState,true];
	};
	_train setVariable ["ATRAIN_Local_Last_Simulation_Network_Update_Time",_currentTime];
};
