private ["_idx","_remainToStart","_mission2Run","_missionParms","_missionCountAtSameTime","_lastFinishTime","_curTime","_ZEVMissionInProgress","_ZEVMissionCount","_startedMissionCount"];

if (!isServer) exitWith {};
if (ZEVMissionCount < 1) exitWith { "No missions" call ZEVLog;};


_missionCountAtSameTime = ZEVMissionAtSameTime;
_ZEVMissionCount 		= ZEVMissionCount;
if (_ZEVMissionCount == 0) exitWith { "ZEVMission - ZEVLoop no regular missions" call ZEVLog;};

while {true} do
{
	_startedMissionCount = 0;
	_ZEVMissionInProgress = [];
	_ZEVMissionInProgress = [0] call ZEVGetMissionInProgress; 
	
	_startedMissionCount = { _x > 0 } count _ZEVMissionInProgress;
	
	if (_startedMissionCount < _missionCountAtSameTime ) then 
	{
		_remainToStart = [];
		_idx = 0;
		{
			_lastFinishTime	  = [_idx, 0] call ZEVGetMissionLastFinishTime;
			_curTime = time;
			if ((_x == 0) && ( (_curTime - _lastFinishTime) > ZEVMissionCooldownTime) ) then
			{
				_remainToStart set [count _remainToStart, _idx];
			};
			_idx = _idx + 1;
		} foreach _ZEVMissionInProgress;
		
		if ( count _remainToStart > 0) then 
		{
			_mission2Run = _remainToStart call BIS_fnc_selectRandom;

			format ["ZEVLoop - mission %1 was selected ", _mission2Run] call ZEVLog;
			
			_missionParms = [_mission2Run, 0] call ZEVGetMissionParms; 
			
			_ZEVMissionInProgress = [0] call ZEVGetMissionInProgress; 
			
			[_mission2Run, _missionParms, 0] spawn ZEVStart;
		};
	};
	
	sleep ZEVMissionInterval;
};