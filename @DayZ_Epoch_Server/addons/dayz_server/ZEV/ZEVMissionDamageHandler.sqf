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
private ["_unit","_hit","_damage","_source","_ammo", "_armor"];
_unit 	= _this select 0;
_hit 	= _this select 1;
_damage = _this select 2;
_source = _this select 3;
_ammo 	= _this select 4;
_armor 	= _unit getVariable["ZEVMissionUnitArmor", 1];

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - DamageHandler pre:  %1, %2, %3, %4, %5", _unit, _hit, _damage, _source, _ammo]; };

if(_armor != 1) then
{
	if(_armor !=0) then
	{
		_damage = _damage / _armor;
	};
};
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - DamageHandler post:  %1, %2, %3, %4, %5", _unit, _hit, _damage, _source, _ammo]; };
_damage
