private "_name";
//Let Zeds know
[player,4,true,(getPosATL player)] spawn player_alertZombies;

//display gui (temp hint)
_name = if (alive player) then {name player;} else {"Dead Player";};
	hintSilent parseText format ["
	<t size='1.4' font='Bitstream' align='center' color='#C70000'>RVL NAPF</t><br/>
	<t size='1.15' font='Bitstream' align='center' color='#DDDDDD'>%9 Players Online</t><br/>
	<t size='1.25' font='Bitstream' color='#5882FA'>%1</t><br/>
	<t size='1.15' font='Bitstream' align='left'>DayZ Survived: </t><t size='1.15' font='Bitstream' align='right'>%7</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Zombies Killed: </t><t size='1.15' font='Bitstream' align='right'>%2</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Headshots: </t><t size='1.15' font='Bitstream' align='right'>%3</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Murders: </t><t size='1.15' font='Bitstream' align='right'>%4</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Bandits Killed: </t><t size='1.15' font='Bitstream' align='right'>%5</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left'>Cash: </t><t size='1.15' font='Bitstream' align='right'>%11</t><br/>
	<t size='1.15' font='Bitstream' align='left'>Bank: </t><t size='1.15' font='Bitstream' align='right'>%12</t><br/><br/>
	<t size='1.15' font='Bitstream' align='left'>Humanity: </t><t size='1.15' font='Bitstream' align='right'>%6</t><br/>
	<t size='1.15' font='Bitstream' align='left' color='#C70000'>Blood: </t><t size='1.15' font='Bitstream' align='right' color='#C70000'>%8</t><br/><br/>
	<t size='1' font='Bitstream' align='center' color='#16DB57'>Restart in %10 minutes</t><br/><br/>
	<t size='0.9' font='Bitstream' align='center' color='#DDDDDD'>TS: revolution-ukbb.pl:1029</t><br/>",
	(name player),
	(player getVariable['zombieKills', 0]),
	(player getVariable['headShots', 0]),
	(player getVariable['humanKills', 0]),
	(player getVariable['banditKills', 0]),
	(player getVariable['humanity', 0]),
	(dayz_Survived),
	(r_player_blood),
	(count playableUnits),
	(240-(round(serverTime/60))),
	(player getVariable['cashMoney', 0]),//11
	(player getVariable['bankMoney', 0])//12
	];
