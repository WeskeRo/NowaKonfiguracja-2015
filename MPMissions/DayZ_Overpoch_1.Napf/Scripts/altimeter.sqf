uiSleep 5;
_myalt = round(getPos player select 2);

while {(_myalt) > 0} do {
	_myalt = round(getPos player select 2);
	titleText [("                                ALTITUDE: " + str _myalt + "\n                                Select Open Chute"), "PLAIN DOWN", 0.1];
     
};
