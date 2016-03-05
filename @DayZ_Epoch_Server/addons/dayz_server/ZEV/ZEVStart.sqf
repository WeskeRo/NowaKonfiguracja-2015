private ["_index","_missionParms","_missionCountInRadius","_locationData","_triggerRadius","_locationRadius","_locPos","_static","_positions","_posArray","_missionProps","_missionChilds","_mObj","_positionNode","_positionParms","_position","_locationParms","_locChild","_parms","_checkResult","_positionType"];
_index					= _this select 0;
_missionParms			= _this select 1;
_static					= _this select 2;
format["ZEVStart: starting mission № %1, _this = %2", _index, _this] call ZEVLog;
format["ZEVStart: starting mission № %1, name=%2", _index, _missionParms select 0] call ZEVLog;
_missionProps			= _missionParms select 1;
_missionChilds			= _missionParms select 2;
_locationData 			= _missionChilds select 0; 
_locationParms			= _locationData select 1;
_locChild				= _locationData select 2;
format["Location data = %1", _locationData] call ZEVLog;
_locPos 				= [_locationParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
_parms					= [_locationParms, [ZEVPositionType,ZEVTriggerRadius,ZEVSpawnRadius]] call ZEVGetProperty;
_positionType			= _parms select 0;
_triggerRadius 			= _parms select 1;
_locationRadius			= _parms select 2;
_positions	= _locChild select 0;
if (_positionType == ZEVRandom) then
{
	_posArray 	= _positions select 2;
	
	if ( typeName _posArray == "ARRAY" && count _posArray > 0 && typeName (_posArray select 0) == "ARRAY") then
	{
		_positionNode	= _posArray call BIS_fnc_selectRandom; 
		_positionParms	= _positionNode select 1;
		_position 		= [_positionParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
		_position 		= [_position, ZEVSpecified, _locPos, _locationRadius] call ZEVSelectPos;
		_locPos 	= _position;
	}
	else
	{
		waitUntil 
		{ 
			private "_condition";
			sleep ZEVSleepSmall;
			_locPos = [getMarkerPos "center",0,7000,10,0,2000,0] call BIS_fnc_findSafePos; 
			_condition = (!(surfaceIsWater _locPos));
			_condition
		};
	};
};

_missionCountInRadius = 0;
_missionCountInRadius = [_locPos, _triggerRadius, _static] call ZEVFindRunningMissionInRadius;

if (_missionCountInRadius > 0) exitWith 
{
	format ["ZEVStart: no space to spawn mission № %1", _index] call ZEVLog;
};


_mObj = createTrigger ["EmptyDetector", _locPos];
_mObj call ZEVAddToObjectMonitor;
_mObj setVariable [ZEVTriggerRadius, _triggerRadius];
_mObj setVariable [ZEVSpawnRadius, _locationRadius];
_mObj setVariable [ZEVIndex, _index];
ZEVMissionObject set [_index, _mObj];
[_mObj, _missionProps] call ZEVLoadProperty;
_mObj setVariable [ZEVLocationPos,  _locPos, true];
_mObj setVariable [ZEVStatic,  _static, true];
_mObj setVariable ["BoxesData", _locChild select 1, true];
_mObj setVariable ["BuildingData", _locChild select 2, true];
_mObj setVariable ["VehicleData", _locChild select 3, true];
_mObj setVariable ["GroupData", _locChild select 4, true];
_mObj setVariable [ZEVGroupList, [], true];
_mObj spawn 
{
	private "_id";
	_id = _this getVariable ZEVIndex;
	format ["MISSION TRIGGER CREATED for mission %1", _id] call ZEVLog;
	while {!isNil "_this" && !isNull _this} do
	{
		format ["MISSION TRIGGER is alive for mission %1", _id] call ZEVLog;
		sleep ZEVSleep1;
	};
	format ["MISSION TRIGGER is NULL for mission %1", _id] call ZEVLog;
};

_parms = [_locPos, 
		  _locationRadius, 
		  _triggerRadius, 
		  _mObj getVariable ZEVEndCondition];
		  
[_index, _static, _parms] call ZEVSetActiveMissionParms;
[_index, _static, 1] call ZEVSetMissionInProgress;

_parms = [_missionProps, [ZEVShowMarker,ZEVName,ZEVMarkerRadius,ZEVMarkerColor,ZEVMarkerShape,ZEVStartMessage,ZEVFailMessage]] call ZEVGetProperty;

if((_parms select 0) == ZEVYES) then
{
	[_index, _static, 1] call ZEVSetMarkerStatus;
	
	_mObj spawn ZEVAddMarker;
};
(_parms select 5) call ZEVShowMessage;
format["ZEVStart:  Waiting for player in %1m range from %2", _triggerRadius, _locPos] call ZEVLog; 
_mObj setVariable ["ZEVStartTime", floor(time)];
_checkResult = ZEV_WAIT;
while {_checkResult == ZEV_WAIT} do
{
	_checkResult = _mObj call ZEVCheckStartCondition;
	format ['ZEVCheckStartCondition=%1',_checkResult] call ZEVLog;
	sleep 5;
};
format["ZEVStart: start condition check result: %1", _checkResult] call ZEVLog;
if (_checkResult != ZEV_TIMEOUT) then
{
	_mObj spawn ZEVMonitor;
}
else
{
	deleteVehicle _mObj;
	(_parms select 6) call ZEVShowMessage;
	[_index, _static ,0] call ZEVSetMissionInProgress;
	[_index, _static ,0] call ZEVSetMarkerStatus;
};

