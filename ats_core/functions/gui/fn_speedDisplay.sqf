params ["_train", "_speedCtrl"];

private _actualSpeed = _train getVariable ["ATRAIN_Velocity", 0];
private _colorRed = "#ff3333"; // red braking
private _colorGreen = "#33ff33"; // green acceleration
private _colorWhite = "#ffffff"; // white default
private _colorYellow = "#00ffff";
private _color = _colorWhite;
private _targetSpeed = (_train getVariable ["ATRAIN_targetSpeed", 0]);
private _diffSpeed = _targetSpeed - _actualSpeed;
if (_diffSpeed < 0) then { _diffSpeed = -_diffSpeed; }; // abs is real number only?


private _displayText = format ["%1 | %2 km/h", (_targetSpeed*3.6) toFixed 1, (_actualSpeed*3.6) toFixed 1];
_speedCtrl ctrlSetStructuredText parseText ("<t align='center' font='RobotoCondensedBold' size='1.5' color='" + _color + "'>" + _displayText + "</t>");
_speedCtrl ctrlCommit 0;