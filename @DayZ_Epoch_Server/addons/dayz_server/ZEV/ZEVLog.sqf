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
private ["_level","_msg"];
_level = 1;
if (typeName _this == "ARRAY") then
{
	_msg 	= _this select 0;
	_level 	= _this select 1; 
}
else
{
	_msg = _this;
};
_msg = "ZEV# "+_msg;
if (ZEVMissionDebug >= _level) then { diag_log _msg; };