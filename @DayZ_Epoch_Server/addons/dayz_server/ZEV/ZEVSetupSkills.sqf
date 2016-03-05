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
private ["_ai","_skillValue","_skillName","_skills","_skillsType","_skillType"];
_ai			= _this select 0;
_skills		= _this select 1;
format ["Setup Skills: _this = %1", _this] call ZEVLog;
_skillsType = ([_skills, [ZEVSkillType]] call ZEVGetProperty) select 0;
{
	_skillValue = 0.0;
	_skillName 	= _x select 0;
	if (_skillName != ZEVSkillType) then
	{
		_skillValue	= _x select 1;
		if (_skillsType == ZEVRandom) then
		{
			_skillValue = 0.3 + random(0.7);
		};
		_ai setSkill [_skillName, _skillValue];
	};
} foreach _skills;
