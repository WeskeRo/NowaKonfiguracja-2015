switch (ZEVMod) do
{
	case "DUMMY":
	{
		sleep 0.001;
	};
	case "ARMA2EPOCH":
	{
		_this call ZEVAddMine_ARMA2EPOCH;
	};
/*
	case "ARMA3EPOCH":
	{
		_this call ZEVAddMine_ARMA3EPOCH;
	};
	case "ARMA3EXILE":
	{
		_this call ZEVAddMine_ARMA3EXILE;
	};
*/
	default { "NOT Supported mod!!!" call ZEVLog; };
};
