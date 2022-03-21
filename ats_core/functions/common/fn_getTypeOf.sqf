params ["_object"];

private _typeOf = typeOf _object;
private _foundType = false;

if(_typeOf != "") then {
	_foundType = true;
};

// CUPS Tracks Workaround
if(_typeOf find "CUP_Railway_rails" >= 0 ) then {
	_foundType = false;
};
if(_typeOf == "Land_rails_bridge_40" ) then {
	_foundType = false;
};

if(_foundType) exitWith {[_typeOf,false]};

private _modelName = (getModelInfo _object) select 0;

private _modelToTypeMapIndex = ATRAIN_Object_Model_To_Type_Map_Index find (toLower _modelName);

if(_modelToTypeMapIndex >= 0) exitWith {
	(ATRAIN_Object_Model_To_Type_Map select _modelToTypeMapIndex) select 1;
};

["", false]
