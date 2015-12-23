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
private ["_value","_missionIndex","_valueRandomList","_valueRandomGlobalList"];

_missionIndex			= _this select 0;
_value 					= _this select 1;
_valueRandomList		= _this select 2;
_valueRandomGlobalList 	= _this select 3;

if(_value == "RandomList") then
{
	if(count _valueRandomList > 0) then
	{
		_value = _valueRandomList call BIS_fnc_selectRandom;
	}
	else
	{
		_value = "Random";
	};
};
if(_value == "Random") then
{
	_value = _valueRandomGlobalList call BIS_fnc_selectRandom;
};
_value
