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
private["_pos","_playerInRange","_range"];

_pos 	= _this select 0;
_range 	= _this select 1;
_playerInRange = false;

{

	if((isPlayer _x) AND (_x distance _pos <= _range)) then 
	{
		_playerInRange = true
	};
}forEach playableUnits;
_playerInRange
