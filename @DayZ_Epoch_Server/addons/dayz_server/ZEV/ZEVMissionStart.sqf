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
private ["_missionIndex",
		"_missionParms",
		"_missionName",
		"_missionPosType",
		"_missionPos",
		"_missionRaduis",
		"_missionTriggerRaduis",
		"_missionStartMessage",
		"_missionEndMessage",
		"_missionData",
		"_buildings",
		"_vehicles",
		"_AIGroups",
		"_missionActualPos",
		"_buildingName",
		"_buildingPosType",
		"_buildingPos",
		"_buildingAzimut",
		"_building",
		"_vehicleName",
		"_vehiclePosType",
		"_vehiclePos",
		"_vehicleAzimut",
		"_vehicle",
		"_vehicleList",
		"_vehicleLoot",
		"_vehicleLootType",
		"_vehicleLootItems",
		"_playerCome",
		"_startTime",
		"_missionTimeOut",
		"_cleanMission",
		"_hAddGroup",
		"_missionFailMessage",
		"_locationQty",
		"_locationArray",
		"_buildingsData",
		"_buildingsQty",
		"_vehiclesQty",
		"_vehiclesData",
		"_AIGroupsQty",
		"_AIGroupsData",
		"_loop1",
		"_loop2",
		"_missionCountInRadius","_missionTimeLimit","_locationsData","_locationData",
		"_locationPosType","_locationTriggerRadius","_locationRadius","_locationPos",
		"_currentTime","_startCondition","_endCondition","_static","_showMissionMarker","_markerColor",
		"_positions","_posCount","_curPos","_posArray","_areaPos"];

	
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: starting script - ZEVMissionStart %1 ", ""]; };


_missionIndex		= _this select 0;
_missionParms		= _this select 1;
_static				= _this select 2;

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart reading parameters of mission  %1 ", _missionIndex]; };

_missionName		= _missionParms select 0;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _missionName = %1 ", _missionName]; };

_missionStartMessage= _missionParms select 1;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _missionStartMessage = %1 ", _missionStartMessage]; };

_missionEndMessage  = _missionParms select 2;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _missionEndMessage = %1 ", _missionEndMessage]; };

_missionFailMessage = _missionParms select 3;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _missionFailMessage = %1 ", _missionFailMessage]; };

_missionTimeLimit   = _missionParms select 4;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _missionTimeLimit = %1 ", _missionTimeLimit]; };

_locationsData		= _missionParms select 5;

_startCondition		= _missionParms select 6;

_endCondition		= _missionParms select 7;

//_static				= _missionParms select 8;

_showMissionMarker  = _missionParms select 9;

_markerColor		= _missionParms select 10;

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission: _locationsData = %1 ", _locationsData]; };

_locationQty		=  _locationsData select 0;
_locationArray		=  _locationsData select 1;

if(count _locationArray < 1) exitWith {diag_log format["ZEVMission: No data for mission num: %1", _missionIndex];};

_locationData		=  _locationArray  call BIS_fnc_selectRandom;


if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart selected location data %1 ", _locationData]; };

_locationPosType	= _locationData select 0;
_locationTriggerRadius = _locationData select 1;
_locationRadius		= _locationData select 2;
_locationPos		= _locationData select 3;

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart locPosType:%1, trigRadius:%2, Radius:%3, Pos:%4 ", _locationPosType, _locationTriggerRadius, _locationradius, _locationPos]; };

_buildingsData		= _locationData select 4;

_vehiclesData		= _locationData select 5;

_AIGroupsData   	= _locationData select 6;

_positions			= _locationData select 7;
_posCount			= _positions select 0;
_posArray			= _positions select 1; //[["postype",[x,y,z],radius]]
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart _positions = %1", _positions]; };

if(_locationPosType == "Random") then
{
	if(_posCount > 0) then
	{
		_areaPos		=	_posArray call BIS_fnc_selectRandom;
		_areaPos		= _areaPos select 1;
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart _areaPos = %1", _areaPos]; };
		_areaPos = [_areaPos, "Specified", _locationPos, _locationRadius] call ZEVMissionSelectPos;
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart _areaPos absolute = %1", _areaPos]; };
		_locationPos 	= _areaPos;
	}
	else
	{
		if(ZEVMissionMapName == "Chernorus") then
		{
			_locationPos = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;
		};
		if(ZEVMissionMapName == "Napf") then
		{
			_locationPos = [getMarkerPos "center",0,7000,10,0,2000,0] call BIS_fnc_findSafePos;
		};
	};
};
if(_missionTimeLimit == 0) then 
{
	_missionTimeLimit = ZEVMissionTimeOut;
};
_missionCountInRadius = 0;

_missionCountInRadius = [_locationPos, _locationTriggerRadius, _static] call ZEVMissionFindRunningMissionInRadius;

if(_missionCountInRadius > 0) exitWith {diag_log "ZEVMission - ZEVMissionStart: не начинаем миссию, она приходится на уже существующую или рядом";[_missionIndex, _static, 0] call ZEVMissionSetMissionInProgress;};

[_missionIndex, _static, [_locationPos, _locationRadius, _locationTriggerRadius, _endCondition]] call ZEVMissionSetActiveMissionParms;

[_missionIndex, _static, 1] call ZEVMissionSetMissionInProgress;

if(_showMissionMarker == "Yes") then
{
	[_missionIndex, _static, 1] call ZEVMissionSetMarkerStatus;
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart add map marker at %1 ", _locationPos]; };
	[_locationPos, _missionName, _missionIndex, _locationRadius * 3, _static, _markerColor] spawn ZEVMissionAddMarker;
};
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart show mission start message: %1 ", _missionStartMessage]; };

//[nil,nil,rTitleText, _missionStartMessage, "PLAIN",10] call RE;
ZEVMissionHint = [_missionStartMessage, _missionName] ; publicVariable "ZEVMissionHint";

_missionTimeOut = true;
_cleanMission 	= false;
_playerCome 	= false;
_starttime 		= floor(time);

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart:  start waiting for player will be near %1m from %2", _locationTriggerRadius, _locationPos]; };

if(_startCondition == "Start when player in trigger range") then
{
	while {_missionTimeOut} do 
	{
		sleep 15;
		_currentTime = floor(time);
		{
			if((isPlayer _x) AND (_x distance _locationPos <= _locationTriggerRadius)) then 
			{
				_playerCome = true
			};
		}forEach playableUnits;
		
		if (_currenttime - _startTime >= _missionTimeLimit) then 
		{
			_cleanMission = true;
		};
		if ((_playerCome ) OR (_cleanMission)) then 
		{
			_missionTimeOut = false;
		};
	};
}
else
{
	_playerCome = true;
};

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionStart:  somebody in trigger zone or  mission is timed out %1 (line 156)", "_"]; };

if(_playerCome) then
{
	[_missionIndex, _missionName, _missionEndMessage, _missionFailMessage, _missionTimeLimit, _locationRadius, _locationPos, _buildingsData, _vehiclesData, _AIGroupsData, _static] spawn ZEVMissionMonitor;
}
else
{
	//[nil,nil,rTitleText, _missionFailMessage, "PLAIN",10] call RE;
	ZEVMissionHintRed =  [_missionFailMessage, "MISSION TIMED OUT"]; publicVariable "ZEVMissionHintRed";
	[_missionIndex, _static ,0] call ZEVMissionSetMissionInProgress;
	[_missionIndex, _static ,0] call ZEVMissionSetMarkerStatus;
};

