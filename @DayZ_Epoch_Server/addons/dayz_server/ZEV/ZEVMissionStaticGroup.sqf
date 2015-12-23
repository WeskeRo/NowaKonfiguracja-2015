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
private ["_aiPos","_AIData","_aiGroupType","_aiFormation","_aiSide",
"_aIParmsQty","_groupData","_locationRadius","_locationPos","_missionIndex",
"_aiunit","_aiGroup","_staticGunName","_staticGun","_missionParms","_static","_vehicleList"];
 
    _aiunit = objNull;

	_missionIndex	= _this select 0;
	_groupData		= _this select 1;
	_static			= _this select 2;
	
	_aIParmsQty			= _groupData select 0;
	_aiSide				= _groupData select 1;
	_aiFormation		= _groupData select 2;
	_aiGroupType		= _groupData select 3;
	_AIData 			= _groupData select 4;
	_staticGunName		= _groupData select 5;
	
	if(_aiSide == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if(_aiSide == "RESISTANCE") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if(_aiSide == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	
	_aiGroup setFormation _aiFormation;		
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex];	
	_aiGroup setVariable ["ZEVMissionStatic", _static];	
	
	_aiunit = [_aiGroup, _AIData] call ZEVMissionAddAIUnit;
	_aiPos = _aiunit getVariable ["ZEVMissionInitialPos", getPos _aiunit];
	_azimut= _aiunit getVariable ["ZEVMissionInitialDir", getDir _aiunit];
	//_aiPos = getPos _aiunit;
	_staticGun = createVehicle [_staticGunName, _aiPos, [], 0, "CAN_COLLIDE"]; 
	//_staticGun setDir round(random 360);
	_staticGun setDir _azimut;
	_staticGun setPos _aiPos;

	_staticGun addEventHandler ["GetOut",{(_this select 0) setDamage 1;}];
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _staticGun];
	_aiunit moveingunner _staticGun;
	_staticGun setVariable ["ZEVBuilding", "Yes", true];
	_vehicleList = [_missionIndex, _static] call ZEVMissionGetVehicleList;
	_vehicleList set [count _vehicleList, _staticGun]; 
	[_missionIndex, _static, _vehicleList] call ZEVMissionSetVehicleList;

	_staticGun setVariable ["ZEVMissionGunner", _aiunit];
	
	//[_staticGun, _static, _missionIndex] spawn ZEVMissionVehicleFindGunner;

	_staticGun addEventHandler ["GetIn",{
		if (isPlayer (_this select 2)) then 
		{
			(_this select 2) action ["getOut",(_this select 0)]; 
		};
	}];
	
	[_staticGun, _static, _missionIndex] spawn {
		if (!isServer) exitWith {};
		private ["_veh", "_static", "_missionIndex","_ZEVMissionInProgress","_missionRunStatus"];
		_veh 			= _this select 0;
		_static			= _this select 1;
		_missionIndex	= _this select 2;
		
		_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
		_missionRunStatus 	  = _ZEVMissionInProgress select _missionIndex;
		
		while {_missionRunStatus > 0} do 
		{
			_veh setVehicleAmmo 1;
			_veh setFuel 1;
			_veh setDamage 0;
			sleep 5;
			_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
			_missionRunStatus 	  = _ZEVMissionInProgress select _missionIndex;
		};
		sleep 600;
		deleteVehicle _veh;
		};

