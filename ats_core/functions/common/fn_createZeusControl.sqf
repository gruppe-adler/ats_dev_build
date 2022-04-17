#include "ats\core\CfgRscDefines.hpp"

params ["_train"];

private _trains = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]);
// clean previous control, only one can be active
private _id = _train getVariable ["ATRAIN_trainID", 0];
private _identifier = format ["ATRAIN_ZeusControl_%1", _id];
private _controls = missionNamespace getVariable [_identifier, []];
if (count _controls > 0) then { { ctrlDelete _x; } forEach _controls; };

player setVariable ["ATRAIN_interfaceOpened", _train];

_train setVariable ["ATRAIN_Remote_Cruise_Control_Enabled", true, true];

// create control
private _display = findDisplay 312;
if (isNull _display) exitWith { hint "no Zeus Display found"; };

private _control = _display ctrlCreate ["ATRAINS_CuratorDisplay", -1];
_control ctrlSetPosition [safezoneX,safeZoneY+safeZoneH-DIALOG_HEIGHT,safeZoneX+safeZoneW,DIALOG_HEIGHT];
_control ctrlCommit 0;
private _speedText = controlNull;

[_control, true] call ATRAIN_fnc_animateUI;

/*
([] call BIS_fnc_GUIGrid) params ["", "", "_GUI_GRID_W", "_GUI_GRID_H"];
_GUI_GRID_W = _GUI_GRID_W / 40;
_GUI_GRID_H = _GUI_GRID_H / 25;


// control group
private _controlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
private _controlGroupPosition = [
    0,
    safeZoneY + 40 * _GUI_GRID_H,
    1,
    5 * _GUI_GRID_H
];
_controlGroup ctrlSetPosition _controlGroupPosition;
_controlGroup ctrlSetBackgroundColor [0,0,0,0.5];
_controlGroup ctrlCommit 0;
_controls pushBackUnique _controlGroup;


// background of control
private _bg = _display ctrlCreate ["RscText", -1, _controlGroup];
_bg ctrlSetPosition [
    0,
    0,
    1,
    5 * _GUI_GRID_H
];
_bg ctrlSetBackgroundColor [0,0,0,0.5];
_bg ctrlEnable false; // to prevent any click issues
_bg ctrlCommit 0;
_controls pushBackUnique _bg;


// speed
private _speedText = _display ctrlCreate ["RscStructuredText", -1, _controlGroup];
_speedText ctrlSetPosition [
    0,
    3 * _GUI_GRID_H,
    1,
    1 * _GUI_GRID_H
];
private _displayText =  "Train " + str (_id) + ": ";
_speedText ctrlSetStructuredText parseText ("<t align='center' size='1'>" + _displayText + "</t>");
_speedText ctrlEnable false; // to prevent any click issues
_speedText ctrlCommit 0;
_controls pushBackUnique _speedText;

// Button Brake
private _buttonBreak = _display ctrlCreate ["RSC_ATRAINS_RscButton", -1, _controlGroup];
_buttonBreak ctrlSetPosition [
    .1,
    .1,
    .09,
    .07
];
_buttonBreak ctrlsettext "B";
_buttonBreak ctrlCommit 0;
_buttonBreak setVariable ["ATRAIN_zeusTrainID", _id];
_buttonBreak ctrlEnable true;
_controls pushBackUnique _buttonBreak;

_buttonBreak ctrlAddEventHandler ["MouseButtonDown", {
    params ["_ctrl", "_button"];

    _this call ATRAIN_fnc_brakeControl;
}];

// Button Light
private _buttonLight = _display ctrlCreate ["RSC_ATRAINS_RscButton", -1, _controlGroup];
_buttonLight ctrlSetPosition [
    .2,
    .1,
    .09,
    .07
];
_buttonLight ctrlsettext "L";
_buttonLight ctrlCommit 0;
_buttonLight setVariable ["ATRAIN_zeusTrainID", _id];
_buttonLight ctrlEnable true;
_controls pushBackUnique _buttonLight;

_buttonLight ctrlAddEventHandler ["MouseButtonDown", {
   _this call ATRAIN_fnc_lightControl;
}];


// Slider Acceleration
private _sliderAcceleration = _display ctrlCreate ["RSC_ATRAINS_SliderH", -1, _controlGroup];
_sliderAcceleration ctrlSetPosition [
    0,
    1 * _GUI_GRID_H,
    1,
    1 * _GUI_GRID_H
];
_sliderAcceleration sliderSetRange [-100, 100];
_sliderAcceleration sliderSetSpeed [1, .5, 1];
_sliderAcceleration sliderSetPosition 0;    

_sliderAcceleration ctrlCommit 0;
_sliderAcceleration setVariable ["ATRAIN_zeusTrainID", _id];
_controls pushBackUnique _sliderAcceleration;

_sliderAcceleration ctrlAddEventHandler ["SliderPosChanged", {
    _this call ATRAIN_fnc_speedControl;
}];

 // Button Horn
private _buttonHorn = _display ctrlCreate ["RSC_ATRAINS_RscButton", -1, _controlGroup];
_buttonHorn ctrlSetPosition [
    .3,
    .1,
    .09,
    .07
];
_buttonHorn ctrlsettext "H";
_buttonHorn ctrlCommit 0;
_buttonHorn setVariable ["ATRAIN_zeusTrainID", _id];
_controls pushBackUnique _buttonHorn;

_buttonHorn ctrlAddEventHandler ["MouseButtonDown", {
    _this call ATRAIN_fnc_hornControl;
}];

missionNamespace setVariable [_identifier, _controls];

// animate in
{
    [_x, true] call ATRAIN_fnc_animateUI;
} forEach _controls;

*/

