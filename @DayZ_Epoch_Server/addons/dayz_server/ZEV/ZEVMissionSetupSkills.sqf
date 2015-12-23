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
private ["_ai", "_aiSkills", "_aiUsedSkills", "_aiUsedSkillsValueType", "_aiSkillsValueType","_aiGroupSkills","_aiGroupSkillsValueType","_aiSkillName","_aiSkillValue"];

_ai						= _this select 0;
_aiSkills				= _this select 1;
_aiSkillsValueType		= _this select 2;
if(count _this > 3) then
{
	_aiGroupSkills			= _this select 3;
	_aiGroupSkillsValueType = _this select 4;
};

_aiUsedSkills 			= _aiSkills;
_aiUsedSkillsValueType	= _aiSkillsValueType;

if((_aiSkillsValueType == "Random") and (count _this > 3)) then
{
	_aiUsedSkills			= _aiGroupSkills;
	_aiUsedSkillsValueType	= _aiGroupSkillsValueType;
};

{
	_aiSkillName 	= _x select 0;
	_aiSkillValue	= _x select 1;
	if(_aiUsedSkillsValueType == "Random") then
	{
		_aiSkillValue = 0.5 + random(0.5);
	};
	
	_ai setSkill [_aiSkillName, _aiSkillValue];
	
}foreach _aiUsedSkills;
