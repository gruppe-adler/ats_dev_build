params ["_sound",["_maxDistance",250],["_repeat",true],["_repeatLength",10],["_pitch",1]];

private _soundSource = "Building" createVehicle [-1000,-1000,-1000];
_soundSource setVariable ["maxDistance", _maxDistance];
_soundSource setVariable ["repeatLength", _repeatLength];
_soundSource setVariable ["sound", _sound];
_soundSource setVariable ["pitch", _pitch];
_soundSource setVariable ["repeat", _repeat];
_soundSource setVariable ["lastPlayTime",0];
[_soundSource, false] call ATRAIN_fnc_enableSoundSource;

ATRAIN_Sound_Sources pushBack _soundSource;
_soundSource;
