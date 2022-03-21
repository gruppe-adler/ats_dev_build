params ["_object","_trainCar","_attachmentPosition", "_vectorDirAndUp"];
private _attachments = _trainCar getVariable ["ATRAIN_Attachments",[]];
_attachments pushBack [_object,_attachmentPosition, _vectorDirAndUp];
_trainCar setVariable ["ATRAIN_Attachments",_attachments,true];
_object attachTo [_trainCar, _attachmentPosition];
_object setVectorDirAndUp _vectorDirAndUp;
