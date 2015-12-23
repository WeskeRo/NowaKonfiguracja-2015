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
private ["_ai","_ai_type","_aikiller","_aikiller_name","_humanityBoost","_humanity","_killsB",
"_weaponSec","_clearBody","_deleteLaunchers","_magsName","_magazine","_deleteNVGoogle","_veh"];
_ai = _this select 0;
_ai_type = typeof _ai;

_aikiller = _this select 1;
_aikiller_name = name _aikiller;

_humanityBoost = _ai getVariable ["ZEVMissionHumanityGain", ZEVMissionHumanityGain];
if(isNil "_humanityBoost") then
{
	_humanityBoost = 0;
};
_humanity = _aikiller getVariable ["humanity",0];
if(isNil "_humanity") then
{
	_humanity = 0;
};
_humanity = _humanity + _humanityBoost;
_aikiller setVariable["humanity", _humanity,true];

_killsB = _aikiller getVariable["banditKills",0];
_killsB = _killsB + 1;
_aikiller setVariable["banditKills",_killsB,true];

if(ZEVMissionDebug > 1) then { diag_log format ["ZEVMission: AI %1 was killed by %2 (+%3 humanity, new total %4)",_ai_type,_aikiller_name,_humanityBoost,_humanity]; };

_deleteLaunchers = _ai getVariable ["ZEVMissionDeleteLaunchers", "Yes"];
if(_deleteLaunchers == "Yes") then
{
	_weaponSec = _ai getVariable ["ZEVWeaponSec", "NONE"];
	if(_weaponSec != "NONE") then
	{
		_ai removeWeapon _weaponSec;
		_magsName = getArray (configFile >> "cfgWeapons" >> _weaponSec >> "magazines");
		_magazine = _magsName select 0;
		if (((magazines _ai) find _magazine) >= 0) then
		{
			_ai removeMagazines _magazine;
		};
	};
};
_clearBody 		= _ai getVariable ["ZEVMissionClearBody", "No"];
_deleteNVGoogle = _ai getVariable ["ZEVMissionDeleteNVGoogle", "No"];

if(_clearBody == "Yes") then
{
	{_ai removeMagazine _x;} forEach (magazines _ai);
	{_ai removeWeapon _x;} forEach (weapons _ai);
};

if(_deleteNVGoogle == "Yes") then
{
	_ai removeWeapon "NVGoggles";
};


{
	if (((position _x) distance (position _ai)) <= 150) then 
	{
		_x reveal [_aikiller, 4.0];
	};
} forEach allUnits;
	
sleep ZEVMissionCorpseCleanupTime;

deletevehicle _ai;

