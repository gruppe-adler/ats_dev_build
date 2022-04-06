params ["_trainCar"];

private _selectionPosition = selectionposition (selectRandom ["wheel1", "wheel2", "wheel3", "wheel4"]);

if (_selectionPosition isEqualTo [0,0,0]) exitWith {};

private _brightness = 0.1;
private _light = "#lightpoint" createVehicleLocal _position;
_light setLightBrightness _brightness;
_light setLightAmbient [1.0, 0.25, 0.25];
_light setLightColor [1.0, 0.25, 0.25];


private _duration = 0.01 + random 0.1;
private _amount = 0.001 + random 0.01;
private _spark = "#particlesource" createVehicleLocal _position;
private _lifetime = (random 0.5);


_spark setParticleCircle [0, [0, 0, 0]];
_spark setParticleRandom [1, [0.05, 0.05, 0.1], [0.4, 0.4, 0], 0, 0.0025, [0, 0, 0, 0], 0, 0];
_spark setParticleParams [
    ["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject",
    1, _lifetime, [0, 0, 0], [0, 0, -0.1], 0, 20, 7.9, 0,
    [0.3,0.3,0.05], [[1, 1, 1, 1], [1, 0.5, 0.5, 1], [0.5, 0, 0, 0]], [0.08], 1, 0, "", "", _spark,0,true,0.2,[[1,0.25,0.25,1]]
];
_spark setDropInterval _amount;


_light attachTo [_trainCar, _selectionPosition];
_spark attachTo [_trainCar, _selectionPosition];

[{
    params ["_spark", "_light"];
    deleteVehicle _spark;
    deleteVehicle _light;

}, [_spark, _light], _duration] call CBA_fnc_waitAndExecute;
