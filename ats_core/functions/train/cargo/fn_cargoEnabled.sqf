params ["_trainCar"];

private _cargoCars = (([
    "ATS_Trains_A2Wagon_Flat",
    "ATS_Trains_SD60_Flatbed",
    "ATS_Trains_SD60_Open_Wagon",
    "ATS_Trains_A3_Sugar_Empty",
    "ATS_Trains_A3_Passenger"
] find (typeOf _trainCar)) > -1);

_cargoCars