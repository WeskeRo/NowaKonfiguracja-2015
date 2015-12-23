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
private ["_h","_idx"];

if(!isServer) exitWith {};

waituntil {!isnil "bis_fnc_init"};

#include "\z\addons\dayz_server\ZEV\ZEVMissionArrayInit.sqf";
// Обычные миссии
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
// Статичиские миссии

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
#include "\z\addons\dayz_server\ZEV\Mission\ZEVMissions.sqf";


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
	ZEVActiveMissionParm set [count ZEVActiveMissionParm, [[0,0,0],0,0]]; //[pos, trigRadius, radius]
	ZEVMissionVehicles   set [count ZEVMissionVehicles, []]; 
} foreach ZEVMissionList;


{
	ZEVStaticMissionInProgress 			= ZEVStaticMissionInProgress + [0];
	ZEVStaticMissionLastFinishTime 		= ZEVStaticMissionLastFinishTime + [ - ZEVMissionCooldownTime];
	ZEVStaticMissionMarkerStatus		= ZEVStaticMissionMarkerStatus + [0];
	ZEVStaticActiveMissionParm set [count ZEVStaticActiveMissionParm, [[0,0,0],0,0]]; //[pos, trigRadius, radius]
	ZEVStaticMissionVehicles   set [count ZEVStaticMissionVehicles, []]; 
} foreach ZEVStaticMissionList;

publicVariable "ZEVMissionList";
publicVariable "ZEVMissionInProgress";



ZEVMissionLoop  						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionLoop.sqf";
ZEVStaticMissionLoop					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVStaticMissionLoop.sqf";
ZEVMissionStart							= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionStart.sqf";
ZEVMissionAddMarker						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddMarker.sqf";
ZEVMissionAddUnitMarker					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddUnitMarker.sqf";
ZEVMissionAddWayPoints					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddWayPoints.sqf";
ZEVMissionMonitor						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionMonitor.sqf";
ZEVMissionDamageHandler 				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionDamageHandler.sqf";
ZEVMissionFindRunningMissionInRadius 	= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionFindRunningMissionInRadius.sqf";
ZEVMissionSelectSkin 					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSelectSkin.sqf";
ZEVMissionSelectPos  					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSelectPos.sqf";
ZEVMissionSelectWeapon 					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSelectWeapon.sqf";
ZEVMissionAddBackpack  					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddBackpack.sqf";
ZEVMissionSetupSkills  					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetupSkills.sqf";
ZEVMissionVehicleMonitor				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleMonitor.sqf";
ZEVMissionAddGear						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddGear.sqf";
ZEVMissionSelect						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSelect.sqf";
ZEVMissionVehicleAddLoot				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleAddLoot.sqf";
ZEVMissionAddBackPackGear				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddBackPackGear.sqf";
ZEVMissionSaveToHive					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSaveToHive.sqf";
ZEVMissionVehicleRearm					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleRearm.sqf";
ZEVMissionAddAIUnit						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddAIUnit.sqf";
ZEVMissionBodyclean						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionBodyclean.sqf";
ZEVMissionAddInfantry					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddInfantry.sqf";
ZEVMissionAddInfantrySquad  			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddInfantrySquad.sqf";
ZEVMissionAddParadropSquadStart			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddParadropSquad1.sqf";
ZEVMissionAddParadropSquadDrop			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddParadropSquad2.sqf";
ZEVMissionAddVehicle					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddVehicle.sqf";
ZEVMissionAddBuilding					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAddBuilding.sqf";
ZEVMissionIsPlayerInRange				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionIsPlayerInRange.sqf";
ZEVMissionStaticGroup					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionStaticGroup.sqf";
ZEVMissionAliveUnitCount				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAliveUnitCount.sqf";
ZEVMissionVehicleGroup					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleGroup.sqf";
ZEVMissionVehicleConvoy					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleConvoy.sqf";
ZEVMissionRunStatic						= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionRunStatic.sqf";
ZEVMissionThrowSmokeShell				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionThrowSmokeShell.sqf";
ZEVMissionGetMissionInProgress			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetMissionInProgress.sqf";
ZEVMissionGetMissionCount				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetMissionCount.sqf";
ZEVMissionGetMissionParms				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetMissionParms.sqf";
ZEVMissionSetMissionInProgress			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetMissionInProgress.sqf";
ZEVMissionSetActiveMissionParms			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetActiveMissionParms.sqf";
ZEVMissionGetMarkerStatus				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetMarkerStatus.sqf";
ZEVMissionGetActiveMissionParms			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetActiveMissionParms.sqf";
ZEVMissionGetVehicleList				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetVehicleList.sqf";
ZEVMissionSetVehicleList				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetVehicleList.sqf";
ZEVMissionSetMissionLastFinishTime		= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetMissionLastFinishTime.sqf";
ZEVMissionGetMissionLastFinishTime		= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetMissionLastFinishTime.sqf";
ZEVMissionSetMarkerStatus				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionSetMarkerStatus.sqf";
ZEVMissionGetVehicleRandomList			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetVehicleRandomList.sqf";
ZEVMissionGetBuildingRandomList			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetBuildingRandomList.sqf";
ZEVMissionGetWeaponRandomList			= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetWeaponRandomList.sqf";
ZEVMissionGetGearRandomList				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetGearRandomList.sqf";
ZEVMissionVehicleFindGunner				= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionVehicleFindGunner.sqf";
ZEVMissionAutoRepair					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionAutoRepair.sqf";
ZEVMissionGetHitPoints					= compile preprocessFileLineNumbers "\z\addons\dayz_server\ZEV\ZEVMissionGetHitPoints.sqf";
sleep 60;
diag_log "ZEVMission: run staic missions:";
[1] spawn ZEVStaticMissionLoop;//Статичные
sleep 60;
diag_log "ZEVMission: start main loop:";
[0] spawn ZEVMissionLoop;//Обычные
