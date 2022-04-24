params ["_train", "_directionForwardImg"];

private _direction = _train getVariable ["ATRAIN_Thrust", -1];

switch (_direction) do { 
    case 1 : { 
        _directionForwardImg ctrlsetText "ats\core\gui\forward_on.paa";
    }; 
    case -1 : {  
        _directionForwardImg ctrlsetText "ats\core\gui\backward_on.paa";
    }; 
    default {  /*...code...*/ }; 
};
_directionForwardImg ctrlCommit 0;
