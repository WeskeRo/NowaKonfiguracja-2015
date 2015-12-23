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
"_routeData","_AIData","_aiSquadQty","_aiGroupType","_aiFormation","_aiSide",
"_AIParmsQty","_groupData","_missionIndex","_aiunit","_aiGroup","_static","_aiSquadQtyMax"];
 
    _aiunit = objNull;
	_missionIndex	= _this select 0;
	_groupData		= _this select 1;
	_static			= _this select 2;
	
	_AIParmsQty			= _groupData select 0;
	_aiSide				= _groupData select 1;
	_aiFormation		= _groupData select 2;
	_aiGroupType		= _groupData select 3;
	_aiSquadQty			= _groupData select 4;
	_AIData 			= _groupData select 5;
	_routeData			= _groupData select 6;
	_aiSquadQtyMax		= _groupData select 7;
	
	if(_aiSide == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if(_aiSide == "RESISTANCE") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if(_aiSide == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	
	_aiGroup setFormation _aiFormation;	
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex, true];
	_aiGroup setVariable ["ZEVMissionStatic", _static, true];
	if (_aiSquadQtyMax < _aiSquadQty) then
	{
		_aiSquadQtyMax = _aiSquadQty;
	};
	if (_aiSquadQty != _aiSquadQtyMax) then
	{
		_aiSquadQty = _aiSquadQty + floor(random(_aiSquadQtyMax - _aiSquadQty));
	};
	for [{ x=1 },{ x < _aiSquadQty+1 },{ x = x + 1; }] do
    {
		_aiunit = [_aiGroup,_AIData] call ZEVMissionAddAIUnit;
		if (x == 1) then
		{
			_aiGroup selectLeader _aiunit;
		};
		sleep 0.1;
    };
	[_aiGroup, _routeData, _missionIndex] call ZEVMissionAddWayPoints;
	
