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
private ["_route","_AIData","_aiGroupType","_aiFormation","_aiSide",
"_aIParmsQty","_groupData","_locationRadius","_locationPos","_missionIndex","_missionName",
"_aiunit","_aiGroup","_aiVehicle","_gunnerSpots","_VehiclePermanent","_aivehicleData","_vehicleName","_vehiclePosType","_vehiclePos",
"_VehicleAzimut","_VehicleLocked","_VehicleWLoot","_VehicleMLoot","_vehicleLootType","_vehicleLootItemsQty","_vehicleLootItems","_spawnDelay",
"_crews", "_crew","_aiUnitData","_vehicleData","_first","_static","_h"];
 
    _aiunit = objNull;
	
	_missionIndex		= _this select 0;
	_groupData			= _this select 1;
	_static				= _this select 2;
	_aIParmsQty			= _groupData select 0;
	_aiSide				= _groupData select 1;
	_aiFormation		= _groupData select 2;
	_aiGroupType		= _groupData select 3;
	_route				= _groupData select 4;
	_spawnDelay			= _groupData select 5;
	_crews				= _groupData select 6;
	
	_first 				= true;
	
	if(_aIParmsQty == 0) exitWith {};
	
	if(_spawnDelay != 0) then
	{
		sleep _spawnDelay;
	};
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
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex, true];
	_aiGroup setVariable ["ZEVMissionStatic", _static, true];

	{
		private ["_tmpInt","_tmpCon","_crewQtyMin","_crewQtyMax","_cargoQty"];
		_tmpInt 		= _x select 0;
		_tmpCon			= _x select 1;
		_aivehicleData 	= _tmpCon select 0;
		_AIData  		= _tmpCon select 1;
		_crewQtyMin		= _x select 2;
		_crewQtyMax     = _x select 3;
		
		_aiVehicle 	= [_missionIndex, _aivehicleData, _static] call ZEVMissionAddVehicle;
		
		[_aiVehicle, "Convoy", _missionIndex, 25, _static, "ColorRed"] spawn ZEVMissionAddUnitMarker;
		
		_aiunit		= [_aiGroup, _AIData] call ZEVMissionAddAIUnit;
		_aiunit assignAsDriver _aiVehicle;
		_aiunit moveInDriver _aiVehicle;
		_aiunit setSkill 1;
		/*
		if ( _aiVehicle isKindOf "Car" ) then
		{
			[_aiVehicle, _aiunit] spawn ZEVMissionAutoRepair;
		};
		*/
		if(ZEVMissionDebug > 0) then { diag_log format ["ZEVMission: add gunners %1",1]; };
//---------------------------------gunners--------------------------
		_gunnerSpots = _aiVehicle emptyPositions "gunner";
		_aiVehicle setVariable ["Pilot", _aiunit];
		for "_i" from 0 to (_gunnerSpots - 1) do 
		{
			_aiunit		= [_aiGroup, _AIData] call ZEVMissionAddAIUnit;
			_aiunit assignAsGunner _aiVehicle;
			_aiunit moveInGunner _aiVehicle;
			sleep 0.1;
		};
		if(ZEVMissionDebug > 0) then { diag_log format ["ZEVMission: add cargo units %1",1]; };
//---------------------------------CargoUnits--------------------------
		_gunnerSpots = _aiVehicle emptyPositions "cargo";
		
		_cargoQty = _crewQtyMin + floor(random(_crewQtyMax-_crewQtyMin));
		
		if (_cargoQty > _gunnerSpots) then
		{
			_cargoQty = _gunnerSpots;
		};
		
		for "_i" from 0 to (_cargoQty - 1) do 
		{
			_aiunit		= [_aiGroup, _AIData] call ZEVMissionAddAIUnit;
			_aiunit assignAsCargo _aiVehicle;
			_aiunit moveInCargo [_aiVehicle,_i];
			sleep 0.1;
		};
//---------------------------------Cargounits--------------------------
		_aivehicle setVehicleAmmo 1;
		[_aivehicle] spawn ZEVMissionVehicleRearm;
	} foreach _crews;
	
	if(ZEVMissionDebug > 0) then { diag_log format ["ZEVMission: add route %1",1]; };
	diag_log format ["ZEVMission: add route %1",1];
	[_aiGroup, _route, _missionIndex] call ZEVMissionAddWayPoints;
	diag_log format ["ZEVMission: add after route %1",1];
	[_aiVehicle, _missionIndex, _static] spawn 
	{
		private ["_veh","_idx","_parms","_pos", "_markerStatus","_stat"];
		_veh = _this select 0;
		_idx = _this select 1;
		_stat= _this select 2;
		_markerStatus = [_idx, _stat] call ZEVMissionGetMarkerStatus;
		while { (alive _veh) && (_markerStatus > 0)} do
		{
			_parms = [_idx, _stat] call ZEVMissionGetActiveMissionParms;//[_locationPos, _locationRadius, _locationTriggerRadius]];					
			_pos 	= getPos _veh;
			_parms set [0, _pos];
			[_idx, _stat, _parms] call ZEVMissionSetActiveMissionParms;
			_markerStatus = [_idx, _stat] call ZEVMissionGetMarkerStatus;
			sleep 10;
		};
	};

