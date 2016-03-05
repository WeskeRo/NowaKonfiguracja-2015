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
private ["_nameType","_skinName","_randomList","_side"];

_nameType 		= _this select 0;
_skinName		= _this select 1;
_side 			= _this select 2;
_randomList 	= _this select 3;

if (_nameType == ZEVRandomList) then
{
	if ( count _randomList > 0) then
	{
		_skinName = _randomList call BIS_fnc_selectRandom;
	}
	else
	{
		_nameType = ZEVRandom;
	};
	
};
if (_nameType == ZEVRandom) then
{
	switch (_side) do {
		case "EAST":		{ _skinName = ZEVEASTSkinList call BIS_fnc_selectRandom;};
		case "CIVILIAN": 	{ _skinName = ZEVCivilianSkinList call BIS_fnc_selectRandom;};
		case "RESISTANCE":	{ _skinName = ZEVResistanceSkinList call BIS_fnc_selectRandom;};
	};
};
_skinName
