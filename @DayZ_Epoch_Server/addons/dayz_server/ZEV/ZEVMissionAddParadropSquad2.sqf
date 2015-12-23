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
private ["_aiunit","_aiGroup","_helipos","_helicopter","_locationPos","_locationRadius",
"_missionIndex","_aiSquadQty","_AIData","_routeData","_aiSide","_chute","_static"];
 
	_aiunit 		= objNull;
 	_missionIndex	= _this select 0;
	_aiSquadQty		= _this select 1;
	_AIData 		= _this select 2;
	_routeData		= _this select 3;
	_helicopter		= _this select 4;
	_aiSide			= _this select 5;
	_locationPos	= _this select 6;
	_locationRadius = _this select 7;
	_static			= _this select 8;
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
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex, true];	
	_aiGroup setVariable ["ZEVMissionStatic", _static, true];	
	
	for [{ x=1 },{ x < _aiSquadQty+1 },{ x = x + 1; }] do
	{
		_helipos = getpos _helicopter;
		_chute = createVehicle ["ParachuteEast", [(_helipos select 0), (_helipos select 1), (_helipos select 2)- 2], [], 0, "NONE"];
		_chute setVariable ["ObjectID","1",true];
		PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_chute];
		_aiunit = [_aiGroup,_AIData] call ZEVMissionAddAIUnit;
		_aiunit moveInDriver _chute;
		sleep 0.75;
	};
	[_aiGroup, _routeData, _missionIndex] call ZEVMissionAddWayPoints;