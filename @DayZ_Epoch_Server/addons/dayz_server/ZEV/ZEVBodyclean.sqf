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
private ["_ai","_ai_type","_aikiller","_aikiller_name","_humanityBoost","_humanity","_killsB","_weaponSec","_clearBody","_deleteLaunchers","_magsName","_magazine","_deleteNVGoogle","_missionIndex"];
format ["ZEVClearBody: _this = %1", _this] call ZEVLog;
_ai 			= _this select 0;
_aikiller 		= _this select 1;

if(isNil "_ai" || isNull _ai) exitWith {};

_ai_type 		= typeof _ai;
_missionIndex  	= _ai getVariable [ZEVIndex, -1];
_humanityBoost 	= _ai getVariable [ZEVHumanityGain, ZEVMissionHumanityGain];

format ["ZEVBodyClean _ai = %1", _ai] call ZEVLog;
_clearBody 		= _ai getVariable [ZEVClearBody, ZEVNO];
_deleteNVGoogle = _ai getVariable [ZEVDeleteNVGoogle, ZEVNO];

_deleteLaunchers = _ai getVariable [ZEVDeleteLaunchers, ZEVYES];
if (_deleteLaunchers == ZEVYES) then
{
	_weaponSec = _ai getVariable [ZEVSecondaryWeapon, "NONE"];
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

if (_clearBody == ZEVYES) then
{
	{_ai removeMagazine _x;} forEach (magazines _ai);
	{_ai removeWeapon _x;} forEach (weapons _ai);
};

if (_deleteNVGoogle == ZEVYES) then
{
	_ai removeWeapon ZEVNVGoggles;
};


if(isNull _aikiller) exitWith {};

_humanity 		= _aikiller getVariable ["humanity",0];
_humanity 		= _humanity + _humanityBoost;

if (alive _aikiller && isPlayer _aikiller) then
{
	_aikiller_name 	= name _aikiller;
	_aikiller setVariable["humanity", _humanity,true];
	_killsB 		= _aikiller getVariable["banditKills",0];
	_killsB 		= _killsB + 1;
	_aikiller setVariable["banditKills",_killsB,true];
	format ["AI %1 was killed by %2 (+%3 humanity, new total %4)",_ai_type,_aikiller_name,_humanityBoost,_humanity] call ZEVLog; 
};


{
	if (((position _x) distance (position _ai)) <= 150) then 
	{
		_x reveal [_aikiller, 4.0];
	};
} forEach allUnits;
	
sleep ZEVMissionCorpseCleanupTime;

deletevehicle _ai;

