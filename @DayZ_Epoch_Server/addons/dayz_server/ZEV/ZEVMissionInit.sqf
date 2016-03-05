//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
// 	Thanks to authors of EMS and WAI and BIS wiki for code examples
//
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://DayZMissionEditor.ru/
//  YouTube : http://www.youtube.com/channel/UCWuzUxNJ_Ctf9ynoJqiV2ww
//
//-----------------------------------------------------------//
private ["_files","_fileName","_compileCode"];
if(!isServer) exitWith {};
waituntil {!isnil "bis_fnc_init"};
if(!isnil "ZEVStarted") exitWith {};
ZEVStarted = true;
ZEVDebugMode = false;
ZEVFiles = "ZEVMission\";
if(ZEVDebugMode) then
{
	ZEVFiles = "ZEVMission\";
};
ZEVSleepSmall				= 0.001;
ZEVSleep01					= 0.01;
ZEVSleep1					= 1;
ZEVIndex 					= "ZEVIndex";
ZEVStatic 					= "ZEVStatic";
ZEVObject					= "ZEVObject"; 
ZEVLocationPos				= "LocationPos";
ZEVRandom					= "Random";
ZEVSpecified				= "Specified";
ZEVGroupSkills				= "ZEVGroupSkills";
ZEVGroupList				= "ZEVGroupList";
ZEVYES						= "YES";
ZEVNO						= "No";
ZEVClearBody				= "ZEVClearBody";
ZEVDeleteLaunchers			= "ZEVDeleteLaunchers";
ZEVDeleteNVGoogle			= "ZEVDeleteNVGoogle";
ZEVHumanityGain				= "ZEVHumanityGain";
ZEVInitialPos				= "ZEVInitialPos";
ZEVHeadShots				= "headShots";
ZEVCashMoney				= "CashMoney";
ZEVArmor					= "ZEVArmor";
ZEVNVGoggles				= "NVGoggles";
ZEVGroupSkillsValueType		= "ZEVGroupSkillsValueType";
ZEVMissionDone				= "MissionDone";
ZEVStartTime				= "ZEVStartTime";
ZEV_MISSION_DONE			= "MISSION_DONE";
ZEV_WAIT					= "WAIT";
ZEV_TIMEOUT					= "TIMEOUT";
ZEV_ALL_AI_DEAD				= "ALL_AI_DEAD";
ZEV_PLAYER_IN_CENTER		= "PLAYER_IN_CENTER";
ZEV_CAPTURE_VEHICLE			= "CAPTURE_VEHICLE";
ZEV_START_WHEN_SPAWN		= "START_WHEN_SPAWN";
ZEV_PLAYER_IN_TRIGGER		= "PLAYER_IN_TRIGGER";
ZEV_PLAYER					= "PLAYER";
ZEV_START					= "START";
ZEVRandomList				= "RandomList";
ZEVMod						= "Arma2DayZEpoch";
ZEV_AI_Group				= "AI Group";
ZEV_AI_Squad				= "AI Squad";
ZEV_AI_Paradrop				= "AI Paradrop";
ZEV_AI_Static_group			= "AI Static group";
ZEV_AI_Vehicle_group		= "AI Vehicle group";
ZEV_AI_Vehicle_convoy_group = "AI Vehicle convoy group";
ZEV_MinefieldGroup			= "MinefieldGroup";
ZEVNeedRepair				= "ZEVNeedRepair";
ZEV_BuildingPatrol			= "BuildingPatrol";
ZEVMissionEndReason			= "ZEVMissionEndReason";
ZEVAIList					= "ZEVAIList";
ZEVMissionObject			= [];
ZEVMissionStaticObject		= [];
ZEVMissionList				= [];
ZEVEASTSkinRandomList		= [];
ZEVResistanceSkinRandomList = [];
ZEVCivilianSkinRandomList   = [];
ZEVActiveMissionParm		= [];
ZEVWeaponRandomList			= [];
ZEVBuildingRandomList		= [];
ZEVVehicleRandomList		= [];
ZEVBackPackRandomList		= [];
ZEVGearRandomList			= [];
ZEVBackpackGearRandomList	= [];
ZEVMissionGroups			= [];
ZEVMissionLastFinishTime	= [];
ZEVMissionVehicles			= [];
ZEVMissionAIList			= [];

