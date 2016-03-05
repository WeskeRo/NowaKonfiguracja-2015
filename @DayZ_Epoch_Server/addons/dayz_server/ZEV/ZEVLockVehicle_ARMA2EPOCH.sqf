private ["_vehicle","_lock"];
_vehicle = _this select 0;
_lock	 = _this select 1;	
PVDZE_veh_Lock = [_vehicle, _lock];				
if (local _vehicle) then 
{
	PVDZE_veh_Lock spawn local_lockUnlock;
} 
else 
{
	publicVariable "PVDZE_veh_Lock";
};
