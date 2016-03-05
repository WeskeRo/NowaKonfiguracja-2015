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
private ["_list","_missionIndex","_ret","_static","_unitList","_groupCnt","_get_count","_mObj"];

_mObj 			= _this; 
_missionIndex 	= _mObj getVariable ZEVIndex;
_static			= _mObj getVariable ZEVStatic;

_ret			= 0;
/*
_get_count = 
{
	private ["_r","_idx","_s","_l"];
	_l 		= _this select 0;
	_idx	= _this select 1;
	_s		= _this select 2;
	_r = {((_x getVariable [ZEVIndex, -1] == _idx)&&(_x getVariable [ZEVStatic, -1] == _s))} count _l;
	_r
};
_groupCnt = 0;
{
	_unitList = units _x;
	_groupCnt = [_unitList, _missionIndex, _static] call _get_count;
	format["COUNT group = %1 _groupCnt = %2",_x, _groupCnt] call ZEVLog;
	_ret = _ret + _groupCnt;
} foreach allGroups;

*/
_list	= [];
_list   = _mObj getVariable [ZEVAIList, []];
format ["AliveUnitCount _list = %1",_list] call ZEVLog;
_ret = {(!isNull _x) && (alive _x) && (_missionIndex == (_x getVariable [ZEVIndex, -1]))} count _list;
format["index = %1 COUNT = %2",_missionIndex, _ret] call ZEVLog;
_ret
