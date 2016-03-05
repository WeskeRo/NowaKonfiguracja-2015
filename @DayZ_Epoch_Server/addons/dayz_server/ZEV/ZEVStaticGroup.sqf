//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
// 	Thanks to authors of EMS and WAI and BIS wiki for code examples
//
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://dzmissioneditor.ucoz.ru/
//
//-----------------------------------------------------------//
private ["_aiPos","_AIData","_groupData","_missionIndex","_aiunit","_aiGroup","_staticGunName","_staticGun","_static","_vehicleList","_missionObject","_groupParms","_groupChilds","_parms","_side","_spawnDelay","_staticGunParms","_azimut","_nameType","_randomList","_globalRandomList"];
 
    _aiunit = objNull;

	_missionObject	= _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort adding static group creation" call ZEVLog;
	};
	
	_groupData		= _this select 1;
	
	_missionIndex	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	
	_groupParms		= _groupData select 1;
	_groupChilds	= _groupData select 2;
	
	
	
	_parms				= [_groupParms, [ZEVSide,ZEVSpawnDelay]] call ZEVGetProperty;
	
	_side				= _parms select 0;
	_spawnDelay			= _parms select 1;
	
	_staticGun			= _groupChilds select 0;
	_aiData 			= _groupChilds select 1;

	
	
if(_spawnDelay != 0) then
{
    sleep _spawnDelay;
};
	/*
	if (_side == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if (_side == "RESISTANCE") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if (_side == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
    
	_aiGroup setVariable [ZEVIndex, _missionIndex];	
	_aiGroup setVariable [ZEVStatic,_static];	
*/	
	_staticGunParms		= _staticGun select 1;
	_aiGroup = [_missionObject, _side] call ZEVCreateGroup;
	
	_aiunit = [_missionObject, _aiGroup, _AIData] call ZEVAddAIUnit;
	
	_aiPos = _aiunit getVariable ["ZEVInitialPos", getPos _aiunit];
	_azimut= _aiunit getVariable ["ZEVInitialDir", getDir _aiunit];
	
	_parms = [_staticGunParms, [ZEVNameType,ZEVStaticGunName]] call ZEVGetProperty;
	
	_nameType 			= _parms select 0;
	_staticGunName		= _parms select 1;
	_randomList			= [_staticGunParms, ZEVStaticGunName] call ZEVGetPropertyRandomList;
	_globalRandomList	= ZEVStaticGunName call ZEVGetGlobalRandomList;
	_staticGunName = [_nameType, _staticGunName, _randomList, _globalRandomList] call ZEVSelect;
	_staticGun = createVehicle [_staticGunName, _aiPos, [], 0, "CAN_COLLIDE"]; 
	_staticGun setDir _azimut;
	_staticGun setPos _aiPos;

	//_staticGun addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
    _staticGun call ZEVAddToObjectMonitor;
	_aiunit moveingunner _staticGun;
	_staticGun setVariable ["ZEVBuilding", "Yes", true];
	_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
	_vehicleList set [count _vehicleList, _staticGun]; 
	[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;

	_staticGun setVariable ["ZEVMissionGunner", _aiunit];
	_staticGun setVariable [ZEVIndex, _missionIndex];
	
	_staticGun addEventHandler ["GetIn",{
		if (isPlayer (_this select 2)) then 
		{
			(_this select 2) action ["getOut",(_this select 0)]; 
		};
	}];
	_staticGun spawn ZEVFindGunner;
	[_staticGun, _static, _missionIndex] spawn 
	{
		if (!isServer) exitWith {};
		private ["_veh", "_static", "_missionIndex","_ZEVMissionInProgress","_missionRunStatus"];
		_veh 			= _this select 0;
		_static			= _this select 1;
		_missionIndex	= _this select 2;
		
		_ZEVMissionInProgress = [_static] call ZEVGetMissionInProgress; 
		_missionRunStatus 	  = _ZEVMissionInProgress select _missionIndex;
		
		while {_missionRunStatus > 0 && alive _veh} do 
		{
			_veh setVehicleAmmo 1;
			_veh setFuel 1;
			_veh setDamage 0;
			sleep 10;
			_ZEVMissionInProgress = [_static] call ZEVGetMissionInProgress; 
			_missionRunStatus 	  = _ZEVMissionInProgress select _missionIndex;
		};
		sleep 600;
		deleteVehicle _veh;
	};

