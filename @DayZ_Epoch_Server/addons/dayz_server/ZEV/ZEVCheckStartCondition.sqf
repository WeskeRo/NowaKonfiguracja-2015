private ["_ret","_cnt","_missionObject","_startCondition","_starttime","_missionTimeLimit","_locationPos","_triggerRadius","_currentTime"];
_missionObject 		= _this;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort checkStartCondition" call ZEVLog;
	ZEV_TIMEOUT
};
_startCondition		= _missionObject getVariable ZEVStartCondition;
_starttime 			= _missionObject getVariable ZEVStartTime;
_missionTimeLimit 	= _missionObject getVariable ZEVTimeout;
_locationPos		= _missionObject getVariable ZEVLocationPos;
_triggerRadius		= _missionObject getVariable ZEVTriggerRadius;
_currentTime 		= floor(time);
_ret				= ZEV_WAIT;
if (_currenttime - _startTime >= _missionTimeLimit) then 
{
	_ret = ZEV_TIMEOUT;
}
else
{
	switch (_startCondition) do
	{
		case ZEV_PLAYER_IN_TRIGGER:
		{
			_cnt = { (isPlayer _x) && (_x distance _locationPos <= _triggerRadius) } count playableUnits;
			if (_cnt > 0) then 
			{
				_ret = ZEV_PLAYER;
			};
		};
		case ZEV_START_WHEN_SPAWN:
		{
			_ret = ZEV_START;
		};
	};
};
_ret