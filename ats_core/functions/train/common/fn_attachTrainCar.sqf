params ["_train","_trainCar",["_attachToFront",false]];
private _trainCar = [_trainCar] call ATRAIN_fnc_getOrCreateTrainCar;
private _existingTrain = [_trainCar] call ATRAIN_fnc_getTrain;
private _existingTrainDriver = [_existingTrain] call ATRAIN_fnc_getTrainDriver;
if(!isNull _existingTrainDriver) exitWith {
	// You cannot attach to another train driven by someone else
};
private _trainCarsToAttach = [_trainCar];
private _attachmentFrontCar = _trainCar;
private _attachmentRearCar = _trainCar;
if(!isNull _existingTrain) then {
	_trainCarsToAttach = [_existingTrain] call ATRAIN_fnc_getTrainCars;
	_attachmentFrontCar = [_existingTrain] call ATRAIN_fnc_findFrontCar;
	_attachmentRearCar = [_existingTrain] call ATRAIN_fnc_findRearCar;
	_existingTrain setVariable ["ATRAIN_Remote_Train_Cars", [], true];
};
if(_attachmentFrontCar != _trainCar && _attachmentRearCar != _trainCar) exitWith {
	// You cannot attach to the middle of a train
};
private _attachmentFrontCarLocal = [_attachmentFrontCar] call ATRAIN_fnc_getTrainCar;
private _attachmentRearCarLocal = [_attachmentRearCar] call ATRAIN_fnc_getTrainCar;
if(_attachToFront) then {
	private _trainFrontCar = [_train] call ATRAIN_fnc_findFrontCar;
	private _trainFrontCarLocal = [_trainFrontCar] call ATRAIN_fnc_getTrainCar;
	private _distanceToFront = _trainFrontCarLocal distance _attachmentFrontCarLocal;
	private _distanceToRear = _trainFrontCarLocal distance _attachmentRearCarLocal;
	private _attachInReverse = _distanceToRear < _distanceToFront;
	if(!_attachInReverse) then {
		private _trainCarsToAttachCopy = +_trainCarsToAttach;
		reverse _trainCarsToAttachCopy;
		_trainCarsToAttach = _trainCarsToAttachCopy;
	};
	private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
	_trainCars = _trainCarsToAttach + _trainCars;
	_train setVariable ["ATRAIN_Remote_Train_Cars", _trainCars, true];
} else {
	private _trainRearCar = [_train] call ATRAIN_fnc_findRearCar;
	private _trainRearCarLocal = [_trainRearCar] call ATRAIN_fnc_getTrainCar;
	private _distanceToFront = _trainRearCarLocal distance _attachmentFrontCarLocal;
	private _distanceToRear = _trainRearCarLocal distance _attachmentRearCarLocal;
	private _attachInReverse = _distanceToRear < _distanceToFront;
	if(_attachInReverse) then {
		private _trainCarsToAttachCopy = +_trainCarsToAttach;
		reverse _trainCarsToAttachCopy;
		_trainCarsToAttach = _trainCarsToAttachCopy;
	};
	private _trainCars = [_train] call ATRAIN_fnc_getTrainCars;
	_trainCars = _trainCars + _trainCarsToAttach;
	_train setVariable ["ATRAIN_Remote_Train_Cars", _trainCars, true];
};
[_train] call ATRAIN_fnc_rebuildTrain;
if(!isNull _existingTrain) then {
	_existingTrain setVariable ["ATRAIN_Remote_Train_Cars", [], true];
	[_existingTrain] call ATRAIN_fnc_rebuildTrain;
};