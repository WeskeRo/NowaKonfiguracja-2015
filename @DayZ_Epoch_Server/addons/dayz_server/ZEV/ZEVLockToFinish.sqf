private ["_vehicle","_mObj","_wait"];
_vehicle = _this;
_mObj    = _vehicle getVariable ZEVObject;
_vehicle setVehicleLock "LOCKEDPLAYER";
_wait = true;
while {(!isNull _mObj) && (!isNull _vehicle) && _wait} do
{
	sleep 15;
	_wait = _mObj getVariable [ZEVMissionDone, false];
}; 
if(!isNull _vehicle) then
{
	_vehicle setVehicleLock "UNLOCKED";
};
