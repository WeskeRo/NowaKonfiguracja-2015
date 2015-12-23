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
private ["_ai","_delay","_smokeShellName","_primWep","_dist"];

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  start ", 0]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  _this = %1", _this]; };
_ai		= _this select 0;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  _ai = %1", _ai]; };

while {alive _ai} do
{
	_delay = ZEVMissionThrowSmokeShellRate/2 + random(ZEVMissionThrowSmokeShellRate);
	sleep _delay;
	
	if ({isPlayer _x && ((_x distance _ai) > ZEVMissionThrowSmokeMinDistance) && ((_x distance _ai) < ZEVMissionThrowSmokeMaxDistance)} count allUnits > 0) then
	{
		_smokeShellName = "";
		_smokeShellName = ["","Red","Green","Blue","Yellow","Purple","Orange"] call BIS_fnc_selectRandom;
		_smokeShellName = "SmokeShell" + _smokeShellName;
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  _smokeShellName = %1", _smokeShellName]; };
		_ai addMagazine _smokeShellName;
		_primWep = primaryWeapon _ai;
		_ai selectWeapon "SmokeShellMuzzle";
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  fire = %1", _smokeShellName]; };
		_ai fire "SmokeShellMuzzle";
		_ai selectWeapon _primWep;
	};
};
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ThrowSmokeShell:  end", 0]; };