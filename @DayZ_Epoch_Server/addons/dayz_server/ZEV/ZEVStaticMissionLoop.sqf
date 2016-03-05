//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://DayZMissionEditor.ru/
//  YouTube : http://www.youtube.com/channel/UCWuzUxNJ_Ctf9ynoJqiV2ww
//
//-----------------------------------------------------------//
//мониторинг количества миссий запущенныхх и запуск если нужно
if(!isServer) exitWith {};
private ["_missionRunning","_mission2Run","_missionParms","_missionCountAtSameTime",
"_missionRunStatus","_lastFinishTime","_curTime", "_static", "_ZEVMissionInProgress","_ZEVMissionCount"];

_static = _this select 0;

_missionCountAtSameTime = ZEVMissionAtSameTime;


if(_static == 1) then
{
	_missionCountAtSameTime = [_static] call ZEVGetMissionCount;
};

_ZEVMissionCount = [_static] call ZEVGetMissionCount;

while {true} do
{
	_missionRunning = 0;
	_ZEVMissionInProgress = [];
	_ZEVMissionInProgress = [_static] call ZEVGetMissionInProgress;
	
	_missionRunning = { _x > 0 } count _ZEVMissionInProgress;
	
	if(_missionRunning < _missionCountAtSameTime) then // если запущено миссий мало
	{
		_ZEVMissionCount = [_static] call ZEVGetMissionCount;
		
		for "_i" from 0 to _ZEVMissionCount - 1 do 
		{
			_mission2Run = _i;
			
			_ZEVMissionInProgress = [_static] call ZEVGetMissionInProgress; 
			
			_missionRunStatus =  _ZEVMissionInProgress select _mission2Run;
			
			_lastFinishTime	  = [_mission2Run, _static] call ZEVGetMissionLastFinishTime;
			
			_curTime	      = time;
			
			if(_curTime - _lastFinishTime < ZEVMissionCooldownTime) then
			{
				_missionRunStatus = 1;
			};
			
			if(_missionRunStatus == 0) then
			{
				_missionParms = [_mission2Run, _static] call ZEVGetMissionParms; 
				
				_ZEVMissionInProgress = [_static] call ZEVGetMissionInProgress; 
				
				[_mission2Run, _missionParms, _static] spawn ZEVStart;
			};
			sleep 5;
		};
	};

	sleep ZEVMissionInterval;
};