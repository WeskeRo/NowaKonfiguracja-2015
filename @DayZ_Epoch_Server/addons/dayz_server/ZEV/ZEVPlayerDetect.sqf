while {alive _this} do
{
	{
		if ((isPlayer _x) && ((_this distance _x) < ZEVMissionAIPlayerDetect)) then
		{
			_this reveal [_x, 4];
		};
	} foreach playableUnits;
	sleep 10;
};
