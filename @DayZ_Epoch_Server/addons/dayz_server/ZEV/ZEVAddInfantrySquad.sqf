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
private ["_idx","_aiData","_groupData","_missionIndex","_aiunit","_aiGroup","_static","_squadMax","_squadMin","_missionObject","_groupParms","_groupChilds","_parms","_side","_spawnDelay","_routes"];
 
    _aiunit = objNull;
	_missionObject  = _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort infantry squad creation" call ZEVLog;
	};
	
	_groupData		= _this select 1; //name,props,childs
	
	
	_groupParms 	= _groupData select 1;
	_groupChilds	= _groupData select 2;
	
	_parms			= [_groupParms,[ZEVSide,ZEVSquadMin,ZEVSquadMax,ZEVSpawnDelay]] call ZEVGetProperty;
	
	_side				= _parms select 0;
	_squadMin			= _parms select 1;
	_squadMax 			= _parms select 2;
	_spawnDelay			= _parms select 3;
	format ['AddSquad _parms = %1', _parms] call ZEVLog;
	/*
	if (_side == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if (_side == "RESISTANCE") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if (_side == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	*/
	_aiGroup = [_missionObject, _side] call ZEVCreateGroup;
    format ['AddSquad _aiGroup = %1', _aiGroup] call ZEVLog;
    if (_spawnDelay != 0) then
    {
        sleep _spawnDelay;
    };
	_missionIndex 	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	_aiGroup setVariable [ZEVIndex,  _missionIndex, true];
	_aiGroup setVariable [ZEVStatic, _static, true];
	
	if (_squadMax < _squadMin) then
	{
		_squadMax = _squadMin;
	};
	if (_squadMin != _squadMax) then
	{
		_squadMin = _squadMin + floor(random(_squadMax - _squadMin));
	};
	_routes		= _groupChilds select 0;
	_aiData		= _groupChilds select 1; 
	diag_log format["ZEV: squad qty = %1",_squadMin];
	for [{ _idx=1 },{ _idx <= _squadMin },{ _idx = _idx + 1; }] do
    {
		_aiunit = [_missionObject, _aiGroup,_aiData] call ZEVAddAIUnit;
		diag_log format["ZEV: squad unit(%1) = %2",_squadMin, _aiunit];
		if (_idx == 1) then
		{
			_aiGroup selectLeader _aiunit;
		};
		sleep ZEVSleepSmall;
    };
    
    [_missionObject, _aiGroup, _routes] call ZEVAddWaypoints;
	