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
			"_missionName",
			"_missionPosType",
			"_missionPos",
			"_missionRaduis",
			"_missionTriggerRaduis",
			"_missionStartMessage",
			"_missionEndMessage",
			"_missionData",
			"_buildings",
			"_vehicles",
			"_AIGroups",
			"_missionActualPos",
			"_buildingName",
			"_buildingPosType",
			"_buildingPos",
			"_buildingAzimut",
			"_building",
			"_vehicleName",
			"_vehiclePosType",
			"_vehiclePos",
			"_vehicleAzimut",
			"_vehicle",
			"_vehicleList",
			"_vehicleLoot",
			"_vehicleLootType",
			"_vehicleLootItems",
			"_playerCome",
			"_startTime",
			"_missionTimeOut",
			"_cleanMission",
			"_hAddGroup",
			"_missionFailMessage",
			"_locationQty",
			"_locationArray",
			"_buildingsData",
			"_buildingsQty",
			"_vehiclesQty",
			"_vehiclesData",
			"_AIGroupsQty",
			"_AIGroupsData",
			"_cnt","_weapon","_mags", "_tool", "_item",
			"_vehicleLootItemName", 
			"_vehicleLootCountType", 
			"_vehicleLootQty",
			"_playerInTrigger",
			"_randomList",
			"_vehicleLocked",
			"_unitMissionIndex",
			"_vehicleWeaponLoot",
			"_vehicleMagazineLoot","_missionTimeLimit","_locationRadius","_locationPos","_vehicleLootItemsQty",
			"_allUnitsDead","_currentTime","_vehicleList2","_vehiclePermanent","_cnt","_static","_unitMissionStatic","_locationTriggerRadius","_scriptHandle"];

	_missionIndex		= _this select 0;

	_missionName		= _this select 1;

	_missionEndMessage  = _this select 2;

	_missionFailMessage = _this select 3;

	_missionTimeLimit   = _this select 4;

	_locationRadius		= _this select 5;

	_locationPos		= _this select 6;

	_buildingsData		= _this select 7;

	_vehiclesData		= _this select 8;

	_AIGroupsData   	= _this select 9;

	_static				= _this select 10;
	
	diag_log format["ZEVMission - ZEVMissionMonitor (Static = %1) : start mission %2", _static, _missionName];
	
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor (Static = %1) _this = %2", _static, _this]; };


	_vehicleList		= [];
	_vehicleList2		= [];

		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  somebody in trigger zone , create all mission stuff at %1", _locationPos, _static]; };
		if(ZEVMissionDebug ==-1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  somebody in trigger zone , create all mission stuff at %1", _locationPos, _static]; };
		
		_vehiclesQty		= 0;
		_vehiclesQty		= _vehiclesData select 0;
		_vehicles			= [];
		_vehicles			= _vehiclesData select 1;

		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2)  _vehicles = %1 "   , _vehicles, _static]; };
		
		if (_vehiclesQty > 0) then
		{
			{
				[_missionIndex, _x, _static] call ZEVMissionAddVehicle;
			} foreach _vehicles;
		};	
		
		_buildingsQty		= _buildingsData select 0;
		_buildings			= _buildingsData select 1;
		
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  place buildings qty = %1", _buildingsQty, _static]; };
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  _buildings = %1 ", _buildings, _static]; };
		if( _buildingsQty > 0) then
		{
			{
				[_missionIndex, _x, _static] call ZEVMissionAddBuilding;
			}foreach _buildings;
		};
		

		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor:  adding life forces %1", "_"]; };
		
		_AIGroupsQty		= 0;
		_AIGroupsQty		= _AIGroupsData select 0;
		_AIGroups			= _AIGroupsData select 1;
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  _AIGroupsQty = %1 ", _AIGroupsQty, _static]; };
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  _AIGroups = %1 ", _AIGroups, _static]; };
		
		if(_AIGroupsQty > 0) then
		{
			{
				private ["_groupType"];
				
				_groupType 	= _x select 3;
				_scriptHandle = -1;
				if(_groupType == "Infantry") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionAddInfantry;
				};
				if(_groupType == "InfantrySquad") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionAddInfantrySquad;
				};
				if(_groupType == "ParadropSquad") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionAddParadropSquadStart;
				};
				if(_groupType == "Static group") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionStaticGroup;
				};
				if(_groupType == "Vehicle group") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionVehicleGroup;
				};
				if(_groupType == "Vehicle convoy group") then
				{
					_scriptHandle = [_missionIndex, _x, _static] spawn ZEVMissionVehicleConvoy;
					sleep 5;
				};
