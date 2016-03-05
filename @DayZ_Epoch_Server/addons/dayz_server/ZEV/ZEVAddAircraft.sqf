private ["_missionIndex","_vehicleName","_vehiclePosType","_vehiclePos","_vehicleAzimut","_vehicle","_vehicleLocked","_locationRadius","_locationPos","_vehiclePermanent","_vehicleData","_vehicleList","_gunnerSpots","_static","_damageMin","_damageMax","_fuelMin","_fuelMax","_special","_missionObject","_vehicleParms","_vehicleChilds","_parms","_nameType","_CompleteIfCaptured","_randomList","_globalRandomList"];
_missionObject 		= _this select 0;
if ((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort vehicle creation" call ZEVLog;
};
_vehicleData		= _this select 1;
_vehicleParms		= _vehicleData select 1;
_vehicleChilds		= _vehicleData select 2;
_missionIndex 		= _missionObject getVariable ZEVIndex;
_static				= _missionObject getVariable ZEVStatic;
if (count _this == 3) then [{_special 	= _this select 2;},{_special		= "CAN_COLLIDE";}];
_locationPos		= _missionObject getVariable ZEVLocationPos;
_locationRadius		= _missionObject getVariable ZEVSpawnRadius;
_parms = [_vehicleParms, [ZEVNameType,ZEVAircraftName,ZEVPositionType,ZEVAzimut,ZEVLocked,ZEVPermanent,ZEVDamageMin,ZEVDamageMax,ZEVFuelMin,ZEVFuelMax,ZEVCompleteIfCaptured]] call ZEVGetProperty;
(str _parms) call ZEVLog;
_nameType			= _parms select 0;
_vehicleName		= _parms select 1;
_vehiclePosType		= _parms select 2;
_vehicleAzimut		= _parms select 3;
_vehicleLocked		= _parms select 4;
_vehiclePermanent	= _parms select 5;
_damageMin			= _parms select 6;
_damageMax			= _parms select 7;
_fuelMin			= _parms select 8;
_fuelMax			= _parms select 9;
_CompleteIfCaptured = _parms select 10;
_vehiclePos			= [_vehicleParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
if (_damageMin < 20) 			then { _damageMin = 20;};
if (_damageMax > 80) 			then { _damageMax = 80;};
if (_damageMin > _damageMax)	then { _damageMin = _damageMax;};
if (_fuelMin < 0) 				then { _fuelMin = 0;};
if (_fuelMax > 100) 			then { _fuelMax = 100;};
if (_fuelMin > _fuelMax) 		then {_fuelMin = _fuelMax;};
_damageMin 	= (_damageMin + random(_damageMax - _damageMin))/100;
_fuelMin	= (_fuelMin + random(_fuelMax - _fuelMin))/100;
_parms = [_vehicleParms, [ZEVAircraftName]] call ZEVGetProperty;
_vehicleName = _parms select 0;
_randomList = [_vehicleParms, ZEVAircraftName] call ZEVGetPropertyRandomList;
_globalRandomList = ZEVAircraftName call ZEVGetGlobalRandomList;
_vehicleName = [_nameType, _vehicleName, _randomList, _globalRandomList] call ZEVSelect;
//if (_absolutePos) then [{_vehiclePos = _vehiclePos;},{_vehiclePos = [_vehiclePos, _vehiclePosType, _locationPos, _locationRadius] call ZEVSelectPos;}];
_vehiclePos = [_vehiclePos, _vehiclePosType, _locationPos, _locationRadius] call ZEVSelectPos;
if (_vehiclePosType == ZEVRandom) then {	_vehicleAzimut	= round(random(360));};
if (_special == "FLY") then { _vehiclePos set [2, 500];};
_vehicle = createVehicle [_vehicleName, _vehiclePos, [], 0, _special];
_vehicle setPos _vehiclePos;
_vehicle setVectorUp surfaceNormal position _vehicle;	
_vehicle setDir _vehicleAzimut;
if (_vehicle isKindOf "ReammoBox") then {_vehicle setVariable ["permaLoot",true];};
_vehicle setVariable ["ZEVPermanent", _vehiclePermanent, true];
_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
_vehicleList set [count _vehicleList, _vehicle]; 
[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;
_vehicle setVariable [ZEVIndex, _missionIndex, true];
_vehicle setVariable [ZEVStatic, _static, true];
_vehicle setVariable [ZEVObject, _missionObject, true];
_vehicle call ZEVAddToObjectMonitor;
clearWeaponCargoGlobal 		_vehicle;
clearMagazineCargoGlobal 	_vehicle;
[_vehicle, _vehicleChilds select 0, ZEVPrimaryWeapon, true] call ZEVAddItemToObject;
[_vehicle, _vehicleChilds select 1, ZEVItemName, true] call ZEVAddItemToObject;
_gunnerSpots = _vehicle emptyPositions "gunner";
if (_gunnerSpots>0) then {_vehicle allowCrewInImmobile true; };
if (_vehicleLocked == ZEVYES) then {_vehicle call ZEVLockVehicle;};
_vehicle setDamage _damageMin;
_vehicle setFuel _fuelMin;
if (_CompleteIfCaptured == ZEVYES) then { _vehicle call ZEVAddCaptureTrigger;};
_vehicle call ZEVAddCaptureHandler;
_vehicle	
