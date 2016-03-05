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
private ["_value","_valueRandomList","_valueRandomGlobalList","_valueType"];

_valueType				= _this select 0;
_value 					= _this select 1;
_valueRandomList		= _this select 2;
_valueRandomGlobalList 	= _this select 3;

if (_valueType == ZEVRandomList) then
{
	if (count _valueRandomList > 0) then
	{
		_value = _valueRandomList call BIS_fnc_selectRandom;
	}
	else
	{
		_valueType = ZEVRandom;
	};
};
if (_valueType == ZEVRandom) then
{
	_value = _valueRandomGlobalList call BIS_fnc_selectRandom;
};
_value
