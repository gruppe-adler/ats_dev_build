params ["_train"];

#define ENGINE_DISTANCE 800
#define ENGINE_MAX_SPEED 10
#define ENGINE_IDLE_DISTANCE 600
#define ENGINE_IDLE_MAX_SPEED 10
#define TRACK_DISTANCE 800
#define TRACK_MAX_SPEED 10
#define HORN_DISTANCE 1200
#define BELL_DISTANCE 900
#define BRAKE_DISTANCE 900


private _closestCar = [_train] call ATRAIN_fnc_getNearestTrainCar;
private _engineCar = [_train] call ATRAIN_fnc_getTrainEngine;

private _trainSpeed = abs (_train getVariable ["ATRAIN_Velocity",0]);

// Get the sound def and cache if not defined yet
private _soundDef = _train getVariable ["ATRAIN_Sound_Def", nil];
if(isNil "_soundDef") then {
	_soundDef = [_train] call ATRAIN_fnc_getTrainSoundDefinition;
	_train setVariable ["ATRAIN_Sound_Def", _soundDef];
};

if(count _soundDef == 0) exitWith {};

_soundDef params ["_engineSound","_engineIdleSound", "_trackSound", "_bellSound"];

// Simulate track sound
private _trackSoundSource = _train getVariable ["TRAIN_Track_Sound_Source", objNull];
if(isNull _trackSoundSource && !isNil "ATRAIN_Sound_Sources") then {
	_trackSoundSource = [_trackSound select 0,TRACK_DISTANCE,true,_trackSound select 1] call ATRAIN_fnc_createSoundSource;
	_train setVariable ["TRAIN_Track_Sound_Source", _trackSoundSource];
};
[_trackSoundSource, _closestCar] call ATRAIN_fnc_attachSoundSource;
if(_trainSpeed == 0) then {
	[_trackSoundSource, false] call ATRAIN_fnc_enableSoundSource;
} else {
	[_trackSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_trackSoundSource, (_trainSpeed min TRACK_MAX_SPEED)/TRACK_MAX_SPEED ] call ATRAIN_fnc_setSoundSourceVolume;
};

// Simulate engine idle sound
private _remoteEngineEnabled = _train getVariable ["ATRAIN_Remote_Engine_Enabled", true];
private _engineIdleSoundSource = _train getVariable ["TRAIN_Engine_Idle_Sound_Source", objNull];
if(isNull _engineIdleSoundSource && !isNil "ATRAIN_Sound_Sources") then {
	_engineIdleSoundSource = [_engineIdleSound select 0,ENGINE_IDLE_DISTANCE,true,_engineIdleSound select 1] call ATRAIN_fnc_createSoundSource;
	_train setVariable ["TRAIN_Engine_Idle_Sound_Source", _engineIdleSoundSource];
	[_engineIdleSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_engineIdleSoundSource, _engineCar] call ATRAIN_fnc_attachSoundSource;
};
if(_remoteEngineEnabled) then {
	[_engineIdleSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_engineIdleSoundSource, (1-((_trainSpeed min ENGINE_IDLE_MAX_SPEED)/ENGINE_IDLE_MAX_SPEED)) max 0.8] call ATRAIN_fnc_setSoundSourceVolume;
} else {
	[_engineIdleSoundSource, false] call ATRAIN_fnc_enableSoundSource;
};


// Simulate engine sound
private _engineSoundSource = _train getVariable ["TRAIN_Engine_Sound_Source", objNull];
if(isNull _engineSoundSource && !isNil "ATRAIN_Sound_Sources") then {
	_engineSoundSource = [_engineSound select 0,ENGINE_DISTANCE,true,_engineSound select 1] call ATRAIN_fnc_createSoundSource;
	_train setVariable ["TRAIN_Engine_Sound_Source", _engineSoundSource];
	[_engineSoundSource, _engineCar] call ATRAIN_fnc_attachSoundSource;
};
if(_trainSpeed == 0) then {
	[_engineSoundSource, false] call ATRAIN_fnc_enableSoundSource;
} else {
	[_engineSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_engineSoundSource, (_trainSpeed min ENGINE_MAX_SPEED)/ENGINE_MAX_SPEED] call ATRAIN_fnc_setSoundSourceVolume;
};

