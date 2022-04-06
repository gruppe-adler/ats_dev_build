["ATRAIN_sparkSmall", {
    params ["_trainCar", "_position"];
    
    if (!isGameFocused || isGamePaused) exitWith {}; // stop multi firing

    [_trainCar, _position] call ATRAIN_fnc_sparkSmall;

}] call CBA_fnc_addEventHandler;