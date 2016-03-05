private ["_data","_aiName","_aiPos","_behaviour","_combatmode","_armor","_locPos","_locR","_grp","_ai","_missionIndex","_grpSkill","_grpSkillType","_static","_clearBody","_deleteLaunchers","_deleteNVGoogle","_humanityGain","_headshots","_cashmoney","_absPos","_missionObject","_parms","_aiChilds","_p","_aiNameType","_gearData","_rndList","_skillsData","_usedSkills","_gearLoot","_aiPosType"];
_ai=objNull;
_missionObject  = _this select 0;
_grp			= _this select 1;
_data			= _this select 2;
_absPos 		= [];
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	diag_log "ZEV# addUnit - mission object is NULL, abort AI creation";
};
if (isNull _grp) exitWith { diag_log "ZEV# addUnit - _grp is NULL, abort AI creation"; };

format ["AddUnit _missionObject = %1",_missionObject] call ZEVLog;
format ["AddUnit _grp = %1",_grp] call ZEVLog;
if (count _this == 4)then
{	
	_absPos = _this select 3;
};
_missionIndex	= _missionObject getVariable ZEVIndex;
_static 		= _missionObject getVariable ZEVStatic;
_locPos			= _missionObject getVariable ZEVLocationPos;
_locR 			= _missionObject getVariable ZEVSpawnRadius;
_parms			= _data select 1;
_aiChilds		= _data select 2;
_p 			= [ZEVNameType, ZEVSkinName, ZEVPositionType,ZEVBehaviour,ZEVCombatMode,ZEVArmor,ZEVClearBody,ZEVRemoveLauncher,ZEVRemoveNVGoogle,ZEVHumanityGain,ZEVHeadShots,ZEVCashMoney];
_p			= [_parms, _p] call ZEVGetProperty; 
format ["AddUnit _p = %1",_p] call ZEVLog;
_aiNameType		= _p select 0;
_aiName			= _p select 1;
_aiPosType		= _p select 2;
_behaviour		= _p select 3;
_combatmode		= _p select 4;
_armor			= _p select 5;
_clearBody		= _p select 6;
_deleteLaunchers= _p select 7;
_deleteNVGoogle = _p select 8;
_humanityGain	= _p select 9;
_headshots		= _p select 10;
_cashmoney		= _p select 11;
_aiPos			= [_parms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty; 

_rndList = [_parms, ZEVSkinName] call ZEVGetPropertyRandomList;
_aiName = [_aiNameType, _aiName, SIde _grp, _rndList] call ZEVSelectSkin;
if ( count _absPos > 0) then 
{
	_aiPos = _absPos;
}
else
{
	_aiPos = [_aiPos, _aiPosType, _locPos, _locR] call ZEVSelectPos;
};
format ['AddUnit: _aiName= %1',_aiName] call ZEVLog;
if(count _absPos > 0) then
{
	_ai = _grp createUnit [_aiName, _aiPos, [], 0, "CAN_COLLIDE"];
}
else
{
_aiName createUnit [_aiPos, _grp, '_ai=this;',1,"PRIVATE"];
};
format ['AddUnit: _ai= %1',_ai] call ZEVLog;
_ai addEventHandler ["HandleDamage", { private ["_ret","_u","_s"];_u = _this select 0; _s = _this select 3;_ret = (_this select 2)/(_u getVariable["ZEVArmor",1]); if((_u getVariable [ZEVIndex, -1]) == (_s getVariable [ZEVIndex, -1])) then {_ret=0;};format ["unit %1 get damage %2", _u, _ret] call ZEVLog;_ret}];
//_ai addEventHandler ["FiredNear", { (_this select 0) reveal [(_this select 1), 4]; }];
[_ai] joinSilent _grp; 
{_ai enableAI _x;} foreach ["TARGET","AUTOTARGET","MOVE","ANIM","FSM"];
_ai allowDammage true;
_ai addEventHandler ['killed',{_this spawn ZEVBodyclean}]; 
_ai setCombatMode _combatmode;
_ai setBehaviour _behaviour;
removeAllWeapons _ai;
{
	private ["_nodeName"];
	_nodeName = _x select 0;
	switch(_nodeName) do
	{
		case "Skills"				: { _skillsData = _x;};
		case "PrimaryWeapon" 		: { [_ai, _x, ZEVPrimaryWeapon] call ZEVAddWeapon; };
		case "SecondaryWeapon"		: {	[_ai, _x, ZEVSecondaryWeapon] call ZEVAddWeapon;};
		case "HeadGear" 			: { [_ai, _x] call ZEVAddHeadGear;};
		case "Vest"					: {	[_ai, _x] call ZEVAddVest;};
		case "Uniform"				: {	[_ai, _x] call ZEVAddUniform;};
		case "BackPack"				: { [_ai, _x] call ZEVAddBackpack;};
		case "Gear"					: { _gearData = _x; };
	};
} foreach _aiChilds;

_grpSkill = [];
_grpSkill 		= _grp getVariable [ZEVGroupSkills, []];
_grpSkillType = ZEVRandom;
_grpSkillType 	= _grp getVariable [ZEVGroupSkillsValueType, ZEVRandom];
if (( count _grpSkill > 0) && (_grpSkillType == ZEVSpecified)) then
{
	_usedSkills = _grpSkill;
}
else
{
	_usedSkills = _skillsData select 1;
};
[_ai,_usedSkills] call ZEVSetupSkills;
_gearLoot = _gearData select 2;
[_ai,_gearLoot select 0,ZEVPrimaryWeapon]call ZEVAddItemToObject;	
[_ai,_gearLoot select 1,ZEVItemName]call ZEVAddItemToObject;	
_p=[
[ZEVObject, _missionObject, true],
[ZEVIndex,_missionIndex, true],
[ZEVStatic, _static, true],
[ZEVClearBody, _clearBody, true],
[ZEVDeleteLaunchers, _deleteLaunchers, true],
["unithealth",[12000,0,0], true],
[ZEVDeleteNVGoogle,_deleteNVGoogle, true],
["unconscious",true, true],
[ZEVHumanityGain, _humanityGain, true],
[ZEVInitialPos, _aiPos, true],
[ZEVHeadShots, _headshots, true],
[ZEVCashMoney, _cashmoney, true],
[ZEVArmor, _armor, true]];
{ _ai setVariable _x; } foreach _p;
_ai addWeapon ZEVNVGoggles;
if (ZEVMissionAIPlayerDetect > 0) then
{
	_ai spawn ZEVPlayerDetect;
};
//_mags = magazines player TODO доделать чтобы бот лутал ближайшие трупы\ящики\технику если патронов нет
if (random(1) <= ZEVMissionThrowSmokeShellChance) then
{
	[_ai] spawn ZEVThrowSmokeShell;
};
_ai call ZEVAddAI2List;
_ai