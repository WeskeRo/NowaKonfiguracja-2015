private ["_missionIndex","_static","_mine","_vehicleList","_missionObject","_mine_pos"];

_missionObject 	= _this select 0;
_mine_pos		= _this select 1;

_missionIndex	= _missionObject getVariable ZEVIndex;
_static			= _missionObject getVariable ZEVStatic;

_mine = createVehicle ["ATMine_Range_Ammo", _mine_pos, [], 0, "CAN_COLLIDE"];
_mine call ZEVAddToObjectMonitor;
_mine setVariable ["ZEVBuilding", "Yes"];
_vehicleList = [_missionIndex, _static] call ZEVGetVehicleList;
_vehicleList set [count _vehicleList, _mine]; 
[_missionIndex, _static, _vehicleList] call ZEVSetVehicleList;

