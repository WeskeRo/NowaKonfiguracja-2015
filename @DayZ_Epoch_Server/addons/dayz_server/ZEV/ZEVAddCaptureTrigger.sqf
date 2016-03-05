_this addEventHandler ["GetIn", {
	private ["_missionObject","_v"];
	format ["GetIn %1",_this] call ZEVLog;
	_v = _this select 0;
	_missionObject = _v getVariable ZEVObject;
	if (!isNull _missionObject) then
	{
		_missionObject setVariable [ZEVMissionDone, true, true];
	};
}];
_this spawn 
{
	private ["_playerInRange","_missionObject"];
	_missionObject = _this getVariable ZEVObject;
	if (isNull _missionObject) exitWith {};
	_playerInRange = false;
	while { (!_playerInRange) && (alive _this)} do
	{
		_playerInRange	= [getPos _this, 6] call ZEVIsPlayerInRange;
		if (_playerInRange) then
		{
			format ["vehicle %1 captured by InRange",_this] call ZEVLog;
			_missionObject setVariable [ZEVMissionDone, true, true];
		};
		sleep 10;
	};
};