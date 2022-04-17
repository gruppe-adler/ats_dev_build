params ["_train", "_directionForwardImg", "_directionBackwardImg"];

private _direction = _train getVariable ["ATRAIN_Movement_Direction", -1];

switch (_direction) do { 
    case 1 : { 
        _directionForwardImg ctrlsetText "ats\core\gui\forward_on.paa";
        _directionBackwardImg ctrlsetText "ats\core\gui\backward_off.paa";
        { _x ctrlCommit 0; } forEach [_directionForwardImg, _directionBackwardImg];
    }; 
    case -1 : {  
        _directionForwardImg ctrlsetText "ats\core\gui\forward_off.paa";
        _directionBackwardImg ctrlsetText "ats\core\gui\backward_on.paa";
        { _x ctrlCommit 0; } forEach [_directionForwardImg, _directionBackwardImg];
    }; 
    default {  /*...code...*/ }; 
};
