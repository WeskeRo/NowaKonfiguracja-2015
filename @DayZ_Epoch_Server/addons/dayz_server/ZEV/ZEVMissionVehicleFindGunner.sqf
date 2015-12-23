private ["_veh", "_static", "_missionIndex","_ZEVMissionInProgress","_missionRunStatus","_vehList","_found","_gunner"];

_veh 					= _this select 0;
_static					= _this select 1;
_missionIndex			= _this select 2;

_ZEVMissionInProgress 	= [_static] call ZEVMissionGetMissionInProgress; 
_missionRunStatus 	  	= _ZEVMissionInProgress select _missionIndex;
_found 					= false;
_gunner 				= objNull;
while {_missionRunStatus > 0} do 
{
	_gunner = gunner _veh;
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  _veh=%1, _gunner=%2", _veh ,_gunner]; };
	if (isNull _gunner) then
	{
		_found = false;
		_vehList = (position _veh) nearObjects ["Man", 50]; 
		{
			_gunner = _x;
			if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  _veh=%1,  near man =%2", _veh ,_gunner]; };
			
			if ((!_found) and (alive _gunner) and (_gunner getVariable ["ZEVMissionIndex", 0] == _missionIndex)) then
			{
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  try to move man(%1) to _veh=%2", _gunner, _veh]; };
				_gunner join grpNull;
				while { ( alive _gunner) and (_gunner distance _veh > 3)} do
				{
					if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  moving man(%1) to _veh=%2 (distance= %3)", _gunner, _veh, _gunner distance _veh]; };
					_gunner doMove (position _veh);
					sleep 1;
				};
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  movingToGunner man(%1) to _veh=%2", _gunner, _veh]; };
				if( alive _gunner) then
				{
					if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  movedToGunner man(%1) to _veh=%2", _gunner, _veh]; };
					_veh setDamage 0;
					
					_gunner assignAsGunner _veh;
					//[_gunner] orderGetIn true;
					_gunner moveInGunner _veh;
					_found = true;
					if(ZEVMissionDebug > 0) then {diag_log format["ZEVMissionFindGunnert:  _veh=%1,  _gunner =%2 was assigned", _veh ,_gunner]; };
				};
			};
			sleep 0.1;
		} foreach _vehList;
		
	};

	sleep 15;
	_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress; 
	_missionRunStatus 	  = _ZEVMissionInProgress select _missionIndex;
};

//	sleep 600;
//	deleteVehicle _veh;
