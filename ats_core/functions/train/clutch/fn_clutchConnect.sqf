params ["_trainCarA", "_trainCarB", "_connect"];

/*
private _clutchFrontA = _trainCarA getVariable ["ATRAIN_clutchFront", objNull];
private _clutchBackA = _trainCarA getVariable ["ATRAIN_clutchBack", objNull];

private _clutchFrontB = _trainCarB getVariable ["ATRAIN_clutchFront", objNull];
private _clutchBackB = _trainCarB getVariable ["ATRAIN_clutchBack", objNull];

private _positionClutchFrontA = _clutchFrontA modelToWorld [0,0,0];
private _positionClutchBackA = _clutchBackA modelToWorld [0,0,0];
private _positionClutchFrontB = _clutchFrontB modelToWorld [0,0,0];
private _positionClutchBackB = _clutchBackB modelToWorld [0,0,0];
*/

private _carLength = _trainCar getVariable ["ATRAIN_Remote_Car_Length",6]; 
private _pointBetweenCars = _trainCarA getPos [_carLength/2, _trainCarA getDir _trainCarB];

private _clutchCandidates = nearestObjects [_pointBetweenCars, ["Sign_Sphere100cm_Geometry_F"], 10];
private _clutches = [];

{
    _clutches pushBackUnique _x;
} forEach _clutchCandidates;

_clutches params ["_clutchA", "_clutchB"];


private _color = "#(argb,8,8,3)color(1,0.1,0.1,1.000000,ca)";

if (_connect) then {
    _color = "#(argb,8,8,3)color(0.1,1,0.1,1.000000,ca)";
};

{ _x setObjectTextureGlobal [0, _color]; } forEach [_clutchA, _clutchB];