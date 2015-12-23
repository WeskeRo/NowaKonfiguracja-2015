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
private [
"_aiData","_aiName","_aiPosType","_aiPos","_behaviour","_combatmode", "_armor","_aiweaponAndMag","_aigear","_aibackpack","_aiskillsParms",
"_aiSkillsValueType","_aiSkills","_locationPos","_locationRadius","_aiGroup","_aiunit","_aiweapon","_aimags","_aiweaponSec","_aimagsSec",
"_missionIndex","_magsName","_magazine","_aibackpackName","_aibackpackItems","_aiGroupSkills","_aiGroupSkillsValueType","_aiLoot","_missionParms",
"_static","_clearBody","_deleteLaunchers","_aiRandomName","_aibpRandomList","_aiWeaponRandomList","_deleteNVGoogle","_humanityGain","_headshots",
"_cashmoney","_absolutePos"];

    _aiunit = objNull;

	_aiGroup		= _this select 0;
	_aiData			= _this select 1;
	_absolutePos 	= false;
	if(count _this == 3) then
	{
		_absolutePos = _this select 2;
	};
	_missionIndex	= _aiGroup getVariable "ZEVMissionIndex";
	_static 		= _aiGroup getVariable "ZEVMissionStatic";
	_missionParms 	= [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;//[_locationPos, _locationRadius, _locationTriggerRadius]];	
	_locationPos	= _missionParms select 0;
	_locationRadius = _missionParms select 1;
	
	_aiName			= _aiData select 0;
	_aiPosType		= _aiData select 1;
	_aiPos			= _aiData select 2;
	_behaviour		= _aiData select 3;
	_combatmode		= _aiData select 4;
	_armor			= _aiData select 5;
	_aiweaponAndMag = _aiData select 6;//["weapon",magsQty];
	_aigear			= _aiData select 7;
	_aibackpack		= _aiData select 8;
	_aiskillsParms  = _aiData select 9;
	_clearBody		= _aiData select 10;
	_deleteLaunchers= _aiData select 11;
	_aiRandomName   = _aiData select 12;
	_deleteNVGoogle = _aiData select 13;
	_humanityGain	= _aiData select 14;
	_headshots		= _aiData select 15;
	_cashmoney		= _aiData select 16;
	
	_aiSkillsValueType 	= _aiskillsParms select 0;
	_aiSkills			= _aiskillsParms select 1;
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddUnit:  select skin %1", 		_aiName]; };
	
	_aiName = [_missionIndex, _aiName, _aiSide, _static, _aiRandomName] call ZEVMissionSelectSkin;
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddUnit:  selected skin %1", 	_aiName]; };
	
	if (_absolutePos) then
	{
		_aiPos = _aiPos;
	}
	else
	{
		_aiPos = [_aiPos, _aiPosType, _locationPos, _locationRadius] call ZEVMissionSelectPos;
	};

	_aiName createUnit [_aiPos, _aiGroup, "_aiunit=this;",1,"PRIVATE"];
	
	[_aiunit] joinSilent _aiGroup; 
	
	if(ZEVMissionDebug > 1) then { diag_log format ["ZEVMission - AddAIUnit: Creating AI unit by %1 at %2. Result:%3 | Weapon:%4, Gear:%5, Backpack: %6",player,_aiPos,_aiunit,_aiweaponAndMag,_aigear,_aibackpack]; };

	_aiunit enableAI "TARGET";
	_aiunit enableAI "AUTOTARGET";
	_aiunit enableAI "MOVE";
	_aiunit enableAI "ANIM";
	_aiunit enableAI "FSM";
	_aiunit allowDammage true;

	_aiunit addEventHandler ['killed',{_this spawn ZEVMissionBodyclean}]; //Body disappear time

	_aiunit setCombatMode _combatmode;
	_aiunit setBehaviour _behaviour;

	removeAllWeapons _aiunit;

	_aiweapon = _aiweaponAndMag select 0;
	_aimags	  = _aiweaponAndMag select 1;
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  ai weaponAndMags %1", 	_aiweaponAndMag]; };
	_aiweaponSec	= _aiweaponAndMag select 2;
	_aimagsSec	  	= _aiweaponAndMag select 3;
	_aiWeaponRandomList = _aiweaponAndMag select 4;
	
	_aiweaponAndMag = [_missionIndex, _aiweapon, _aimags, _static, _aiWeaponRandomList] call ZEVMissionSelectWeapon;
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  ai selected weaponAndMags %1", 	_aiweaponAndMag]; };
	_aiweapon = _aiweaponAndMag select 0;
	_aimags	  = _aiweaponAndMag select 1;

	
	if(_aiweaponSec != "NONE") then
	{
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  ai second weapon %1", 	_aiweaponSec]; };
		_aiunit addweapon _aiweaponSec;
		_aiunit setVariable ["ZEVWeaponSec", _aiweaponSec];
		_magsName = getArray (configFile >> "cfgWeapons" >> _aiweaponSec >> "magazines");
		_magazine = _magsName select 0;
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  ai second weapon ammo %1", 	_magazine]; };
		if(_aimagsSec == 0) then
		{
			_aimagsSec = 1;
		};
		for "_i" from 1 to _aimagsSec do {_aiunit addMagazine _magazine;};
	};
	
	_magsName = getArray (configFile >> "cfgWeapons" >> _aiweapon >> "magazines");
	_magazine = _magsName select 0;
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  ai prim weapon ammo %1", 	_magazine]; };
	_aiunit addweapon _aiweapon;
	for "_i" from 1 to _aimags do {_aiunit addMagazine _magazine;};
	_aiunit removeWeapon "ItemRadio","NVGoggles";
	_aiunit setVariable ["ZEVMissionWeapon",_aiweapon, true];
	_aiunit setVariable ["ZEVMissionMagazine",_magazine, true];

	_aibackpackName		= _aibackpack select 0;
	_aibackpackItems	= _aibackpack select 1;
	_aibpRandomList		= _aibackpack select 2;
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  _aibackpackName = %1", _aibackpackName]; };
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  _aibackpackItems = %1", _aibackpackItems]; };
	[_missionIndex, _aiunit, _aibackpackName, _aibackpackItems, _static, _aibpRandomList] call ZEVMissionAddBackpack;
	
	_aiGroupSkills = _aiGroup getVariable ["ZEVGroupSkills", []];
	_aiGroupSkillsValueType = _aiGroup getVariable ["ZEVGroupSkillsValueType", "Random"];
	
	if(count _aiGroupSkills > 0) then
	{
		[_aiunit, _aiSkills, _aiSkillsValueType, _aiGroupSkills, _aiGroupSkillsValueType] call ZEVMissionSetupSkills;
	}
	else
	{
		[_aiunit, _aiSkills, _aiSkillsValueType] call ZEVMissionSetupSkills;
	};
	
	_aiLoot = _aigear select 0;
	
	[_aiunit, _aiLoot select 0, _aiLoot select 1, _aiLoot select 2, _missionIndex, _static] call ZEVMissionAddGear;
	
	_aiunit setVariable ["ZEVMissionIndex", _missionIndex];
	_aiunit setVariable ["ZEVMissionStatic", _static];
	_aiunit setVariable ["ZEVMissionClearBody", _clearBody];
	_aiunit setVariable ["ZEVMissionDeleteLaunchers", _deleteLaunchers];
	_aiunit setVariable ["unithealth",[12000 * _armor,0,0]];
	_aiunit setVariable ["ZEVMissionDeleteNVGoogle",_deleteNVGoogle];
	_aiunit setVariable ["unconscious",true];	
	_aiunit setVariable ["ZEVMissionHumanityGain", _humanityGain];
	_aiunit setVariable ["ZEVMissionInitialPos", _aiPos];
	_aiunit setVariable ["headShots", _headshots, true];
	_aiunit setVariable ["CashMoney", _cashmoney, true];
	_aiunit addWeapon "NVGoggles";
	
	if((ZEVMissionAIPlayerDetect > 0)&&(ZEVMissionAIPlayerDetect < 1000)) then
	{
		[_aiunit] spawn { 
			private ["_ai"];
			_ai = _this select 0;
			while {alive _ai} do
			{
				{
					if((isPlayer _x) &&((_ai distance _x) < ZEVMissionAIPlayerDetect)) then
					{
						_ai reveal [_x, 4];
						if(ZEVMissionDebug > 2) then {diag_log format ["ZEVMission : AI: %1 revealed %2", _ai, _x];};
					};
				} foreach playableUnits;
				sleep 10;
			};
		};
	};
	_aiweapon = _aiunit getVariable["ZEVMissionWeapon", ""];
/*	
	if ( _aiweapon != "") then
	{
		[_aiunit] spawn { 
			private ["_ai","_w","_m"];
			_ai = _this select 0;
			_w  = _ai getVariable "ZEVMissionWeapon";
			_m  = _ai getVariable "ZEVMissionMagazine";
			while {alive _ai} do
			{
				if( (_ai ammo _w) < 1) then
				{
					_ai addMagazine [_m, 1];
				};
				sleep 20;
			};
		};
	};
*/	
	if(random(1) <= ZEVMissionThrowSmokeShellChance) then
	{
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddUnit:  spawn ZEVMissionThrowSmokeShell for %1", _aiunit]; };
		[_aiunit] spawn ZEVMissionThrowSmokeShell;
	};
_aiunit