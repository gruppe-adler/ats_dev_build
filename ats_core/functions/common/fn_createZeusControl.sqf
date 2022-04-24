#include "..\..\CfgRscDefines.hpp"

params ["_train", ["_displayID", 312]];

private _trains = (missionNamespace getVariable ["ATRAIN_Registered_Trains",[]]);
// clean previous control, only one can be active
private _id = _train getVariable ["ATRAIN_trainID", 0];
private _identifier = format ["ATRAIN_ZeusControl_%1", _id];
private _control = uiNamespace getVariable [_identifier, controlNull];
if (!isNull _control) then { ctrlDelete _control; };

player setVariable ["ATRAIN_interfaceOpened", _train];

// create control
disableSerialization;
private _display = findDisplay _displayID;
if (isNull _display) exitWith { hint "no Zeus Display found"; };

private _control = _display ctrlCreate ["ATRAINS_CuratorTrainDisplay", -1];
_control ctrlSetPosition [CENTER_X(DIALOG_WIDTH),safeZoneY+safeZoneH-DIALOG_HEIGHT,DIALOG_WIDTH,DIALOG_HEIGHT];
_control ctrlCommit 0;
private _speedCtrl = _control controlsGroupCtrl IDC_GUI_SPEED;
private _directionForwardImg = _control controlsGroupCtrl IDC_GUI_FORWARD_IMG;

private _hornCtrl = _control controlsGroupCtrl IDC_GUI_HORN_IMG;
private _lightCtrl = _control controlsGroupCtrl IDC_GUI_LIGHTS_IMG;
private _brakeCtrl = _control controlsGroupCtrl IDC_GUI_BRAKE_IMG;

private _slider = _control controlsGroupCtrl IDC_GUI_SLIDER;
_slider sliderSetRange [0, 30]; // todo get max train speed
_slider sliderSetSpeed  [1, .5, .5];
_slider ctrlCommit 0;

[_control, true] call ATRAIN_fnc_animateUI;

uiNamespace setVariable ["ATRAIN_interfaceTrainID", _id];
uiNamespace setVariable [_identifier, _control];


// GUI refresh
[{
    params ["_args", "_handle"];
    _args params ["_train", "_identifier", "_directionForwardImg", "_hornCtrl", "_lightCtrl", "_brakeCtrl", "_speedCtrl"];

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

    [_train, _directionForwardImg] call ATRAIN_fnc_directionDisplay;
    [_hornCtrl] call ATRAIN_fnc_hornDisplay;
    [_lightCtrl] call ATRAIN_fnc_lightDisplay;
    [_brakeCtrl] call ATRAIN_fnc_brakeDisplay;
    [_train, _speedCtrl] call ATRAIN_fnc_speedDisplay;



    /*
    hintSilent parseText format [
        "Train ID %6<br/>
        Movement Direction %1 <br/>
        Local Velocity %2 <br/>
        _targetSpeed %4 <br/>
        _actualSpeed %5 <br/>",
        _train getVariable ["ATRAIN_Thrust", -1],
        _train getVariable ["ATRAIN_Velocity", -1],
        _targetSpeed,
        _actualSpeed,
        _train getVariable ["ATRAIN_trainID", -1]
    ];
    */

}, 0, [_train, _identifier, _directionForwardImg, _hornCtrl, _lightCtrl, _brakeCtrl, _speedCtrl]] call CBA_fnc_addPerFramehandler;
