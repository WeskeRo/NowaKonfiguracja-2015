private ["_missionIndex","_static","_mine","_vehicleList","_missionObject","_mine_pos"];

_missionObject 	= _this select 0;
_mine_pos		= _this select 1;

_missionIndex	= _missionObject getVariable ZEVIndex;
_static			= _missionObject getVariable ZEVStatic;

_mine = createVehicle ["Mine", _mine_pos, [], 0, "CAN_COLLIDE"];
_mine call ZEVAddToObjectMonitor;
_mine setVariable ["ZEVBuilding", "Yes"];
_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
_vehicleList set [count _vehicleList, _mine]; 
[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;

_mine spawn {
	private ["_vehicle_near","_bomb"];
	waitUntil
	{
		sleep ZEVSleepSmall;
		_vehicle_near = false;
		{
			if ((isPlayer _x) && (vehicle _x != _x) && (vehicle _x distance _this < 4)) then 
			
			{
				_vehicle_near = true;
			};
		} foreach playableUnits;
		(_vehicle_near)
	};
	_bomb = "Bo_GBU12_lgb" createVehicle (getPosATL _this);
	sleep 3;
	deleteVehicle _bomb;
	deleteVehicle _this;
};			