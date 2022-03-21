params ["_object"];

private _trainDef = [_object] call ATRAIN_fnc_getTrainDefinition;

if (count _trainDef > 0) exitWith {
    private _trainCar = [_object] call ATRAIN_fnc_getOrCreateTrainCar;
    _trainCar
};

objNull