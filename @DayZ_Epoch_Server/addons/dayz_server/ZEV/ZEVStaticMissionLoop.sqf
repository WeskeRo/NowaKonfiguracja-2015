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
//мониторинг количества миссий запущенныхх и запуск если нужно
if(!isServer) exitWith {};

private ["_missionRunning","_mission2Run","_missionParms","_missionCountAtSameTime",
"_missionRunStatus","_lastFinishTime","_curTime", "_static", "_ZEVMissionInProgress","_ZEVMissionCount"];

_static = _this select 0;

_missionCountAtSameTime = ZEVMissionAtSameTime;
if(_static == 1) then
{
	_missionCountAtSameTime = [_static] call ZEVMissionGetMissionCount;
};

_ZEVMissionCount = [_static] call ZEVMissionGetMissionCount;

//if (ZEVMissionCount < 1) exitWith {};

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %1): starting script", _static]};

if (_ZEVMissionCount == 0) exitWith {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %1): no missions", _static];};

while {true} do
{
	_missionRunning = 0;
	_ZEVMissionInProgress = [];
	_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
	{
		_missionRunning = _missionRunning + _x;
		
	} foreach _ZEVMissionInProgress;
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %2): running missions count = %1 ", _missionRunning, _static]; };
	
	if(_missionRunning < _missionCountAtSameTime) then // если запущено миссий мало
	{
		_ZEVMissionCount = [_static] call ZEVMissionGetMissionCount;
		
		for "_i" from 0 to _ZEVMissionCount - 1 do 
		{
			_mission2Run = _i;
			
			if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %2): try to start mission %1 ", _mission2Run, _static]; };

			_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
			
			_missionRunStatus =  _ZEVMissionInProgress select _mission2Run;
			
			_lastFinishTime	  = [_mission2Run, _static] call ZEVMissionGetMissionLastFinishTime;
			
			_curTime	      = time;
			
			if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVStaticMissionLoop: mission=%1, lastFinishTime=%2, curtime = %3", _mission2Run, _lastFinishTime, _curTime]; };

			if(_curTime - _lastFinishTime < ZEVMissionCooldownTime) then
			{
				_missionRunStatus = 1;
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop: mission %1 still cooling down %2 from %3 (%4% done)", _mission2Run, _curTime - _lastFinishTime, ZEVMissionCooldownTime,(_curTime - _lastFinishTime)/ZEVMissionCooldownTime * 100]; };
			};
			
			if(_missionRunStatus == 0) then
			{
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %2): mission %1 was selected ", _mission2Run, _static]; };
				
				_missionParms = [_mission2Run, _static] call ZEVMissionGetMissionParms; 
				
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVStaticMissionLoop: selected mission parms: %1 ", _missionParms]; };

				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVStaticMissionLoop: starting mission constructor - ZEVMissionStart %1 ", "_"]; };
				
				_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
				
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - ZEVStaticMissionLoop: ZEVMissionInProgress =  %1", _ZEVMissionInProgress]; };
				
				[_mission2Run, _missionParms, _static] spawn ZEVMissionStart;
			};
			sleep 5;
		};
	};

	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVStaticMissionLoop(Static = %2): waiting %1 sec for new mission start", ZEVMissionInterval, _static]; };
	
	sleep ZEVMissionInterval;
};