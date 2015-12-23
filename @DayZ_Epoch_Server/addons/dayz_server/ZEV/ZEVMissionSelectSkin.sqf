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
private ["_aiName","_missionIndex", "_randomList","_aiSide","_static"];

_missionIndex	= _this select 0;
_aiName 		= _this select 1;
_aiSide 		= _this select 2;
_static			= _this select 3;
_skinRandomList = _this select 4;

_randomList		= [];
if(_aiName == "RandomList") then
{
	if( count _skinRandomList > 0) then
	{
		_randomList = _skinRandomList;
	};

	if( count _randomList > 0) then
	{
		_aiName = _randomList call BIS_fnc_selectRandom;
	}
	else
	{
		_aiName = "Random";
	};
	
};
if(_aiName == "Random") then
{
	
	if(_aiside == "EAST") then
	{
		_aiName = ZEVEASTSkinList call BIS_fnc_selectRandom;
	};
	if(_aiside == "CIVILIAN") then
	{
		_aiName = ZEVCivilianSkinList select _missionIndex;
	};
	if(_aiside == "RESISTANCE") then
	{
		_aiName = ZEVResistanceSkinList select _missionIndex;
	};
};
_ainame
