switch (ZEVMod) do
{
	case "ARMA2DAYZ":
	{
		[nil,nil,rTitleText,_this, "PLAIN",10] call RE;
	};
	case "ARMA2EPOCH":
	{
		[nil,nil,rTitleText,_this, "PLAIN",10] call RE;
	};
/*	
	case "ARMA3EPOCH":
	{
		_this remoteExecCall ["hint", 0];
	};
	case "ARMA3EXILE":
	{
		_this remoteExecCall ["hint", 0];
	};
*/	
	default { "NOT supported mod!!!" call ZEVLog; };
};
