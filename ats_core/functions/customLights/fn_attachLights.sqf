params ["_trainEngine"];


[{
    params ["_args", "_handle"];
    _args params ["_trainEngine"];
    private _train = _trainEngine getVariable ["ATRAIN_Current_Train", objNull];
    private _trainLightSwitched = _trainEngine getVariable ["ATRAIN_trainLightForward", false];
    
    if (_train getVariable ["ATRAIN_Remote_Lights_Enabled", false] && _train getVariable ["ATRAIN_Velocity", 0] > 0) then {
        if (_train getVariable ["ATRAIN_trainLightForward", false]) then {
            [_trainEngine, true] call ATRAIN_fnc_lightDirection;
        };
        _trainEngine setVariable ["ATRAIN_trainLightForward", false];
    };

    if (_train getVariable ["ATRAIN_Remote_Lights_Enabled", false] && _train getVariable ["ATRAIN_Velocity", 0] < 0) then {
        if (!(_train getVariable ["ATRAIN_trainLightForward", false])) then {
            [_trainEngine, false] call ATRAIN_fnc_lightDirection;
        };
        _trainEngine setVariable ["ATRAIN_trainLightForward", true];
    };

}, 1, [_trainEngine]] call CBA_fnc_addPerFramehandler;
