params ["_ctrl", "_animateIn"];

private _offsetOrigin = [0, safeZoneH/60] select _animateIn;
private _offsetTarget = [safeZoneH/60, 0] select _animateIn;
(ctrlPosition _ctrl) params ["_posX", "_posY", "_w", "_h"];

// prevent flickering on top left position
_ctrl ctrlSetPosition [_posX, _posY + _offsetOrigin, _w, _h];
_ctrl ctrlCommit 0;

_ctrl ctrlSetPosition [_posX, _posY + _offsetOrigin, _w, _h];
_ctrl ctrlSetFade ([0,1] select _animateIn);
_ctrl ctrlCommit 0;

_ctrl ctrlSetPosition [_posX, _posY + _offsetTarget, _w, _h];
_ctrl ctrlSetFade ([0,1] select !_animateIn);
_ctrl ctrlCommit 0.2;

if (!_animateIn) then {
    [{
        params ["_ctrl"];

        ctrlDelete _ctrl;

    }, [_ctrl], 0.2] call CBA_fnc_waitAndExecute;  
};