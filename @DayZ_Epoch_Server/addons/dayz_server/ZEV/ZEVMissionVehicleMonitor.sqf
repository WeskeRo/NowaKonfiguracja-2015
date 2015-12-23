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
private ["_veh"];
_veh = _this select 0;

waitUntil { count crew _veh > 0};
while {(alive _veh) and ({alive _x} count crew _veh > 0)} do 
{
	_veh setVehicleAmmo 1;
	_veh setFuel 1;
	if ({alive _x} count crew _veh == 0) then 
	{
		_veh setDamage 1;
		_veh setVariable ["killedat", time];
	};
	sleep 30;
};
sleep 1800;
_veh setDamage 1;
_veh setVariable ["killedat", time];