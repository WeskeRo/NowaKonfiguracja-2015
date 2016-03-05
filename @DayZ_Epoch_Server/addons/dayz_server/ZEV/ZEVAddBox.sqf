private ["_lockTilFinish","_missionIndex","_vehicleName","_vehiclePosType","_vehiclePos","_vehicleAzimut","_vehicle","_locationRadius","_locationPos","_vehicleList","_static","_absolutePos","_missionObject","_vehicleParms","_vehicleChilds","_parms","_nameType","_CompleteIfCaptured","_randomList","_globalRandomList","_boxData"];
_missionObject 		= _this select 0;
if ((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort BOX creation" call ZEVLog;
};
_boxData			= _this select 1;
_vehicleParms		= _boxData select 1;
_vehicleChilds		= _boxData select 2;
_missionIndex 		= _missionObject getVariable ZEVIndex;
_static				= _missionObject getVariable ZEVStatic;
format ["AddBox: _missionIndex=%1, _static=%2",_missionIndex,_static] call ZEVLog;
_absolutePos = [];
if (count _this == 3) then {_absolutePos 	= _this select 2;};
_locationPos		= _missionObject getVariable ZEVLocationPos;
_locationRadius		= _missionObject getVariable ZEVSpawnRadius;
_parms = [_vehicleParms, [ZEVNameType,ZEVBoxName,ZEVPositionType,ZEVAzimut,ZEVCompleteIfCaptured]] call ZEVGetProperty;
_nameType			= _parms select 0;
_vehicleName		= _parms select 1;
_vehiclePosType		= _parms select 2;
_vehicleAzimut		= _parms select 3;
_CompleteIfCaptured = _parms select 4;
_vehiclePos			= [_vehicleParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
_randomList = [_vehicleParms, ZEVBoxName] call ZEVGetPropertyRandomList;
_globalRandomList = ZEVBoxName call ZEVGetGlobalRandomList;
_vehicleName = [_nameType, _vehicleName, _randomList, _globalRandomList] call ZEVSelect;
if (count _absolutePos > 0) then 
{
	_vehiclePos = _absolutePos;
}
else
{
	_vehiclePos = [_vehiclePos, _vehiclePosType, _locationPos, _locationRadius] call ZEVSelectPos;
};
if ( _vehiclePosType == ZEVRandom ) then { _vehicleAzimut	= round(random(360));};
_vehicle = createVehicle [_vehicleName, _vehiclePos, [], 0, "CAN_COLLIDE"];
_vehicle setPos _vehiclePos;
_vehicle setVectorUp surfaceNormal position _vehicle;	
_vehicle setDir _vehicleAzimut;
_vehicle setVariable ["permaLoot",true];
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
_vehicle setDamage 0;
if (_CompleteIfCaptured == ZEVYES) then { _vehicle call ZEVAddCaptureTrigger;};
_vehicle call ZEVAddCaptureHandler;
_vehicle	
