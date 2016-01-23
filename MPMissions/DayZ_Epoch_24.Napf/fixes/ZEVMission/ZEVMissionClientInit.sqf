if(!isServer) then
{
	"ZEVMissionHint" addPublicVariableEventHandler 
	{
		_message = _this select 1;
		hint parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Attention!</t><br/><img size='4.75' image='fixes\GUI\treasure_hunt\Mission_ICON.paa'/><br/> <t align='center' color='#5FAB13' size='1.25'>%1</t><br/> <t align='center' color='#ffffff' size='1.00'>%2</t>", _message select 1,_message select 0];
		playSound "ZEVMissionMoney1";
	};
	"ZEVMissionHintRed" addPublicVariableEventHandler 
	{
	_message = _this select 1;
		hint parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Attention!</t><br/><img size='4.75' image='fixes\GUI\treasure_hunt\Mission_ICON.paa'/><br/> <t align='center' color='#FF0000' size='1.25'>%1</t><br/> <t align='center' color='#ffffff' size='1.00'>%2</t>", _message select 1,_message select 0];
	};
	"ZEVMissionPlaySound" addPublicVariableEventHandler 
	{
		playSound (_this select 1);
	};
	
};