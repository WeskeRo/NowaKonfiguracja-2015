private ["_startTime","_ret","_cnt","_playerInRange","_missionObject","_missionTimeLimit","_index","_static","_endCondition","_locationPos","_triggerRadius","_playerInTrigger","_currentTime","_missionDone"];
_missionObject 		= _this;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort CheckEndCondition" call ZEVLog;
	ZEV_MISSION_DONE
};

_startTime 			= _missionObject getVariable ZEVStartTime;
_missionTimeLimit	= _missionObject getVariable ZEVTimeout;
_index				= _missionObject getVariable ZEVIndex;
_static				= _missionObject getVariable ZEVStatic;
_endCondition		= _missionObject getVariable ZEVEndCondition;
_locationPos 		= _missionObject getVariable ZEVLocationPos;
_triggerRadius 		= _missionObject getVariable ZEVTriggerRadius;
_playerInTrigger	= false;
_ret				= ZEV_WAIT;
_currentTime 		= floor(time);

_playerInTrigger = [_locationPos, _triggerRadius] call ZEVIsPlayerInRange;
if (_playerInTrigger) then
{
	_startTime = floor(time);
	_missionObject setVariable [ZEVStartTime, _startTime];
};
if (_currenttime - _startTime > _missionTimeLimit) then 
{
	_ret = ZEV_TIMEOUT;
}
else
{
	format["endCondition = %1", _endCondition] call ZEVLog;
	switch (_endCondition) do
	{
		case ZEV_ALL_AI_DEAD: 
		{
			_cnt = _missionObject call ZEVAliveUnitCount;
			if( _cnt == 0) then
			{
				_ret = ZEV_ALL_AI_DEAD;
			};
		};
		case ZEV_PLAYER_IN_CENTER: 
		{
			_playerInRange	= [_locationPos, 30] call ZEVIsPlayerInRange;
			if (_playerInRange) then 
			{
				_ret = ZEV_PLAYER_IN_CENTER;
			};
		};
    	case ZEV_CAPTURE_VEHICLE: 
		{
			_ret = ZEV_WAIT;
		};
	};
};
_missionDone = _missionObject getVariable [ZEVMissionDone, false];
if (_missionDone) then
{
	_ret = ZEV_MISSION_DONE;
};
_ret