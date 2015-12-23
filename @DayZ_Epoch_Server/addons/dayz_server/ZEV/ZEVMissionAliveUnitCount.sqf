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
private["_missionIndex","_unitMissionIndex","_ret","_static","_unitMissionStatic","_aiCnt","_ai","_list","_counterName","_unitList","_groupCnt"];

_missionIndex 	= _this select 0;
_static			= _this select 1;

_ret			= 0;
_get_count = 
{
	private ["_r","_idx","_s","_l"];
	_l 		= _this select 0;
	_idx	= _this select 1;
	_s		= _this select 2;
	_r = {((_x getVariable ["ZEVMissionIndex", -1] == _idx)&&(_x getVariable ["ZEVMissionStatic", -1] == _s))} count _l;
	_r
};
_groupCnt = 0;
{
	_unitList = units _x;
	_groupCnt = [_unitList, _missionIndex, _static] call _get_count;
	if (ZEVMissionDebug > 0 ) then { diag_log format["ZEV COUNT group = %1 _groupCnt = %2",_x, _groupCnt];};
	_ret = _ret + _groupCnt;
} foreach allGroups;
_ret