ZEVStaticMissionList  				= [];
ZEVStaticEASTSkinRandomList			= [];
ZEVStaticResistanceSkinRandomList 	= [];
ZEVStaticCivilianSkinRandomList   	= [];
ZEVStaticActiveMissionParm			= [];
ZEVStaticWeaponRandomList			= [];
ZEVStaticBuildingRandomList			= [];
ZEVStaticVehicleRandomList			= [];
ZEVStaticBackPackRandomList			= [];
ZEVStaticGearRandomList				= [];
ZEVStaticBackpackGearRandomList		= [];
ZEVStaticMissionGroups				= [];
ZEVStaticMissionLastFinishTime		= [];
ZEVStaticMissionVehicles			= [];
ZEVStaticMissionAIList				= [];
//-------------------
WEST setFriend [EAST,0];
WEST setFriend [Resistance,0];
EAST setFriend [WEST,0];
EAST setFriend [Resistance, 1];
Resistance setFriend [EAST, 1];
Resistance setFriend [WEST,0];
EAST setFriend [Civilian, 1];
Resistance setFriend [Civilian, 1];
Civilian setFriend [East, 1];
Civilian setFriend [Resistance, 1];
//mission add here, like this:

ZEVGlobalRandomList = [];
#include "Mission\ZEVMissions.sqf";
/*
switch (ZEVMod) do
{
	case "ARMA2EPOCH": { #define ZEVARMA2 1};
	case "ARMA3EPOCH": { #define ZEVARMA3 1};
	case "ARMA3EXILE": { #define ZEVARMA3 1};
	
};
*/


ZEVMissionCount							= count ZEVMissionList;
ZEVStaticMissionCount					= count ZEVStaticMissionList;
ZEVMissionMapName						= "Napf"; //Chernorus,...

ZEVMissionInProgress					= [];
ZEVMissionMarkerStatus  				= [];

ZEVStaticMissionInProgress				= [];
ZEVStaticMissionMarkerStatus  			= [];
{
	ZEVMissionInProgress 				= ZEVMissionInProgress + [0];
	ZEVMissionLastFinishTime 			= ZEVMissionLastFinishTime + [ - ZEVMissionCooldownTime];
	ZEVMissionMarkerStatus				= ZEVMissionMarkerStatus + [0];
	ZEVActiveMissionParm 	set [count ZEVActiveMissionParm, [[0,0,0],0,0]]; //[pos, trigRadius, radius]
	ZEVMissionVehicles   	set [count ZEVMissionVehicles, []]; 
	ZEVMissionAIList		set [count ZEVMissionAIList, 0]; 
	ZEVMissionObject		set [count ZEVMissionObject, objNull];
} foreach ZEVMissionList;


{
	ZEVStaticMissionInProgress 			= ZEVStaticMissionInProgress + [0];
	ZEVStaticMissionLastFinishTime 		= ZEVStaticMissionLastFinishTime + [ - ZEVMissionCooldownTime];
	ZEVStaticMissionMarkerStatus		= ZEVStaticMissionMarkerStatus + [0];
	ZEVStaticActiveMissionParm 	set [count ZEVStaticActiveMissionParm, [[0,0,0],0,0]]; //[pos, trigRadius, radius]
	ZEVStaticMissionVehicles   	set [count ZEVStaticMissionVehicles, []]; 
	ZEVStaticMissionAIList		set [count ZEVStaticMissionAIList, 0];
	ZEVMissionStaticObject		set [count ZEVMissionStaticObject, objNull];
} foreach ZEVStaticMissionList;

