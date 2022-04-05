params ["_trainEngine", "_forward"];

private _lightsForward = [
 "#light_l",
 "#light_r",
 "#light_m",
 "#light_l_back_red",
 "#light_r_back_red"
];

private _lightsBackward = [
 "#light_l_back",
 "#light_r_back",
 "#light_m_back",
 "#light_l_red",
 "#light_r_red"
];

_trainEngine allowDamage true;
{
    _trainEngine setHitPointDamage [_x, [0,1] select _forward, false];
} forEach _lightsForward;

{
    _trainEngine setHitPointDamage [_x, [1,0] select _forward, false];
} forEach _lightsBackward;

_trainEngine allowDamage false;