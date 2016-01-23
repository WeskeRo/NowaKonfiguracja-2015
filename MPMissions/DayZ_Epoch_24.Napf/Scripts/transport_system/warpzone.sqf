Private ["_Basis","_var"];
_Basis = _this select 0;
_var = _this select 1;

while {true} do
  {
    waitUntil {vehicle player in list _Basis};
titleText ["Welcome to Underground Transportation System. Wait 5 seconds to access bunker.", "PLAIN DOWN", 3];
sleep 2;

if (!isDedicated) then {
        sleep 3;
		switch (_var) do 
		{
			case 1: { player setPosATL [1124.2561, 2910.9414, 0.002];}; //warp zone
			case 2: { player setPosATL [9129.3633, 5608.0273, 0.002];};  //Shangen 1141.8518, 2915.8052
			case 3: { player setPosATL [14093.756, 13622.64, 0.002];};  //Luzern 1141.9513, 2935.0979
			case 4: { player setPosATL [8594.6719, 15497.011, 0.002];};  //Lenzburg 1124.7971, 2942.0015
			case 5: { player setPosATL [12786.209, 5306.7725, 0.002];};  //Sorenberg 1107.2886, 2935.7144
			case 6: { player setPosATL [6302.2642, 9856.9541, 0.002];};  //Munchenstein 1107.6555, 2920.9597
		};
};
}; 