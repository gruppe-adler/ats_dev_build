
params ["_train"];

private _trainEngine = [_train] call ATRAIN_fnc_getTrainEngine;

#define ENGINE_DISTANCE 800
#define ENGINE_MAX_SPEED 10
#define ENGINE_IDLE_DISTANCE 600
#define ENGINE_IDLE_MAX_SPEED 10
#define TRACK_MAX_SPEED 10
#define BRAKE_MAX_SPEED 50

private _trainSpeed = _train getVariable ["ATRAIN_Velocity", 0];
// simulate sound controller
setCustomSoundController [_trainEngine, "CustomSoundController1", (1-((_trainSpeed min ENGINE_IDLE_MAX_SPEED)/ENGINE_IDLE_MAX_SPEED)) max 0.8]; // idle engine
setCustomSoundController [_trainEngine, "CustomSoundController2", (_trainSpeed min ENGINE_MAX_SPEED)/ENGINE_MAX_SPEED]; // driving engine
setCustomSoundController [_trainEngine, "CustomSoundController3", (_trainSpeed min TRACK_MAX_SPEED)/TRACK_MAX_SPEED]; // track sounds

if (_train getVariable ["ATRAIN_Remote_brake_Enabled", false]) then {
    setCustomSoundController [_trainEngine, "CustomSoundController4", (1-((_trainSpeed min BRAKE_MAX_SPEED)/BRAKE_MAX_SPEED)) max 0.8]; // brake sounds
} else {
    setCustomSoundController [_trainEngine, "CustomSoundController4", 0]; // no sound
};



// Simulate horn sound
private _remoteHornEnabled = _train getVariable ["ATRAIN_Remote_Horn_Enabled", false];
private _localHornEnabled = _train getVariable ["ATRAIN_Local_Horn_Enabled", false];
if(_remoteHornEnabled && !_localHornEnabled) then {
    _train setVariable ["ATRAIN_Local_Horn_Enabled", true];
    [_train, _trainEngine] spawn {
        params ["_train", "_trainEngine"];
        #define HORN_DISTANCE 1200
        
        if(!isNull _trainEngine) then {
            private _sound = [_trainEngine, ["ATSHornStart", HORN_DISTANCE, 1]] remoteExec ["say3D"];
            // todo convert remoteexec to atrain remoteexec
            sleep 0.812;
            while { _train getVariable ["ATRAIN_Remote_Horn_Enabled", false] } do {
                private _sound = [_trainEngine, ["ATSHornMiddle1", HORN_DISTANCE, 1]] remoteExec ["say3D"];
                sleep 0.965;
            };
            [_trainEngine, ["ATSHornEnd", HORN_DISTANCE, 1]] remoteExec ["say3D"];
            sleep 1;
        };
        _train setVariable ["ATRAIN_Local_Horn_Enabled", false];
    };
};

// Simulate bell sound
private _remoteBellEnabled = _train getVariable ["ATRAIN_Remote_Bell_Enabled", false];
private _localBellEnabled = _train getVariable ["ATRAIN_Local_Bell_Enabled", false];
if(_remoteBellEnabled && !_localBellEnabled) then {
    _train setVariable ["ATRAIN_Local_Bell_Enabled", true];
    [_bellSoundSource, _train] spawn {
        params ["_bellSoundSource", "_train"];
        #define BELL_DISTANCE 1200
        while { alive _train && _train getVariable ["ATRAIN_Remote_Bell_Enabled", false] } do {
            sleep 0.5;
            private _sound = [_trainEngine, ["ATS_Train_Bell_Sound", BELL_DISTANCE, 1]] remoteExec ["say3D"];
        };
        _train setVariable ["ATRAIN_Local_Bell_Enabled", false];
    };
};