/*
				if(!isNil "_scriptHandle" && _scriptHandle != -1) then
				{
					waitUntil { scriptDone _scriptHandle; };
				};
*/				
				sleep 0.5;
			}foreach _AIGroups;
		};

		_startTime = floor(time);

		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  start waiting for player will be in 30m at %1 or mission is timed out", _locationPos, _static]; };
		
		_allUnitsDead = true;
		
		_playerCome = false;
		
		_playerInTrigger = false;
		
		waitUntil
		{
			private ["_missionParms"];
			
			sleep ZEVMissionConditionCheckTime;
			
			_playerCome 	= false;
			
			_cleanMission  	= false;
			
			_allUnitsDead  	= true;
			
			_playerInTrigger= false;
			
			_missionParms 	= [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;// [_locationPos, _locationRadius, _locationTriggerRadius]];
			
			_locationPos 	=  _missionParms select 0;
			_locationTriggerRadius = _missionParms select 2;
			_playerCome 	= false;//[_locationPos, 30] call ZEVMissionIsPlayerInRange;

			if(_playerCome) then
			{
				_playerInTrigger = true;
			}
			else
			{
				_playerInTrigger = [_locationPos, _locationTriggerRadius] call ZEVMissionIsPlayerInRange;
			};
			if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor _playerInTrigger=%1", _playerInTrigger]; };
			if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor _playerInTrigger=%1", _playerInTrigger]; };

			_currentTime = floor(time);
			
			if((_playerCome) or (_playerInTrigger)) then 
			{
				_startTime = floor(time);
			};
			
			if (_currenttime - _startTime >= _missionTimeLimit) then 
			{
				_cleanMission = true;
			};
			
			
			// calc alive ai units
			_cnt = [_missionIndex, _static] call ZEVMissionAliveUnitCount;
			if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor ZEVMissionAliveUnitCount=%1", _cnt]; };
			if(_cnt > 0) then
			{
				_allUnitsDead = false;
			};
			if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor (_playerCome) or (_cleanMission) or(_allUnitsDead)=%1", (_playerCome) or (_cleanMission) or(_allUnitsDead)]; };
			if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor (_playerCome) or (_cleanMission) or(_allUnitsDead)=%1", (_playerCome) or (_cleanMission) or(_allUnitsDead)]; };
			((_playerCome) or (_cleanMission) or(_allUnitsDead))
		};
		
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  condition of end mission %1 is equal TRUE ", _missionName, _static]; };
		if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  condition of end mission %1 is equal TRUE ", _missionName, _static]; };
		
		
		[_missionIndex, _static, 0] call ZEVMissionSetMarkerStatus;
		
		if(_cleanMission)	then
		{
			//diag_log format["ZEVMission: Mission %1 Timed Out At %2",_missionName, _locationPos];
			//customRemoteMessage = ['hint', "say something in hint"];
			//publicVariable "customRemoteMessage";
			//[nil,nil,rTitleText,_missionFailMessage, "PLAIN",10] call RE;
			ZEVMissionHintRed = [_missionFailMessage, 'MISSION FAILED']; publicVariable "ZEVMissionHintRed";

		}
		else
		{
			//diag_log format["ZEVMission: Mission %1 Ended At %2",_missionName, _locationPos];
			//[nil,nil,rTitleText,_missionEndMessage, "PLAIN",10] call RE;
			ZEVMissionHint = [_missionEndMessage, _missionName]; publicVariable "ZEVMissionHint";
		};

		_loop1 = 0;
	


	if(!_cleanMission)	then
	{
		if(ZEVMissionDebug == -1) then { diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2): wait for %1 sec before clean objects", ZEVMissionFinishedMissionCleanupDelay, _static];};
		if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2): wait for %1 sec before clean objects", ZEVMissionFinishedMissionCleanupDelay, _static];};
		sleep ZEVMissionFinishedMissionCleanupDelay;
	};

	if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor:  cleanup mission %1", _missionName]; };
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor:  cleanup mission %1", _missionName]; };
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor:  _cleanMission  = %1 ", _cleanMission ]; };
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor:  _allUnitsDead = %1 ", _allUnitsDead ]; };
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor:  (_allUnitsDead OR _cleanMission) = %1 ", (_allUnitsDead OR _cleanMission) ]; };
	if(_allUnitsDead OR _cleanMission) then
	{
		
		{
			_unitMissionIndex  = _x getVariable ["ZEVMissionIndex", -1];
			_unitMissionStatic = _x getVariable ["ZEVMissionStatic", -1];
			if ((_unitMissionIndex == _missionIndex) and (_unitMissionStatic == _static) and (alive _x)) then 
			{
				_x setDamage 1;
				sleep 0.5;
				deleteVehicle _x;
				sleep 0.05;
			};	
		} forEach allUnits;

		_vehicleList = [_missionIndex, _static] call ZEVMissionGetVehicleList;
		
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  _vehicleList = %1 ", _vehicleList , _static]; };
		{
			
			_vehicle = _x;
			
			if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  analyzing vehicle %1 to delete...", _vehicle,_static]; };
			
			_vehiclePermanent = _vehicle getVariable ["ZEVPermanent", "No"];
			if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  _vehiclePermanent = %1", _vehiclePermanent, _static]; };
			if((_vehiclePermanent == "Yes") && _allUnitsDead) then
			{
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  save vehicle to database", _vehiclePermanent, _static]; };
				[_vehicle] call ZEVMissionSaveToHive;
			}
			else
			{
				if(_vehicle getVariable ["ZEVBuilding", "No"] == "Yes") then
				{
					if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  delete vehicle ...", _vehiclePermanent, _static]; };
					deleteVehicle _vehicle;
				}
				else
				{
					//если машинка и не сохраняем в базу то
					// удаляем если рядом(в радиусе 100м) нет игроков
					if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2):  analyzing is player in 100 m range", _vehiclePermanent,_static]; };
					_vehicle spawn 
					{
						waitUntil {sleep 60; ({(isPlayer _x) && (_x distance _this < 100)} count allUnits) < 1};
						deleteVehicle _this;
					};
				};
			};
		} foreach _vehicleList;
	};

	[_missionIndex, _static, []] call ZEVMissionSetVehicleList;
	
	sleep ZEVMissionPostDelay;
	if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %1): setup ZEVMissionSetMissionInProgress", _static]; };
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %1): setup ZEVMissionSetMissionInProgress", _static]; };
	[_missionIndex, _static, 0]    call ZEVMissionSetMissionInProgress;

	if(_static == 0) then
	{
		if(ZEVMissionDebug == -1) then {diag_log format["ZEVMission - ZEVMissionMonitor(Static = %1): set mission finish time as %2", _static, time]; };		
		[_missionIndex, _static, time] call ZEVMissionSetMissionLastFinishTime;
	};
	if(_static == 1) then
	{
		if (_cleanMission) then
		{
			[_missionIndex, _static, time - ZEVMissionCooldownTime] call ZEVMissionSetMissionLastFinishTime;
		}
		else
		{
			[_missionIndex, _static, time] call ZEVMissionSetMissionLastFinishTime;
		};
	};
	
	diag_log format["ZEVMission - ZEVMissionMonitor(Static = %2): Mission  %1 finished",_missionName, _static];

