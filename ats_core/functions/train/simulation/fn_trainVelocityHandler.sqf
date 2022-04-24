if (!isServer) exitWith {};

["ATRAIN_velocityHandler",{
    params ["_train", "_newValue"];

    private _thrust = _train getVariable ["ATRAIN_Thrust", 1];
    if (_thrust < 0) then {
        _newValue = -_newValue;  // target speed / thrust is always positive
    };
    _train setVariable ["ATRAIN_targetSpeed", _newValue];
    
}] call CBA_fnc_addEventHandler;