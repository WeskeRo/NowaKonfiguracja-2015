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
private ["_missionParms","_static","_idx"];

if(ZEVMissionDebug > 1) then { diag_log "ZEVMissionRunStatic: start"; };
_idx = 0;
{
	_missionParms 	= _x;
	_static 		= _missionParms select 8;
	if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission - mission idx = %1, static = %2: ", _idx, _static]; };
	if(_static == "Yes") then
	{
		ZEVMissionInProgress set [_idx, 1];
		if(ZEVMissionDebug > 1) then { diag_log format["ZEVMissionRunStatic: runing static mission idx = %1", _idx];};
		_nul = [_idx, _missionParms] execVM "\z\addons\dayz_server\ZEV\ZEVMissionStart.sqf";
		_missionCountAtSameTime = _missionCountAtSameTime + 1;
	};
	_idx = _idx + 1;
}foreach ZEVMissionList;
if(ZEVMissionDebug > 1) then { diag_log "ZEVMissionRunStatic: end"; };
