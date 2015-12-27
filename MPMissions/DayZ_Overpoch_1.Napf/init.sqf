/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	24;				//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epochconfig
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
// 
MaxVehicleLimit = 300; // Default = 50
MaxDynamicDebris = 500; // Default = 100
dayz_MapArea = 18000; // Default = 10000

dayz_minpos = -1000; 
dayz_maxpos = 26000;

dayz_spawnselection = 0;
dayz_paraSpawn = false;

dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;

dayz_maxAnimals = 5; // Default: 8
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = true; // Default: False

DZE_ConfigTrader = true;

DZE_SelfTransfuse = true;
DZE_selfTransfuse_Values = [5000, 10, 300]; // default value

DZE_DamageBeforeMaint = 0;

DZE_PlotPole = [50,65];
DZE_maintainRange = ((DZE_PlotPole select 0)+25);


DZE_APlotforLife = true;
DZE_PlotOwnership = true;
DZE_modularBuild = true;

DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Prefered any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees

EpochEvents = [["any","any","any","any",0,"crash_spawner"],
["any","any","any","any",15,"crash_spawner"],
["any","any","any","any",30,"crash_spawner"],
["any","any","any","any",45,"crash_spawner"],
["any","any","any","any",15,"supply_drop"],
["any","any","any","any",16,"construction"],
["any","any","any","any",30,"military"],
["any","any","any","any",45,"supplyitems"],
["any","any","any","any",59,"treasure"]];


dayz_fullMoonNights = true;

DZE_vehicleAmmo = 1;
DZE_AllowCargoCheck = false;
MaxAmmoBoxes = 25;

//Load in compiled functions
call compile preprocessFileLineNumbers "Scripts\common\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "Scripts\common\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "Scripts\common\compiles.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";
call compile preprocessFileLineNumbers "Scripts\logistic\init.sqf";	
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	//Compile vehicle configs
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\dynamic_vehicle.sqf";				
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_24.Napf\mission.sqf";

	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	_nil = [] execVM "\z\addons\dayz_server\system\most_wanted.sqf";
};

if (!isDedicated) then {
	
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
						[] execVM "Scripts\spawn\start.sqf";
						[] execVM "Scripts\dzgm\init.sqf";
						[] execVM "Scripts\service_point\service_point.sqf";
						[] execVM "Scripts\startup\Server_WelcomeCredits.sqf";
						[] execVM "Scripts\kill_msg\kill_msg.sqf";
						//[] execVM "snow.sqf";
	//Remote Messages
    _nil = [] execVM "Scripts\common\RE.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
};
//Start SingleCurrrencysw
[] execVM "Scripts\gold\init.sqf";

// -- No zombie plotpole --
dayz_poleSafeArea = 50;
[] execVM "Scripts\PlotNoZombie\base_SafeArea.sqf";

[] execVM "Scripts\LoyaltyReward\fn_LReawrd.sqf"; //Loyalty Time Reward

[] execVM "Scripts\marker\marker.sqf";

[] execVM "Scripts\safezone\safezone.sqf";

//Start Dynamic Weather
//execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";

#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

[] execVM "fixes\ZEVMission\ZEVMissionClientInit.sqf";
