params ["_trainEngine", "_forward"];

private _lightsForward = [
 "light_l",
 "light_r",
 "light_m",
 "light_back_r_red",
 "light_back_l_red"
];

private _lightsBackward = [
 "light_back_l",
 "light_back_r",
 "light_back_m",
 "light_l_red",
 "light_r_red"
];


{
    _trainEngine setHitPointDamage [_x, [0,1] select _forward, false];
} forEach _lightsForward;

{
    _trainEngine setHitPointDamage [_x, [1,0] select _forward, false];
} forEach _lightsBackward;