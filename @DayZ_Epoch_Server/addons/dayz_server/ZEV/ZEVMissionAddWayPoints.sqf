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
"_routeType","_waypointQty","_waypoints","_angle","_wppos","_wp","_wpType","_wpRadius", "_xx", "_yy","_wpPosType",
"_missionIndex","_missionParms","_locationPos","_locationRadius","_aiGroup","_static"];
	
	_aiGroup			= _this select 0;
	_routeData			= _this select 1;
	_missionIndex 		= _this select 2;

	_routeType			= _routeData select 0;
	_waypointQty		= _routeData select 1;
	_waypoints			= _routeData select 2;

	_static				= _aiGroup getVariable "ZEVMissionStatic";
	_missionParms 		= [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;
	_locationPos  		= _missionParms select 0;
	_locationRadius		= _missionParms select 1;
	
	if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission: missionParms= %1", _missionParms];};
	if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission: add waypoints for %1", _aiGroup];};
	if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission: waypoints for %1", _waypoints];};
	if(_routeType == "Random")then
	{
		for [{ x=1 },{ x < ZEVRandomWPCnt },{ x = x + 1; }] do 
		{
			_angle	= x / ZEVRandomWPCnt * 360;
			_xx		= (_locationPos select 0) +(_locationRadius * cos _angle);
			_yy		= (_locationPos select 1) +(_locationRadius * sin _angle);
			_wppos 	= [_xx,_yy, 0];
			_wp = _aiGroup addWaypoint [_wppos, 5];
			_wp setWaypointType "MOVE";
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointCombatMode "YELLOW";
			_wp setWaypointTimeout [0.01,0.02,0.03];
			sleep 0.1;
		};
		_angle	= 360;
		_xx		= (_locationPos select 0) +(_locationRadius * cos _angle);
		_yy		= (_locationPos select 1) +(_locationRadius * sin _angle);
		_wppos 	= [_xx,_yy, 0];
		_wp = _aiGroup addWaypoint [_wppos, 5];
		_wp setWaypointType "CYCLE";
		_wp setWaypointBehaviour "SAFE";
		_wp setWaypointCombatMode "YELLOW";
		_wp setWaypointTimeout [0.01,0.02,0.03];
	}
	else
	{
		if(_waypointQty > 0) then
		{
			private ["_speed","_behaviour","_combatmode","_completionRadius","_formation","_timeoutMin","_timeoutMid","_timeoutMax","_px","_py"];
			{
				_wpType		= _x select 0;
				_wpPosType 	= _x select 1;
				_wpPos		= _x select 2;
				
                _speed		= _x select 3;
                _behaviour	= _x select 4;
                _combatmode	= _x select 5;
                _completionRadius = _x select 6;
                _formation	= _x select 7;
                _timeoutMin = _x select 8;
                _timeoutMid = _x select 9;
                _timeoutMax = _x select 10;
				_px			= (_wpPos select 0) + (_locationPos select 0);
				_py			= (_wpPos select 1) + (_locationPos select 1);
				
				if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission: Editor: add waypoint for %1: %2, %3, %4", _aiGroup,_wpPosType,_wpPos,_wpType];};
				
				_wpPos = [_px, _py, 0];
				
				if(ZEVMissionDebug > 1) then { diag_log format["ZEVMission: add waypoint for %1: %2, %3, %4", _aiGroup,_wpPosType,_wpPos,_wpType]; };
				
				if(_wpPosType == "Random") then
				{
					_angle	= random(360);
					_wpRadius	= random(_locationRadius);
					_xx = (_locationPos select 0) + (_wpRadius * (cos _angle));
					_yy = (_locationPos select 1) + (_wpRadius * (sin _angle));
					_wpPos = [_xx,_yy, 0];
				};
				_wp = _aiGroup addWaypoint [_wppos, 3];
				_wp setWaypointPosition [_wppos, 3];
				_wp setWaypointType _wpType;
				_wp setWaypointSpeed _speed;
				_wp setWaypointBehaviour _behaviour;
				_wp setWaypointCombatMode _combatmode;
				_wp setWaypointCompletionRadius _completionRadius;
				_wp setWaypointFormation _formation;
				_wp setWaypointTimeout [_timeoutMin,_timeoutMid,_timeoutMax];
				
				if(ZEVMissionDebug > 0) then { diag_log format["ZEVMission: waypoint added: %1, %2, %3, %4", _aiGroup,_wpPosType,_wpPos,waypointType _wp]; };
				
				if(ZEVMissionDebug > 0) then 
				{
					_wppos = waypointPosition _wp;
					_m = createMarker [format ["m_%1_%2",_wppos, time],_wppos];
					_m setMarkerShape "ICON";
					_m setMarkerType "mil_dot";
				};
				sleep 0.1;
			
			}foreach _waypoints;
		};
	};
	
