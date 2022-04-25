params ["_switch", "_subtitleCtrl", "_imageCtrl"];


private _isRight = _switch getVariable ["ATRAIN_switch", 1] == -1;

private _subtitle = if (!_isRight) then { "Left" } else { "Right" };
_subtitleCtrl ctrlSetText _subtitle;
_subtitleCtrl ctrlCommit 0;

private _image = if (!_isRight) then { "ats\core\gui\switch_l.paa" } else { "ats\core\gui\switch_r.paa" };
_imageCtrl ctrlsettext _image;
_imageCtrl ctrlCommit 0;