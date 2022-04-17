#include "..\..\CfgRscDefines.hpp"

params ["_train"];

private _trains = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]);
// clean previous control, only one can be active
private _id = _train getVariable ["ATRAIN_trainID", 0];
private _identifier = format ["ATRAIN_ZeusControl_%1", _id];
private _control = uiNamespace getVariable [_identifier, []];
if (!isNull _control) then { ctrlDelete _control; };

player setVariable ["ATRAIN_interfaceOpened", _train];

_train setVariable ["ATRAIN_Remote_Cruise_Control_Enabled", true, true];

// create control
private _display = findDisplay 312;
if (isNull _display) exitWith { hint "no Zeus Display found"; };

private _control = _display ctrlCreate ["ATRAINS_CuratorDisplay", -1];
_control ctrlSetPosition [safezoneX,safeZoneY+safeZoneH-DIALOG_HEIGHT,safeZoneX+safeZoneW,DIALOG_HEIGHT];
_control ctrlCommit 0;
private _speedText = _control controlsGroupCtrl IDC_GUI_SPEED;

[_control, true] call ATRAIN_fnc_animateUI;

uiNamespace setVariable ["ATRAIN_interfaceTrainID", _id];
uiNamespace setVariable [_identifier, _control];


// GUI refresh
[{
    params ["_args", "_handle"];
    _args params ["_train", "_identifier", "_speedText"];

    if (isNull _train || 
        isNull (player getVariable ["ATRAIN_interfaceOpened", objNull]) || 
        (player getVariable ["ATRAIN_interfaceOpened", objNull] isNotEqualTo _train)
        ) exitWith {
        // clear train ID cache
        uiNamespace setVariable ["ATRAIN_interfaceTrainID", -1];
        // dismiss UI
        private _control = uiNamespace getVariable [_identifier, controlNull];
        // animate out
        [_control, false] call ATRAIN_fnc_animateUI;
        // end refresh loop
        [_handle] call CBA_fnc_removePerFrameHandler;
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
