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
private ["_needRepair","_vehicle","_driver","_weapons","_muzzles","_mag","_damage","_d"];

_vehicle	= _this;
_driver		= driver _vehicle;
while { (!isNull _driver) &&(alive _driver) &&(!isNull _vehicle) } do 
{
	sleep 10;
	
	format["ZEVAutoRepair: damage _vehicle = %1", damage _vehicle] call ZEVLog;
	_needRepair = false;
	_needRepair = _vehicle getVariable [ZEVNeedRepair, false];
	if ( _needRepair ) then
	{
		_vehicle forceSpeed 0;
		format["ZEVAutoRepair: weapons _driver = %1", weapons _driver] call ZEVLog;
		sleep 2;
		_driver action ["Eject", _vehicle];
		_driver doWatch (position _vehicle);
		sleep 0.3;
		_driver playActionNow "Medic";
		sleep 10;
		_driver playActionNow "Medic";
		
		_vehicle setDamage 0;
		
		_driver switchMove "";
		_driver playActionNow "stop";
	
		_driver assignAsDriver 	_vehicle;
		_driver moveInDriver 	_vehicle;
		//_driver action ["GetIn", _vehicle];
		_vehicle forceSpeed -1;
		_vehicle setVariable [ZEVNeedRepair, false, true];		
	};
};


