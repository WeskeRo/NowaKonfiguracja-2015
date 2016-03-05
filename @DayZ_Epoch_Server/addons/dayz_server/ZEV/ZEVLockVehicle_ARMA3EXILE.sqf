private ["_object","_lock"];
_object = _this select 0;
_lock	 = _this select 1;
/*
if!(_lock)then
{
	if(isNumber(configFile >> "CfgVehicles" >> _type >> "exileIsLockable"))then
	{
		_object setVariable ["ExileIsLocked",0,true];
	}
	else
	{
		if(local _object)then
		{
			_object lock 0;
		}
		else
		{
			[owner _object,"LockVehicleRequest",[netId _object,false]] call ExileServer_system_network_send_to;
		};
		_object setVariable ["ExileIsLocked",0];
	};
	_object enableRopeAttach true;
}
else
{
	if(isNumber(configFile >> "CfgVehicles" >> _type >> "exileIsLockable"))then
	{
		_object setVariable ["ExileIsLocked",-1,true];
	}
	else
	{
		if(local _object)then
		{
			_object lock 2;
		}
		else
		{
			[owner _object,"LockVehicleRequest",[netId _object,true]] call ExileServer_system_network_send_to;
		};
		_object setVariable ["ExileIsLocked",-1];
	};
	_object enableRopeAttach false;
};
_object setVariable ["ExileLastLockToggleAt", time];
_object setVariable ["ExileAccessDenied", false];
_object setVariable ["ExileAccessDeniedExpiresAt", 0];		
_object call ExileServer_system_vehicleSaveQueue_addVehicle;
*/