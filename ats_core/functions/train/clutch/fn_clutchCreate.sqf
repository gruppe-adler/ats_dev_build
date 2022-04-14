params ["_trainCar"];

private _carLength = _trainCar getVariable ["ATRAIN_Remote_Car_Length",6]; 
private _trainCarEndOffset = [0,_carLength/2,-2]; 
private _trainCarFrontendOffset = [0,-_carLength/2,-2]; 
 
private _clutchFront = "Sign_Sphere100cm_Geometry_F" createVehicle [0,0,0]; 
_clutchFront attachTo [_trainCar, _trainCarEndOffset]; 
 
private _clutchBack = "Sign_Sphere100cm_Geometry_F" createVehicle [0,0,0]; 
_clutchBack attachTo [_trainCar, _trainCarFrontendOffset];

_clutchFront setVariable ["ATRAIN_isClutch", true, true];
_clutchBack setVariable ["ATRAIN_isClutch", true, true];

_trainCar setVariable ["ATRAIN_clutchFront", _clutchFront, true];
_trainCar setVariable ["ATRAIN_clutchBack", _clutchBack, true];