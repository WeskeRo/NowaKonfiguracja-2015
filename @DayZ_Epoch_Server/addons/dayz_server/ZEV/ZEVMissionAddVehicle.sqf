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
   private ["_missionIndex","_missionParms","_vehicleName",	"_vehiclePosType","_vehiclePos","_vehicleAzimut","_vehicle","_vehicleLootType",
			"_vehicleLootItems","_vehicleLocked","_vehicleWeaponLoot","_vehicleMagazineLoot","_locationRadius","_locationPos","_vehicleLootItemsQty",
			"_vehiclePermanent","_vehicleData","_vehicleList","_gunnerSpots","_static","_ZEVVehicleRandomList","_vehicleRandomList",
			"_damageMin","_damageMax","_fuelMin","_fuelMax","_absolutePos"];

	_missionIndex 		= _this select 0;
	_vehicleData		= _this select 1;
	_static				= _this select 2;
	_absolutePos		= false;
	if(count _this == 4) then
	{
		_absolutePos 	= _this select 3;
	};
	_missionParms		= [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;
	
	_locationPos		= _missionParms select 0;
	_locationRadius		= _missionParms select 1;
	
	_vehicleName		= _vehicleData select 0;
	_vehiclePosType		= _vehicleData select 1;
	_vehiclePos			= _vehicleData select 2;
	_vehicleAzimut		= _vehicleData select 3;
	_vehicleLocked		= _vehicleData select 4;
	_vehicleWeaponLoot	= _vehicleData select 5;
	_vehicleMagazineLoot= _vehicleData select 6;
	_vehiclePermanent	= _vehicleData select 7;
	_vehicleRandomList  = _vehicleData select 8;
	_damageMin			= _vehicleData select 9;
	_damageMax			= _vehicleData select 10;
	_fuelMin			= _vehicleData select 11;
	_fuelMax			= _vehicleData select 12;
	
	if (_damageMin < 20) 			then { _damageMin = 20;};
	if (_damageMax > 80) 			then { _damageMax = 80;};
	if (_damageMin > _damageMax)	then { _damageMin = _damageMax;};
		
	if (_fuelMin < 0) 				then { _fuelMin = 0;};
	if (_fuelMax > 100) 			then { _fuelMax = 100;};
	if (_fuelMin > _fuelMax) 		then {_fuelMin = _fuelMax;};
	
	_damageMin 	= (_damageMin + random(_damageMax - _damageMin))/100;
	
	_fuelMin	= (_fuelMin + random(_fuelMax - _fuelMin))/100;
	//_ZEVVehicleRandomList = [_missionIndex, _static] call ZEVMissionGetVehicleRandomList;
	
	_vehicleName = [_missionIndex, _vehicleName, _vehicleRandomList, ZEVVehicleList] call ZEVMissionSelect;
	
	if(_absolutePos) then
	{
		_vehiclePos = _vehiclePos;
	} 
	else
	{
		_vehiclePos = [_vehiclePos, _vehiclePosType, _locationPos, _locationRadius] call ZEVMissionSelectPos;
	};
	
	if(_vehiclePosType == "Random") then
	{
		_vehicleAzimut	= round(random(360));
	};
	
	_vehicle 			= createVehicle [_vehicleName, _vehiclePos, [], 0, "CAN_COLLIDE"];
	

	_vehicle setPos _vehiclePos;
	_vehicle setVectorUp surfaceNormal position _vehicle;	
	_vehicle setDir _vehicleAzimut;
	
	if (_vehicle isKindOf "Car") then
	{
		_roads = _vehiclePos  nearRoads 20;
		if(count _roads > 0) then
		{
			_vehiclePos = position (_roads select 0);
			_vehicle setPosATL _vehiclePos;
		};
	};
	
	_vehicle setVariable ["ZEVPermanent", _vehiclePermanent, true];

	
	_vehicleList = [_missionIndex, _static] call ZEVMissionGetVehicleList;
	
	_vehicleList set [count _vehicleList, _vehicle]; 
	
	[_missionIndex, _static, _vehicleList] call ZEVMissionSetVehicleList;
	
	_vehicle setVariable ["ObjectID","1",true];
	_vehicle setVariable ["ZEVMissionIndex", _missionIndex, true];
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _vehicle];	
	
	clearWeaponCargoGlobal 		_vehicle;
	clearMagazineCargoGlobal 	_vehicle;

	_vehicleLootType 	= _vehicleWeaponLoot select 0;
	_vehicleLootItemsQty= _vehicleWeaponLoot select 1;
	_vehicleLootItems	= _vehicleWeaponLoot select 2;

	
	[_vehicle, "weapon", _vehicleLootType, _vehicleLootItemsQty, _vehicleLootItems, _static] call ZEVMissionVehicleAddLoot;
	
	_vehicleLootType 	= _vehicleMagazineLoot select 0;
	_vehicleLootItemsQty= _vehicleMagazineLoot select 1;
	_vehicleLootItems	= _vehicleMagazineLoot select 2;
	[_vehicle, "magazine", _vehicleLootType, _vehicleLootItemsQty, _vehicleLootItems, _static] call ZEVMissionVehicleAddLoot;

/*
	if(_VehiclePermanent == "No") then
	{
		[_vehicle] spawn {
			if (!isServer) exitWith {};
			private ["_veh"];
			_veh = _this select 0;
			waitUntil { count crew _veh > 0};
			
			while {(alive _veh) and ({alive _x} count crew _veh > 0)} do 
			{
				sleep 30;
			};
			sleep 1200;
			_veh setDamage 1;
			_veh setVariable ["killedat", time];
			};
	};
*/	
	_gunnerSpots = _vehicle emptyPositions "gunner";
	if (_gunnerSpots>0) then 
	{
		_vehicle allowCrewInImmobile true; 
	};
	
	//[_vehicle, _static, _missionIndex] spawn ZEVMissionVehicleFindGunner;
	
	if(_vehicleLocked == "Yes") then
	{
		_vehicle addEventHandler ["GetIn",{
			if (isPlayer (_this select 2)) then {
				(_this select 2) action ["getOut",(_this select 0)]; 
				0 = [nil,(_this select 2),"loc",rTITLETEXT,"Players are not permitted to enter AI vehicles!","PLAIN DOWN",5] call RE;
				/*(_this select 0) setVehicleLock "LOCKED";*/
			};
		}];
	};
	
	_vehicle setDamage _damageMin;
	_vehicle setFuel _fuelMin;
	
_vehicle	
