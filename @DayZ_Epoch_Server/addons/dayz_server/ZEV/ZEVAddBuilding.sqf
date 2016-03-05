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
   private ["_missionIndex","_locationRadius","_locationPos","_vehicleList","_buildingName","_buildingPosType","_buildingPos","_buildingAzimut","_building","_static","_missionObject","_buidlingData","_buldingsParms","_parms","_nameType","_randomList","_globalRandomList"];

	_missionObject 	= _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort building creation" call ZEVLog;
	};
	
	_buidlingData	= _this select 1;
	
	_missionIndex 	= _missionObject getVariable ZEVIndex;
	_static 		= _missionObject getVariable ZEVStatic;
	
	_buldingsParms	= _buidlingData select 1;

	_locationPos	= _missionObject getVariable ZEVLocationPos;
	_locationRadius	= _missionObject getVariable ZEVSpawnRadius;
	
	_buildingPos	= [_buldingsParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
	_parms			= [ZEVNameType,ZEVBuildingName,ZEVPositionType,ZEVAzimut];
	_parms			= [_buldingsParms, _parms] call ZEVGetProperty;
	_nameType			= _parms select 0;
	_buildingName		= _parms select 1;
	_buildingPosType	= _parms select 2;
	_buildingAzimut		= _parms select 3;
	
	_randomList			= [_buldingsParms, ZEVBuildingName] call ZEVGetPropertyRandomList;

	_globalRandomList   = ZEVBuildingName call ZEVGetGlobalRandomList;
	
	_buildingName = [_nameType, _buildingName, _randomList, _globalRandomList] call ZEVSelect;
	
	_buildingPos = [_buildingPos, _buildingPosType, _locationPos, _locationRadius] call ZEVSelectPos;
	
	if (_buildingPosType == ZEVRandom) then
	{
		_buildingAzimut     = round(random(360));
	};
	_building = createVehicle [_buildingName, _buildingPos, [], 0, "CAN_COLLIDE"];
	
	clearWeaponCargo 	_building;
	clearMagazineCargo 	_building;

	_building setDir _buildingAzimut;
	_building setVariable ["ZEVBuilding", "Yes", true];
	_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
	_vehicleList set [count _vehicleList ,_building];
	[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;
	_building call ZEVAddToObjectMonitor;
_building