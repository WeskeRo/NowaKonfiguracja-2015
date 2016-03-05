switch (ZEVMod) do
{
	case "DUMMY":
	{
		sleep 0.001;
	};
	case "ARMA2EPOCH":
	{
		_this call ZEVAddToObjectMonitor_ARMA2EPOCH;
	};
	case "ARMA2DAYZ":
	{
		_this call ZEVAddToObjectMonitor_ARMA2DAYZ;	
	};
/*	
	case "ARMA3EPOCH":
	{
		_this call ZEVAddToObjectMonitor_ARMA3EPOCH;	
	};
	case "ARMA3EXILE":
	{
		_this call ZEVAddToObjectMonitor_ARMA3EXILE;	
	};
*/	
	default { "NO SERVER OBJECT MONITOR FOUND!!!" call ZEVLog; };
};
