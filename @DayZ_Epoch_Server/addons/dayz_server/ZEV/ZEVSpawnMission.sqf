private ["_scriptHandle","_groupType","_mObj","_index","_missionName","_locationPos","_boxesData","_buildingsData","_vehiclesData","_AIGroupsData","_static","_AIGroups","_vehicles","_boxes","_buildings"];
_mObj				= _this;
if((isNil "_mObj") || (isNull _mObj)) exitWith
{
	"mission object is NULL, abort start mission" call ZEVLog;
};

_index				= _mObj getVariable ZEVIndex;
_missionName		= _mObj getVariable ZEVName;
_locationPos		= _mObj getVariable ZEVLocationPos;
_boxesData			= _mObj getVariable "BoxesData";
_buildingsData		= _mObj getVariable "BuildingData";
_vehiclesData		= _mObj getVariable "VehicleData";
_AIGroupsData   	= _mObj getVariable "GroupData";
_static				= _mObj getVariable ZEVStatic;

format["ZEVSpawnMission: mission %1  start spawn time %2", _missionName, time] call ZEVLog;
format["ZEVSpawnMission(Static = %2):  somebody in trigger zone, start spawn at %1", _locationPos, _static] call ZEVLog;
	
_AIGroups			= _AIGroupsData select 2;
{
	_groupType 	= _x select 0;
	_scriptHandle = -1;
	format ["spawn group: %1", _groupType] call ZEVLog;
	switch (_groupType) do
	{

		case ZEV_AI_Group:				{_scriptHandle = [_mObj, _x] spawn ZEVAddInfantry;};
		case ZEV_AI_Squad: 				{_scriptHandle = [_mObj, _x] spawn ZEVAddInfantrySquad;};
		case ZEV_AI_Paradrop:			{_scriptHandle = [_mObj, _x] spawn ZEVAddParadropStart;};
		case ZEV_AI_Static_group:		{_scriptHandle = [_mObj, _x] spawn ZEVStaticGroup;};
		case ZEV_AI_Vehicle_group:		{_scriptHandle = [_mObj, _x] spawn ZEVVehicleGroup;};
		case ZEV_AI_Vehicle_convoy_group:{_scriptHandle = [_mObj, _x] spawn ZEVVehicleConvoy;};
		case ZEV_MinefieldGroup:   		{_scriptHandle = [_mObj, _x] spawn ZEVMinefield;};
		case ZEV_BuildingPatrol:		{_scriptHandle = [_mObj, _x] spawn ZEVAddAreaSecurity;};
/*
		case ZEV_AI_Group:					{[_mObj, _x] call ZEVAddInfantry;};
		case ZEV_AI_Squad: 					{[_mObj, _x] call ZEVAddInfantrySquad;};
		case ZEV_AI_Paradrop:				{[_mObj, _x] call ZEVAddParadropStart;};
		case ZEV_AI_Static_group:			{[_mObj, _x] call ZEVStaticGroup;};
		case ZEV_AI_Vehicle_group:			{[_mObj, _x] call ZEVVehicleGroup;};
		case ZEV_AI_Vehicle_convoy_group:	{[_mObj, _x] call ZEVVehicleConvoy;};
		case ZEV_MinefieldGroup:   			{[_mObj, _x] call ZEVMinefield;};
		case ZEV_BuildingPatrol:			{[_mObj, _x] call ZEVAddAreaSecurity;};
*/		
	};
	//waitUntil { scriptDone _scriptHandle };
	
} foreach _AIGroups;
	
_vehicles			= [];
_vehicles			= _vehiclesData select 2;
format["ZEVSpawnMission(Static = %2)  _vehicles = %1 "   , _vehicles, _static] call ZEVLog;

{	
	if (typeName _x == "ARRAY") then
	{
		format ["spawn vehicle: %1", _x] call ZEVLog;
		[_mObj, _x] call ZEVAddVehicle; 
	};
} foreach _vehicles;

_boxes			= [];
_boxes			= _boxesData select 2;
{	
	format ["spawn box: %1", _x] call ZEVLog;
	if (typeName _x == "ARRAY") then
	{
		[_mObj, _x] call ZEVAddBox;
	};
} foreach _boxes;

_buildings			= [];
_buildings			= _buildingsData select 2;
{	
	if (typeName _x == "ARRAY") then
	{
		format ["spawn building: %1", _x] call ZEVLog;
		[_mObj, _x] call ZEVAddBuilding;
	};
} foreach _buildings;


format["ZEVSpawnMission: mission %1  end spawn time %2", _missionName, time] call ZEVLog;