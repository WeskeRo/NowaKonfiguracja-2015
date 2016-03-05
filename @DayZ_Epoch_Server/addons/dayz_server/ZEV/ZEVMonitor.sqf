private ["_locked", "_vehicleList","_handle","_index","_missionName","_missionEndMessage","_missionFailMessage","_locationPos","_static","_mObj","_checkResult"];
_mObj				= _this;
_index				= _mObj getVariable ZEVIndex;
_missionName		= _mObj getVariable ZEVName;
_missionEndMessage  = _mObj getVariable ZEVEndMessage;
_missionFailMessage = _mObj getVariable ZEVFailMessage;
_locationPos		= _mObj getVariable ZEVLocationPos;
_static				= _mObj getVariable ZEVStatic;

format["ZEVMonitor (Static = %2):  somebody in trigger zone, start spawn at %1", _locationPos, _static] call ZEVLog;

_mObj call ZEVSpawnMission;
sleep 10;
_checkResult = ZEV_WAIT;
waitUntil
{
	sleep ZEVMissionConditionCheckTime;
	format ["ZEVMonitor  mission %1, end condition check result:%2", _missionName, _checkResult] call ZEVLog;
	_checkResult = _mObj call ZEVCheckEndCondition;
	(_checkResult != ZEV_WAIT)
};

_mObj setVariable [ZEVMissionEndReason, _checkResult];

format ["ZEVMonitor(Static = %2):  mission %1, end condition check result:%3", _missionName, _static, _checkResult] call ZEVLog;

[_index, _static, 0] call ZEVSetMarkerStatus;

if (_checkResult == ZEV_TIMEOUT)	then
{
	_missionFailMessage call ZEVShowMessage;
}
else
{
	_missionEndMessage  call ZEVShowMessage;
	
};

//unlock vehicles
if (_checkResult != ZEV_TIMEOUT) then
{
	_vehicleList = [_index, _static] call ZEVGetVehicleList;
	{
		if (!isNull _x) then
		{
			_locked = _x getVariable [ZEVLockTilFinish, "NO"];
			if (_locked == ZEVYES) then
			{
				[_x, false] call ZEVLockVehicle;
			};
		};
	} foreach _vehicleList;
};

if (_checkResult != ZEV_TIMEOUT)	then
{
	sleep ZEVMissionFinishedMissionCleanupDelay;
};
format ["ZEVMonitor despawn mission:%1", _index] call ZEVLog;
_mObj call ZEVDespawnMission;

[_index, _static, []] call ZEVSetVehicleList;

//sleep ZEVMissionPostDelay;

[_index, _static, 0]    call ZEVSetMissionInProgress;

if (_static == 0) then
{
	[_index, _static, time] call ZEVSetMissionLastFinishTime;
};
if (_static == 1) then
{
	if (_checkResult == ZEV_TIMEOUT) then
	{
		[_index, _static, time - ZEVMissionCooldownTime] call ZEVSetMissionLastFinishTime;
	}
	else
	{
		[_index, _static, time] call ZEVSetMissionLastFinishTime;
	};
};

format["ZEV# ZEVMonitor: (Static = %2): Mission  %1 finished",_missionName, _static] call ZEVLog;

