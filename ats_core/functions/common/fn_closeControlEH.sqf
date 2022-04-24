 [{
     (flatten curatorSelected) isEqualto []
  },
  {
     player setVariable ["ATRAIN_interfaceOpened", objNull]; // closes zeus control
}, []] call CBA_fnc_waitUntilAndExecute;