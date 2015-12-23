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
"_aiGroupSkills","_aiGroupSkillsValueType","_aiGroupSkillsParms","_routeData","_AIData","_aiGroupType","_aiFormation","_aiSide",
"_AIParmsQty","_groupData","_missionIndex","_aiGroup","_static"];
     
	_missionIndex	= _this select 0;
	_groupData		= _this select 1;
	_static			= _this select 2;
	
	_AIParmsQty			= _groupData select 0;
	_aiSide				= _groupData select 1;
	_aiFormation		= _groupData select 2;
	_aiGroupType		= _groupData select 3;
	_AIData 			= _groupData select 4;//боты
	_routeData			= _groupData select 5;//маршрут группы
	_aiGroupSkillsParms = _groupData select 6;//скилы группы
	
	_aiGroupSkillsValueType  	= _aiGroupSkillsParms select 0;
	_aiGroupSkills				= _aiGroupSkillsParms select 1;
	if(_aiSide == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if(_aiSide == "Resistance") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if(_aiSide == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	_aiGroup setVariable ["ZEVGroupSkills", _aiGroupSkills];
	_aiGroup setVariable ["ZEVGroupSkillsValueType", _aiGroupSkillsValueType];
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex];
	_aiGroup setVariable ["ZEVMissionStatic", _static];
	
	if(ZEVMissionDebug > 1) then { diag_log format ["ZEVMission: Spawn initiated: Mission idx %1, Group %2", _missionIndex, _aiGroup]; };
    _aiGroup setFormation _aiFormation;
    {
		[_aiGroup,_x] call ZEVMissionAddAIUnit;
    } foreach _aiData;
	
	[_aiGroup, _routeData, _missionIndex] call ZEVMissionAddWayPoints;
	

    
