_this addEventHandler ["GetIn", 
{ 
	private ["_v","_u"]; 
	_v = _this select 0; 
	_u = _this select 2; 
	format ["vehicle %1 captured (getin)", _v] call ZEVLog;
	if (isPlayer _u && (_u getVariable [ZEVIndex, -1] >= 0)) then 
	{
		_v setVariable ["ZEVVehicleCaptured", true, true];
	};
}];
_this spawn 
{
	private ["_playerInRange"];
	_playerInRange = false;
	while { (!_playerInRange) && (alive _this)} do
	{
		_playerInRange	= [getPos _this, 6] call ZEVIsPlayerInRange;
		if (_playerInRange) then
		{
			format ["vehicle %1 captured by InRange",_this] call ZEVLog;
			_this setVariable ["ZEVVehicleCaptured", true, true];
		};
		sleep 10;
	};
};