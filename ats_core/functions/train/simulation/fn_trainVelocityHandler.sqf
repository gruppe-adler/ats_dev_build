if (!isServer) exitWith {};

["ATRAIN_velocityHandler",{
    params ["_train", "_speed"];

    _train setVariable ["ATRAIN_targetSpeed", _newValue];
    
}] call CBA_fnc_addEventHandler;