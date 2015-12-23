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
private ["_aiweapon","_randomList","_aimags","_missionIndex","_static","_aiWeaponRandomList"];

_missionIndex	= _this select 0;
_aiweapon		= _this select 1;
_aimags 		= _this select 2;
_static			= _this select 3;
_aiWeaponRandomList = _this select 4;
if(_aiweapon == "RandomList") then
{
	_randomList = _aiWeaponRandomList;
	if(count _randomList > 0) then
	{
		_aiweapon = _randomList call BIS_fnc_selectRandom;
	}
	else
	{
		_aiweapon = "Random";
	};
};


if(_aiweapon == "Random") then
{
	_aiweapon 	= ZEVGunList call BIS_fnc_selectRandom;
	_aimags		= round(random(3))+1;
};
[_aiweapon, _aimags]