// Simulate horn sound
private _remoteHornEnabled = _train getVariable ["ATRAIN_Remote_Horn_Enabled", false];
private _localHornEnabled = _train getVariable ["ATRAIN_Local_Horn_Enabled", false];
if(_remoteHornEnabled && !_localHornEnabled) then {
	_train setVariable ["ATRAIN_Local_Horn_Enabled", true];
	[_train] spawn {
		params ["_train"];
		private _engineCar = [_train] call ATRAIN_fnc_getTrainEngine;
		
		if(!isNull _engineCar) then {
			private _sound = [_engineCar, ["ATSHornStart", HORN_DISTANCE, 1]] remoteExec ["say3D"];
			// todo convert remoteexec to atrain remoteexec
			sleep 0.812;
			while { _train getVariable ["ATRAIN_Remote_Horn_Enabled", false] } do {
				private _sound = [_engineCar, ["ATSHornMiddle1", HORN_DISTANCE, 1]] remoteExec ["say3D"];
				sleep 0.965;
			};
			[_engineCar, ["ATSHornEnd", HORN_DISTANCE, 1]] remoteExec ["say3D"];
			sleep 1;
		};
		_train setVariable ["ATRAIN_Local_Horn_Enabled", false];
	};
};

// Simulate bell sound
private _remoteBellEnabled = _train getVariable ["ATRAIN_Remote_Bell_Enabled", false];
private _localBellEnabled = _train getVariable ["ATRAIN_Local_Bell_Enabled", false];
if(_remoteBellEnabled && !_localBellEnabled) then {
	private _bellSoundSource = _train getVariable ["TRAIN_Bell_Sound_Source", objNull];
	if(isNull _bellSoundSource && !isNil "ATRAIN_Sound_Sources") then {
		_bellSoundSource = [_bellSound select 0,BELL_DISTANCE,true,_bellSound select 1] call ATRAIN_fnc_createSoundSource;
		_train setVariable ["TRAIN_Bell_Sound_Source", _bellSoundSource];
		[_bellSoundSource, _engineCar] call ATRAIN_fnc_attachSoundSource;
	};
	[_bellSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_bellSoundSource, 1] call ATRAIN_fnc_setSoundSourceVolume;
	[_bellSoundSource, _train] spawn {
		params ["_bellSoundSource", "_train"];
		while { alive _train && _train getVariable ["ATRAIN_Remote_Bell_Enabled", false] } do {
			sleep 0.5;
		};
		// Fade bell sound out
		for [{_i=1}, {_i>0}, {_i=_i-0.05}] do
		{
			[_bellSoundSource, _i] call ATRAIN_fnc_setSoundSourceVolume;
			sleep 0.1;
		};
		[_bellSoundSource, false] call ATRAIN_fnc_enableSoundSource;
		_train setVariable ["ATRAIN_Local_Bell_Enabled", false];
	};
};


// Simulate Brake Sound
private _remotebrakeEnabled = _train getVariable ["ATRAIN_Remote_brake_Enabled", false];
private _localbrakeEnabled = _train getVariable ["ATRAIN_Local_brake_Enabled", false];
private _breakSounds = ["ATSBrake1", "ATSBrake2", "ATSBrake3", "ATSBrake4"];
if(_remotebrakeEnabled && !_localbrakeEnabled) then {
	private _brakeSoundSource = _train getVariable ["TRAIN_brake_Sound_Source", objNull];
	if(isNull _brakeSoundSource && !isNil "ATRAIN_Sound_Sources") then {
		_brakeSoundSource = [selectRandom _breakSounds,BRAKE_DISTANCE,true,1] call ATRAIN_fnc_createSoundSource;
		_train setVariable ["TRAIN_brake_Sound_Source", _brakeSoundSource];
		[_brakeSoundSource, _engineCar] call ATRAIN_fnc_attachSoundSource;
	};
	[_brakeSoundSource, true] call ATRAIN_fnc_enableSoundSource;
	[_brakeSoundSource, 1] call ATRAIN_fnc_setSoundSourceVolume;
	[_brakeSoundSource, _train] spawn {
		params ["_brakeSoundSource", "_train"];
		while { alive _train && _train getVariable ["ATRAIN_Remote_brake_Enabled", false] } do {
			sleep 0.5;
		};
		// Fade brake sound out
		for [{_i=1}, {_i>0}, {_i=_i-0.05}] do
		{
			[_brakeSoundSource, _i] call ATRAIN_fnc_setSoundSourceVolume;
			sleep 0.1;
		};
		[_brakeSoundSource, false] call ATRAIN_fnc_enableSoundSource;
		_train setVariable ["ATRAIN_Local_brake_Enabled", false];
	};
};