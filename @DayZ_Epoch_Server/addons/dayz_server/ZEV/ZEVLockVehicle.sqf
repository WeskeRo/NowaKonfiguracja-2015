switch (ZEVMod) do
{
	case "DUMMY": 
	{
		sleep 0.01;
	};
#ifdef ZEVARMA2
	case "ARMA2EPOCH":
	{
		_this call ZEVLockVehicle_ARMA2EPOCH;
	};
#endif	
#ifdef ZEVARMA3	
	case "ARMA3EPOCH":
	{
		_this call ZEVLockVehicle_ARMA3EPOCH;
	};
	case "ARMA3EXILE":
	{
		_this call ZEVLockVehicle_ARMA3EXILE;
	};
#endif	
	default { "NO SERVER OBJECT MONITOR FOUND!!!" call ZEVLog; };
};
