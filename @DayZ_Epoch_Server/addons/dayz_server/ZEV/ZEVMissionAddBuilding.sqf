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
   private ["_missionIndex",
			"_missionParms",
			"_locationRadius","_locationPos","_vehicleLootItemsQty",
			"_vehicleList","_buildingName","_buildingPosType","_buildingPos",
			"_buildingAzimut","_building", "_ZEVBuildingRandomList","_static","_buildingRandomList"];

	_missionIndex 	= _this select 0;
	_vehicleData	= _this select 1;
	_static 		= _this select 2;
	
	_missionParms   = [_missionIndex, _static] call ZEVMissionGetActiveMissionParms; 
	
	_locationPos	= _missionParms select 0;
	_locationRadius	= _missionParms select 1;
	
	_buildingName		= _vehicleData select 0;
	_buildingPosType	= _vehicleData select 1;
	_buildingPos		= _vehicleData select 2;
	_buildingAzimut		= _vehicleData select 3;
	_buildingRandomList = _vehicleData select 4;
	
	//_ZEVBuildingRandomList = [_missionIndex, _static] call ZEVMissionGetBuildingRandomList;
	
	_buildingName = [_missionIndex, _buildingName, _buildingRandomList, ZEVBuildingList] call ZEVMissionSelect;
	
	_buildingPos = [_buildingPos, _buildingPosType, _locationPos, _locationRadius] call ZEVMissionSelectPos;
	
	if(_buildingPosType == "Random") then
	{
		
		_buildingAzimut     = round(random(360));
	};
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor  creating building: %1 at %2", _buildingName, _buildingPos]; };
	
	_building = createVehicle [_buildingName, _buildingPos, [], 0, "CAN_COLLIDE"];
	
	clearWeaponCargo 	_building;
	clearMagazineCargo 	_building;
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor  created building: %1", _building]; };

	_building setDir _buildingAzimut;
	_building setVariable ["ObjectID","1",true];
	_building setVariable ["ZEVBuilding", "Yes", true];
	_vehicleList = [_missionIndex, _static] call ZEVMissionGetVehicleList;
	_vehicleList set [count _vehicleList ,_building];
	[_missionIndex, _static, _vehicleList] call ZEVMissionSetVehicleList;
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_building];	
_building