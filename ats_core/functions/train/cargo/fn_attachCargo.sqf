/*

    attaches cargo on server
    broadcasts cargo attachments on clients

*/

params ["_trainCar"];

if ([_trainCar] call ATRAIN_fnc_cargoEnabled) then {
    private _cargoCandidates = [_trainCar] call ATRAIN_fnc_getCargo;
    private _cargoAttached = [];
    {
        private _candidate = _x;

        if (_candidate getVariable ["ATRAIN_isAttached", false]) exitWith {};
        
        private _offset = _trainCar worldToModelVisual ASLToAGL getPosWorld _candidate;
        private _vectorDirAndUp = [_trainCar, _candidate] call BIS_fnc_vectorDirAndUpRelative;

        // [_candidate, _trainCar, _offset, _vectorDirAndUp] call ATRAIN_fnc_attachToTrainCar;
        private _succeess = _trainCar setVehicleCargo _candidate;
        // _candidate attachTo [_trainCar, [0,0,20]]; // just for debug purposes
        if (_succeess) then {
            _cargoAttached pushBackUnique _candidate;
            _candidate setVariable ["ATRAIN_isAttached", true, true];
            // diag_log format ["ATS attachCargo: %1 %2 %3", typeof _candidate, _offset, _vectorDirAndUp];
        };
    } forEach _cargoCandidates;
};
