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
private ["_static", "_ret", "_index","_value"];

_index  = _this select 0;
_static = _this select 1;
_value  = _this select 2;

if (_static == 1) then
{
	ZEVStaticMissionLastFinishTime set [_index, _value];
};	
if (_static == 0) then
{
	ZEVMissionLastFinishTime set [_index, _value];
};	
