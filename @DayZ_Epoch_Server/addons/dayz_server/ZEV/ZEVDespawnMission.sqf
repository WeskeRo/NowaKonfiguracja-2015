private ["_groups","_missionEndReason","_unitMissionIndex","_unitMissionStatic","_vehicle","_vehiclePermanent","_missionObject","_index","_static","_vehicleList","_bool","_ailist","_ai"];
_missionObject 	= _this;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort despawnmission" call ZEVLog;
};

_index			= _missionObject getVariable ZEVIndex;
_static			= _missionObject getVariable ZEVStatic;
_missionEndReason = _missionObject getVariable ZEVMissionEndReason;
format ["Despawn mission: %1, index=%2, _static=%3", _missionObject, _index, _static] call ZEVLog;

_vehicleList = [_index, _static] call ZEVGetVehicleList;
format ["Despawn _vehicleList=%1", _vehicleList] call ZEVLog;
{
	if (!isNull _x) then
	{
		_vehicle = _x;
		format ["ZEVDespawnMission(Static = %2):  analyzing vehicle %1 to delete...", _vehicle,_static] call ZEVLog;
		
		_vehiclePermanent = _vehicle getVariable ["ZEVPermanent", "No"];
		
		format ["ZEVDespawnMission(Static = %2):  _vehiclePermanent = %1", _vehiclePermanent, _static] call ZEVLog;
		_bool = false;
		_bool = _vehicle getVariable ["ZEVVehicleCaptured", false];
        if ((_vehiclePermanent == ZEVYES) && (_bool)) then
		{
			format["ZEVMission - ZEVMissionMonitor(Static = %2):  save vehicle to database", _vehiclePermanent, _static] call ZEVLog;
			[_vehicle] call ZEVSaveToHive;
		}
		else
		{
			if ((_missionEndReason == ZEV_TIMEOUT) || (_vehicle getVariable ["ZEVBuilding", "No"] == ZEVYES)) then
			{
				format["ZEVMission - ZEVMissionMonitor(Static = %2):  delete vehicle ...%1", _vehicle, _static] call ZEVLog;
				deleteVehicle _vehicle;
			}
			else
			{
				//если машинка и не сохраняем в базу то
				// удаляем если рядом(в радиусе 100м) нет игроков
				format ["ZEVMonitor(Static = %2):  analyzing is player in 100 m range", _vehiclePermanent,_static] call ZEVLog; 
				_bool = false;
                _bool = _vehicle getVariable ["ZEVVehicleCaptured", false];
				if (!_bool) then
				{
					_vehicle spawn 
					{
						private "_b";
						_b = false;
						waitUntil {
							sleep 30; 
							_b = _this getVariable ["ZEVVehicleCaptured", false];
							({(isPlayer _x) && (_x distance _this < 100)} count allUnits) < 1
							};
						if (!_b) then
						{
							deleteVehicle _this;
						};
					};
				}
				else
				{
					if (_vehicle isKindOf "ReammoBox") then 
					{
						_vehicle spawn 
						{
							sleep ZEVMissionFinishedMissionCleanupDelay;
							deleteVehicle _this;
						};
					};
				};
			};
		};
	};
	sleep ZEVSleepSmall;
} foreach _vehicleList;


_groups = [];
_groups = _missionObject getVariable [ZEVGroupList, []];	
{
	if((!isNull _x) && (_x != grpNull)) then
	{
		_x setVariable [ZEVIndex, -1, true];
	};
} foreach _groups;
format ["Despawn AI units..."] call ZEVLog;
_ailist   = [];
_ailist   = _missionObject getVariable ["ZEVAIList", []];
format ["Despawn _ailist =%1", _ailist] call ZEVLog;
{
	_ai = _x;
	format ["Despawn test unit =%1", _x] call ZEVLog;
	if (!isNil "_ai" && alive _ai) then 
	{
		format ["Despawn delete unit =%1", _x] call ZEVLog;
		_x setDamage 1;
		sleep 0.5;
		deleteVehicle _x;
		sleep ZEVSleepSmall;
	};	
} foreach _ailist;

deleteVehicle _missionObject;