publicVariable "ZEVMissionList";
publicVariable "ZEVMissionInProgress";

_files = 
[
"ZEVLoop",
"ZEVStaticMissionLoop",
"ZEVStart",
"ZEVAddMarker",
"ZEVAddUnitMarker",
"ZEVAddWayPoints",
"ZEVMonitor",
"ZEVFindRunningMissionInRadius",
"ZEVSelectSkin",
"ZEVSelectPos",
"ZEVAddBackpack",
"ZEVSetupSkills",
"ZEVVehicleMonitor",
"ZEVSelect",
"ZEVSaveToHive",
"ZEVVehicleRearm",
"ZEVAddAIUnit",
"ZEVBodyclean",
"ZEVAddInfantry",
"ZEVAddInfantrySquad",
"ZEVAddParadropStart",
"ZEVAddParadropDrop",
"ZEVAddVehicle",
"ZEVAddBuilding",
"ZEVIsPlayerInRange",
"ZEVStaticGroup",
"ZEVAliveUnitCount",
"ZEVVehicleGroup",
"ZEVVehicleConvoy",
"ZEVRunStatic",
"ZEVThrowSmokeShell",
"ZEVGetMissionInProgress",
"ZEVGetMissionCount",
"ZEVGetMissionParms",
"ZEVSetMissionInProgress",
"ZEVSetActiveMissionParms",
"ZEVGetMarkerStatus",
"ZEVGetActiveMissionParms",
"ZEVGetVehicleList",
"ZEVSetVehicleList",
"ZEVSetMissionLastFinishTime",
"ZEVGetMissionLastFinishTime",
"ZEVSetMarkerStatus",
"ZEVLoadProperty",
"ZEVGetProperty",
"ZEVGetPropertyRandomList",
"ZEVAddWeapon",
"ZEVLog",
"ZEVGetGlobalRandomList",
"ZEVAddItemToObject",
"ZEVPlayerDetect",
"ZEVAddToObjectMonitor",
"ZEVLockVehicle",
"ZEVAddCaptureTrigger",
"ZEVCheckStartCondition",
"ZEVCheckEndCondition",
"ZEVSpawnMission",
"ZEVDespawnMission",
"ZEVAddCaptureHandler",
"ZEVAddBox",
"ZEVMinefield",
"ZEVAddAI2List",
"ZEVAddAircraft",
"ZEVAutoRepair",
"ZEVDetectPlayers",
"ZEVSetupVehicle",
"ZEVFindGunner",
"ZEVVehicleDamaged",
"ZEVBuildingPatrol",
"ZEVAddAreaSecurity",
"ZEVBuildingPos",
"ZEVCreateGroup",
"ZEVLockToFinish",
"ZEVAddHeadGear",
"ZEVAddVest",
"ZEVAddUniform",
"ZEVRestrictAccess",
"ZEVLockVehicle_ARMA2EPOCH",
"ZEVLockVehicle_ARMA3EPOCH",
"ZEVLockVehicle_ARMA3EXILE",
"ZEVAddMine",
"ZEVAddMine_ARMA2EPOCH",
"ZEVAddMine_ARMA3EPOCH",
"ZEVAddMine_ARMA3EXILE",
"ZEVShowMessage",
"ZEVAddToObjectMonitor_ARMA2DAYZ",
"ZEVAddToObjectMonitor_ARMA2EPOCH",
"ZEVAddToObjectMonitor_ARMA3EPOCH",
"ZEVAddToObjectMonitor_ARMA3EXILE"
];

{
	_compileCode = format ['%1 = compile preprocessFileLineNumbers "%2%1.sqf";', _x, ZEVFiles];
	[] call compile _compileCode;
} foreach _files;

sleep 30;
"ZEVMission: run staic missions:" call ZEVLog;
[1] spawn ZEVStaticMissionLoop;
sleep 30;
"ZEVMission: start main loop:" call ZEVLog;
[0] spawn ZEVLoop;
