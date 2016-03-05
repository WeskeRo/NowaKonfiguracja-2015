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
private ["_missionIndex","_groupData","_static","_aiData","_building","_aiQty","_box","_aiParmsQty","_aiSide","_aiFormation",
"_buildingPositions","_posInBuilding","_curAI","_wp","_i","_areaRadius","_gropuProps","_spawnDelay","_aiGroup","_missionObject","_building","_allBuildings","_buildingPositions","_buildings"];

//_missionObject, _aiData, _box, _buildings, _aiQty, _areaPos, _areaRadius, _aiSide
_missionObject 	= _this select 0;

if(isNull _missionObject) exitWith {"BuildingPatrol - mission object is NULL" call ZEVLog;};

_aiData			= _this select 1;
_box			= _this select 2;
_building		= _this select 3;
_aiQty			= _this select 4;
_areaPos		= _this select 5;
_areaRadius		= _this select 6;
_aiSide			= _this select 7;
_allBuildings	= _this select 8;
_buildingPositions = _this select 9;

_missionIndex	= _missionObject getVariable ZEVIndex;
_static			= _missionObject getVariable ZEVStatic;
/*
if(_aiSide == "EAST") then
{
	_aiGroup 	= createGroup EAST;	
};
if(_aiSide == "RESISTANCE") then
{
	_aiGroup 	= createGroup RESISTANCE;	
};
if(_aiSide == "CIVILIAN") then
{
	_aiGroup 	= createGroup CIVILIAN;	
};

_aiGroup setVariable ["ZEVMissionGroupReady", false, true];
_aiGroup setVariable [ZEVIndex, _missionIndex];
_aiGroup setVariable [ZEVStatic, _static];
*/
_aiGroup = [_missionObject, _aiSide] call ZEVCreateGroup;
_i = 0;

if ( isNull _building) exitWith { "BuildingPatrol - no buildings" call ZEVLog; };

//_buildingPositions	= _building call ZEVBuildingPos;
_posInBuilding		= [];
while { _i < _aiQty } do
{
	_posInBuilding 		= _buildingPositions call BIS_fnc_selectRandom;
	_buildingPositions 	= _buildingPositions - [_posInBuilding];
	[_missionObject, _aiGroup, _aiData, _posInBuilding] call ZEVAddAIUnit;
	_i = _i + 1;
	sleep ZEVSleepSmall;
};

_buildingPositions	= _building call ZEVBuildingPos;

_posInBuilding 		= _buildingPositions call BIS_fnc_selectRandom;

format ["BuildingPatrol : add box = %1",_box] call ZEVLog;

[_missionObject, _box, _posInBuilding] call ZEVAddBox;

_i = 0;
format ["BuildingPatrol add group WP = %1",_aiGroup] call ZEVLog;

//_buildings	= nearestObjects [position _building, ["house"], _areaRadius];
{
	_buildings 			= _x select 0; 
	_buildingPositions 	= _x select 1;//call ZEVBuildingPos;
	if(count _buildingPositions > 0) then
	{
		_posInBuilding 		= _buildingPositions call BIS_fnc_selectRandom;
		_i = _buildingPositions find _posInBuilding;
		_wp = _aiGroup addWaypoint [_posInBuilding, 0] ;
		_wp setWaypointFormation "Column";
		_wp setWaypointBehaviour "CEARLESS";//COMBAT
		_wp setWaypointCombatMode "RED";
		_wp setWaypointCompletionRadius 1;
		_wp waypointAttachObject _buildings;
		_wp setwaypointHousePosition _i;
		_wp setWaypointType "MOVE";
	};
	sleep ZEVSleepSmall;
} foreach _allBuildings;
if(count _allBuildings > 0 ) then
{
	_wp setWaypointType "CYCLE";
};


