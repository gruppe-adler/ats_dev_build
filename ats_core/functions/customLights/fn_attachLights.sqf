params ["_trainEngine"];


[{
    params ["_args", "_handle"];
    _args params ["_trainEngine"];
    private _train = _trainEngine getVariable ["ATRAIN_Current_Train", objNull];
    
    if (_train getVariable ["ATRAIN_Remote_Lights_Enabled", false] && _train getVariable ["ATRAIN_Velocity", 0] > 0) then {
        [_trainEngine, true] call ATRAIN_fnc_lightDirection;
    };

    if (_train getVariable ["ATRAIN_Remote_Lights_Enabled", false] && _train getVariable ["ATRAIN_Velocity", 0] < 0) then {
        [_trainEngine, false] call ATRAIN_fnc_lightDirection;
    };

}, 1, [_trainEngine]] call CBA_fnc_addPerFramehandler;