[{
    params ["_args", "_handle"];
    _args params ["_train", "_identifier", "_speedText"];

    if (isNull _train) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };
    if (isNull (player getVariable ["ATRAIN_interfaceOpened", objNull]) || (player getVariable ["ATRAIN_interfaceOpened", objNull] isNotEqualTo _train)) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler;

        // stop acceleration
        _train setVariable ["ATRAIN_Remote_Movement_Direction", 0, true];
        
        // dismiss UI
        private _controls = (missionNamespace getVariable [_identifier, []]); 
        // animate out
        {
            [_x, false] call ATRAIN_fnc_animateUI;
        } forEach _controls;
    };

    if (!isNull (_train getVariable ["ATRAIN_Remote_Driver", objNull])) exitWith {
        private _color = "#ff00ff"; 
        private _targetSpeed = (_train getVariable ["ATRAIN_targetSpeed", 0]);
        private _actualSpeed = _train getVariable ["ATRAIN_Velocity", 0];
        private _id = _train getVariable ["ATRAIN_trainID", 0];
        private _title =  "Train " + str (_id) + ": ";
        private _displayText = format ["%1 %2 | %3 km/h", _title, (_targetSpeed*3.6) toFixed 1, (_actualSpeed*3.6) toFixed 1];
        private _color = "#ff3333";
        _speedText ctrlSetStructuredText parseText ("<t align='center' size='1' color='" + _color + "'>" + _displayText + "</t>");
        _speedText ctrlCommit 0;
    };

    private _actualSpeed = _train getVariable ["ATRAIN_Velocity", 0];
    private _colorRed = "#ff3333"; // red braking
    private _colorGreen = "#33ff33"; // green acceleration
    private _colorWhite = "#ffffff"; // white default
    private _colorYellow = "#00ffff"; 
    private _color = _colorWhite;
    private _targetSpeed = (_train getVariable ["ATRAIN_targetSpeed", 0]);
    private _diffSpeed = _targetSpeed - _actualSpeed;
    if (_diffSpeed < 0) then { _diffSpeed = -_diffSpeed; }; // abs is real number only?

    if (_targetSpeed > _actualSpeed) then {
        _color = _colorGreen;
        if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 1) then {
            _train setVariable ["ATRAIN_Remote_Movement_Direction", 1, true];
        };
    };

    if (_targetSpeed < _actualSpeed) then {
        _color = _colorRed;
        if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != -1) then {
            _train setVariable ["ATRAIN_Remote_Movement_Direction", -1, true];
        };
    };

    if (_targetSpeed > 1 && {_diffSpeed < .5}) then {
        _color = _colorYellow;
        if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 0) then {
            _train setVariable ["ATRAIN_Remote_Movement_Direction", 0, true];
        };
    };

    if (_targetSpeed == 0 && {_diffSpeed < .1}) then {
        _color = _colorWhite;
        if (_train getVariable ["ATRAIN_Remote_Movement_Direction", 0] != 0) then {
            _train setVariable ["ATRAIN_Remote_Movement_Direction", 0, true];
            _train setVariable ["ATRAIN_Velocity", 0, true];
        };
    };
    
    private _displayText = format ["%1 | %2 km/h", (_targetSpeed*3.6) toFixed 1, (_actualSpeed*3.6) toFixed 1];
    _speedText ctrlSetStructuredText parseText ("<t align='center' size='1' color='" + _color + "'>" + _displayText + "</t>");
    _speedText ctrlCommit 0;

    /*
    hintSilent parseText format [
        "Train ID %6<br/>
        Movement Direction %1 <br/>
        Local Velocity %2 <br/>
        _targetSpeed %4 <br/>
        _actualSpeed %5 <br/>", 
        _train getVariable ["ATRAIN_Remote_Movement_Direction", -1],
        _train getVariable ["ATRAIN_Velocity", -1],
        _targetSpeed,
        _actualSpeed,
        _train getVariable ["ATRAIN_trainID", -1]
    ];
    */

}, 0, [_train, _identifier, _speedText]] call CBA_fnc_addPerFramehandler;
