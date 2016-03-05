private ["_first","_wpParms","_speed","_behaviour","_combatmode","_completionRadius","_formation","_timeoutMin","_timeoutMid","_timeoutMax","_px","_py","_routeType","_waypoints","_angle","_wppos","_wp","_wpType","_xx","_yy","_wpPosType","_locationPos","_locationRadius","_aiGroup","_static","_missionObject","_m","_routesData","_routes","_route","_parms"];
	
	_missionObject		= _this select 0; 
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort adding waypoints creation" call ZEVLog;
	};
	
	_aiGroup			= _this select 1;
	_routesData			= _this select 2;
	
	format ["_routesData = %1",_routesData] call ZEVLog;
	_routes				= _routesData select 2;
	format ["_routes = %1",_routes] call ZEVLog;
	_route				= _routes call BIS_fnc_selectRandom;
	if (typeName _route != "ARRAY") exitWith { format["%1 no have routes ", _aiGroup] call ZEVLog;};
	_waypoints			= _route select 2;
	_parms 				= [_route select 1, [ZEVRouteType]] call ZEVGetProperty;
	_routeType 			= _parms select 0;
	_static				= _missionObject getVariable ZEVStatic;
	_locationPos  		= _missionObject getVariable ZEVLocationPos;
	_locationRadius		= _missionObject getVariable ZEVSpawnRadius;
	
	
	format["add waypoints for %1", _aiGroup] call ZEVLog;
	format["waypoints for %1", _waypoints] call ZEVLog;
	
	if (_routeType == ZEVRandom) then
	{
		for [{ x=1 },{ x <= ZEVRandomWPCnt },{ x = x + 1; }] do 
		{
			_angle	= x / ZEVRandomWPCnt * 360;
			_xx		= (_locationPos select 0) + (_locationRadius * cos _angle);
			_yy		= (_locationPos select 1) + (_locationRadius * sin _angle);
			_wppos 	= [_xx,_yy, 0];
			_wp = _aiGroup addWaypoint [_wppos, 5];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointCombatMode "YELLOW";
			_wp setWaypointTimeout [0.01,0.01,0.01];
			sleep ZEVSleepSmall;
		};
		_angle	= 0;
		_xx		= (_locationPos select 0) +(_locationRadius * cos _angle);
		_yy		= (_locationPos select 1) +(_locationRadius * sin _angle);
		_wppos 	= [_xx,_yy, 0];
		_wp = _aiGroup addWaypoint [_wppos, 5];
		_wp setWaypointType "CYCLE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointCombatMode "YELLOW";
		_wp setWaypointTimeout [0.01,0.01,0.01];
	}
	else
	{
		if (count _waypoints > 0) then
		{
			
			_first = _waypoints select 0;
			if (typeName _first == "ARRAY") then
			{
				{
					_wpParms    = _x select 1;
					
					_wpPos		= [_wpParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
					
					_parms		= [ZEVWaypointType,ZEVPositionType,ZEVSpeed,ZEVBehaviour,ZEVCombatMode,ZEVCompletionRadius,ZEVFormation,ZEVTimeoutMin,ZEVTimeoutMid,ZEVTimeoutMax];
					_parms 		= [_wpParms, _parms] call ZEVGetProperty;

					_wpType		= _parms select 0;
					_wpPosType 	= _parms select 1;
					_speed		= _parms select 2;
					_behaviour	= _parms select 3;
					_combatmode	= _parms select 4;
					_completionRadius = _parms select 5;
					_formation	= _parms select 6;
					_timeoutMin = _parms select 7;
					_timeoutMid = _parms select 8;
					_timeoutMax = _parms select 9;
					
					_px			= (_wpPos select 0) + (_locationPos select 0);
					_py			= (_wpPos select 1) + (_locationPos select 1);
					
					format["add waypoint for %1: %2, %3, %4", _aiGroup,_wpPosType,_wpPos,_wpType] call ZEVLog;
					
					_wpPos = [_px, _py, 0];
					
					_wp = _aiGroup addWaypoint [_wppos, 3];
					_wp setWaypointPosition [_wppos, 3];
					_wp setWaypointType _wpType;
					_wp setWaypointSpeed _speed;
					_wp setWaypointBehaviour _behaviour;
					_wp setWaypointCombatMode _combatmode;
					_wp setWaypointCompletionRadius _completionRadius;
					_wp setWaypointFormation _formation;
					_wp setWaypointTimeout [_timeoutMin,_timeoutMid,_timeoutMax];
					
					format["waypoint added: %1, %2, %3, %4", _aiGroup,_wpPosType,_wpPos,waypointType _wp] call ZEVLog;
					
					if (ZEVMissionDebug > 0) then 
					{
						_wppos = waypointPosition _wp;
						_m = createMarker [format ["m_%1_%2",_wppos, time],_wppos];
						_m setMarkerShape "ICON";
						_m setMarkerType "mil_dot";
					};
					sleep ZEVSleepSmall;
				
				} foreach _waypoints;
			};
		};
	};
	
