if (_this isKindOf "Air") then
{
	_this spawn ZEVDetectPlayers;
};
if (_this isKindOf "Car") then
{
	_this spawn ZEVAutoRepair;
};
