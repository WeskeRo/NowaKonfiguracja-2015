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
private ["_aiGroupSkillsValueType","_AIData","_aiSide","_groupData","_missionIndex","_aiGroup","_static","_missionObject","_parms","_groupParms","_groupChilds","_spawnDelay","_skillsData","_routesData","_skillsParms","_bool"];
     
	_missionObject  = _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort infantry group creation" call ZEVLog;
	};
	
	_groupData		= _this select 1; //name,props,childs
	
	_missionIndex	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	
	_groupParms		= _groupData select 1;
	_groupChilds	= _groupData select 2;
	
	_parms = [_groupParms, [ZEVSide,ZEVSpawnDelay]] call ZEVGetProperty;
	
	_aiSide 	= _parms select 0;
	_spawnDelay = _parms select 1;
	if (_spawnDelay > 0) then
	{
		sleep _spawnDelay;
	};
	_bool = false;
	_bool = _missionObject getVariable [ZEVMissionDone, false];
	if (_bool) exitWith 
	{
		"mission done, group spawn terminated" call ZEVLog;
	};
	/*
	if (_aiSide == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if (_aiSide == "Resistance") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if (_aiSide == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	*/
	_aiGroup = [_missionObject, _aiSide] call ZEVCreateGroup;
	
	[_aiGroup, _groupParms] call ZEVLoadProperty;	
	
	_skillsData			= _groupChilds select 0;//name,props,childs
	_routesData			= _groupChilds select 1;
	_groupChilds		set [0, -1];
	_groupChilds		= _groupChilds - [-1];
	_groupChilds		set [0, -1];
	_groupChilds		= _groupChilds - [-1];

	_AIData 			= _groupChilds;
	
	
	_skillsParms		= _skillsData select 1;
	_parms = [_skillsParms, [ZEVSkillType]] call ZEVGetProperty;
	_aiGroupSkillsValueType  	= _parms select 0;
	

	_aiGroup setVariable [ZEVGroupSkills, 			_skillsParms];
	_aiGroup setVariable [ZEVGroupSkillsValueType, 	_aiGroupSkillsValueType];
	_aiGroup setVariable [ZEVIndex, 				_missionIndex];
	_aiGroup setVariable [ZEVStatic, 				_static];
	_aiGroup setVariable [ZEVObject, 				_missionObject];
	
	(format ["Spawn initiated: Mission idx %1, Group %2", _missionIndex, _aiGroup]) call ZEVLog;  
    
	if( typeName (_aiData select 0) == "ARRAY") then
	{	
		{
			//_x = name,props,childs
			[_missionObject, _aiGroup,_x] call ZEVAddAIUnit;
			sleep ZEVSleepSmall;
		} foreach _aiData;
	};
	//_routesData - name, props, childs(routes)
	[_missionObject, _aiGroup, _routesData] call ZEVAddWayPoints;