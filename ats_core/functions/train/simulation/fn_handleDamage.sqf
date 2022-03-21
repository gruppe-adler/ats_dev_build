params ["_unit","_hitSelection","_damage","_source","_projectile","_hitPartIndex","_instigator","_hitPoint"];
if(!alive _unit) exitWith { _damage };
private _return = 0;
if(isPlayer _source && vehicle _source == _source) then {
	_return = _damage;
};
_return