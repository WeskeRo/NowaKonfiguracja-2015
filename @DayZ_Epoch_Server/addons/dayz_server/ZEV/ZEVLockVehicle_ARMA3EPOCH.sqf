private ["_vehicle","_lock"];
_vehicle = _this select 0;
_lock	 = _this select 1;
/*
if (local _vehicle) then 
{
	_vehicle lock _lock;
} 
else 
{
	if (_lock) then 
	{
		[["lockVehicle", _vehicle], (owner _vehicle)] call EPOCH_sendPublicVariableClient;
		_object enableRopeAttach false;
	} 
	else 
	{
		[["unlockVehicle", _vehicle], (owner _vehicle)] call EPOCH_sendPublicVariableClient;
		_object enableRopeAttach true;
	};
};
*/