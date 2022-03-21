params ["_trainCar"];

private _bbr = boundingBoxReal _trainCar;
_bbr params ["_p1", "_p2"];
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
private _maxHeight = abs ((_p2 select 2) - (_p1 select 2));

private _attachmentsCandidates = _trainCar nearEntities [["Air", "LandVehicle", "Static"], 50];
private _positionCar = getPos _trainCar;

private _attachmentsDetected = [];

{
    private _candidate = _x;
    private _positionCandidate = getPos _candidate;
    private _isAttached = _candidate getVariable ["ATRAIN_isAttached", false];
    if (
        (
            _positionCandidate inArea [
            _positionCar, 
            _maxLength/2, 
            _maxWidth/2, 
            getDir _trainCar, 
            true, 
            _maxHeight/2
            ]
        )
    && !_isAttached) then {
        _attachmentsDetected pushBackUnique _candidate;
    };
} forEach _attachmentsCandidates;

_attachmentsDetected