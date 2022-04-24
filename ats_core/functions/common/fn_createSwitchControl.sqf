#include "..\..\CfgRscDefines.hpp"

params ["_switch", ["_displayID", 312]];

private _switchs = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]);
// clean previous control, only one can be active
private _id = _switch getVariable ["ATRAIN_switchID", 0];
private _identifier = format ["ATRAIN_ZeusControl_%1", _id];
private _control = uiNamespace getVariable [_identifier, controlNull];
if (!isNull _control) then { ctrlDelete _control; };

player setVariable ["ATRAIN_interfaceOpened", _switch];

// create control
disableSerialization;
private _display = findDisplay _displayID;
if (isNull _display) exitWith { hint "no Zeus Display found"; };

private _control = _display ctrlCreate ["ATRAINS_CuratorSwitchDisplay", -1];
_control ctrlSetPosition [CENTER_X(DIALOG_WIDTH),safeZoneY+safeZoneH-DIALOG_HEIGHT,DIALOG_WIDTH,DIALOG_HEIGHT];
_control ctrlCommit 0;

[_control, true] call ATRAIN_fnc_animateUI;

uiNamespace setVariable ["ATRAIN_interfaceSwitchID", _id];
uiNamespace setVariable [_identifier, _control];

private _titleCtrl = _control controlsGroupCtrl IDC_GUI_TITLE;
private _subtitleCtrl = _control controlsGroupCtrl IDC_GUI_SUBTITLE;
private _title = "SWITCH " + str _id;
private _subtitle = if (_switch getVariable ["ATRAIN_switch", -1] == -1) then { "Left" } else { "Right" };
private _imageCtrl = _control controlsGroupCtrl IDC_GUI_IMAGE;
private _btn = _control controlsGroupCtrl IDC_GUI_SWITCH_BTN;
_btn setVariable ["ATRAIN_switchObject", _switch];

_titleCtrl ctrlSetText _title;
_subtitleCtrl ctrlSetText _subtitle;
_titleCtrl ctrlCommit 0;
_subtitleCtrl ctrlCommit 0;

// GUI refresh
[{
    params ["_args", "_handle"];
    _args params ["_switch", "_identifier", "_subtitleCtrl", "_imageCtrl"];

    if (isNull _switch ||
        isNull (player getVariable ["ATRAIN_interfaceOpened", objNull]) ||
        (player getVariable ["ATRAIN_interfaceOpened", objNull] isNotEqualTo _switch)
        ) exitWith {
        // dismiss UI
        private _control = uiNamespace getVariable [_identifier, controlNull];
        // animate out
        [_control, false] call ATRAIN_fnc_animateUI;
        // end refresh loop
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    [_switch, _subtitleCtrl, _imageCtrl] call ATRAIN_fnc_switchDisplay;

    /*
    hintSilent parseText format [
        "Train ID %6<br/>
        Movement Direction %1 <br/>
        Local Velocity %2 <br/>
        _targetSpeed %4 <br/>
        _actualSpeed %5 <br/>",
        _switch getVariable ["ATRAIN_Thrust", -1],
        _switch getVariable ["ATRAIN_Velocity", -1],
        _targetSpeed,
        _actualSpeed,
        _switch getVariable ["ATRAIN_switchID", -1]
    ];
    */

}, 0, [_switch, _identifier, _subtitleCtrl, _imageCtrl]] call CBA_fnc_addPerFramehandler;
