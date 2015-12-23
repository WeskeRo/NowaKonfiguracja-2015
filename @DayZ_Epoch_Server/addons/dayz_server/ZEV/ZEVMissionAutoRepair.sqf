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
private ["_vehicle","_driver","_weapons","_muzzles","_mag","_damage","_d","_hp"];

_vehicle	= _this select 0;
_driver		= _this select 1;
ZEVMissionDebug = 0;
while { (alive _driver) } do 
{
	sleep 10;
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionAutoRepair: damage _vehicle = %1", damage _vehicle]; };
	
	if ( !canMove _vehicle) then
	{
		_vehicle forceSpeed 0;
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionAutoRepair: weapons _driver = %1", weapons _driver]; };
		sleep 2;
		_driver action ["Eject", _vehicle];
		_driver doWatch (position _vehicle);
		sleep 0.1;
		_driver playActionNow "Medic";
		sleep 10;
		_driver playActionNow "Medic";
		sleep 5;
		_vehicle setDamage 0;
		
		_driver switchMove "";
		_driver playActionNow "stop";
	
		_driver assignAsDriver 	_vehicle;
		_driver moveInDriver 	_vehicle;
		//_driver action ["GetIn", _vehicle];
		_vehicle forceSpeed -1;
	};
};


