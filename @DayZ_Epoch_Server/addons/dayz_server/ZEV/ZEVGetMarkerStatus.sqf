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
private ["_static", "_ret", "_index"];

_index  = _this select 0;
_static = _this select 1;
_ret    = 0;
switch(_static) do
{
	case 0: {_ret = ZEVMissionMarkerStatus select _index};
	case 1: {_ret = ZEVStaticMissionMarkerStatus select _index};
};
_ret