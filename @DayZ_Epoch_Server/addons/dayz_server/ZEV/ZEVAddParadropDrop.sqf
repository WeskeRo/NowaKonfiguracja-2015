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
private ["_vehicleList","_aiunit","_aiGroup","_helipos","_helicopter","_locationPos","_locationRadius","_missionIndex","_AIData","_chute","_static","_squadMax","_squadMin","_missionObject","_squadData","_routesData","_side"];
 
	_aiunit 		= objNull;
	
 	_missionObject	= _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort Paradrop creation" call ZEVLog;
	};
	
	_helicopter		= _this select 1;
	_squadData		= _this select 2;
	
	_missionIndex  = _missionObject getVariable ZEVIndex;
    _aiData			= _squadData select 0;
	_routesData		= _squadData select 1;
	_squadMin		= _squadData select 2;
	_squadMax		= _squadData select 3;
	_side			= _squadData select 4;

	_locationPos	= _missionObject getVariable ZEVLocationPos;
	_locationRadius = _missionObject getVariable ZEVSpawnRadius;
	_static			= _missionObject getVariable ZEVStatic;
	/*
	if (_side == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if (_side == "Resistance") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if (_side == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};
	_aiGroup setVariable [ZEVIndex, _missionIndex, true];	
	_aiGroup setVariable [ZEVStatic, _static, true];	
	*/
	_aiGroup = [_missionObject, _side] call ZEVCreateGroup;	
	
	if (_squadMax < _squadMin) then
	{
		_squadMax = _squadMin;
	};
	if (_squadMin != _squadMax) then
	{
		_squadMin = _squadMin + floor(random(_squadMax - _squadMin));
	};
	for [{ x=1 },{ x <= _squadMin },{ x = x + 1; }] do
	{
		_helipos = getpos _helicopter;
		_chute = createVehicle ["ParachuteEast", [(_helipos select 0), (_helipos select 1), (_helipos select 2)- 2], [], 0, "NONE"];
        _chute call ZEVAddToObjectMonitor;
		_chute setVariable [ZEVIndex, _missionIndex, true];
		_chute setVariable [ZEVStatic, _static, true];
		_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
		_vehicleList set [count _vehicleList, _chute]; 
		[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;
		_aiunit = [_missionObject, _aiGroup,_AIData] call ZEVAddAIUnit;
		_aiunit moveInDriver _chute;
		sleep 0.5;
	};
	[_missionObject, _aiGroup, _routesData] call ZEVAddWayPoints;