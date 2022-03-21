params ["_trainCar","_count"];
if(_count == 0) exitWith {[]};
private _nearCars = [_trainCar];
private _searchFrontCar = _trainCar;
private _searchRearCar = _trainCar;
while {count _nearCars < _count && (!isNull _searchFrontCar || !isNull _searchRearCar)} do {
	// Search Forward
	_searchFrontCar = _searchFrontCar getVariable ["ATRAIN_Attached_Front", objNull];
	if(!isNull _searchFrontCar && count _nearCars < _count) then {
		_nearCars pushBack _searchFrontCar;
	};
	// Search Backward
	_searchRearCar = _searchRearCar getVariable ["ATRAIN_Attached_Rear", objNull];
	if(!isNull _searchRearCar && count _nearCars < _count) then {
		_nearCars pushBack _searchRearCar;
	};
};
_nearCars;
