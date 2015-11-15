if (UKmonitor_closed) then {
	UKmonitor_closed = false;
	get_progressive_pot = [];
	if (isNil "UK111_PAY") then { UK111_PAY = "Unemployed"; };
	PublicVariableServer "get_progressive_pot";
	waitUntil {!isNil "show_progressive"};
	_pot = [show_progressive select 0] call BIS_fnc_numberText;
	_wanted = (show_progressive select 1) select 0;
	_bounty = [(show_progressive select 1) select 1] call BIS_fnc_numberText;
	_maintained = profileNamespace getVariable["UKmaintained","Unknown"];
	_humanity = player getVariable['humanity',0];
	if ((_humanity > 999999) || (_humanity < -999999)) then { _humanity = format["%1k",_humanity/1000]; };

	hintSilent parseText format["		
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Survived:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%1 Days</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Zombies Killed:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%2</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Humanity:</t>
		<t size='1.15' font='Zeppelin32' align='right' color='#007ab7'>%3</t>
		<br/>	
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Map Grid:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%4</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Blood:</t>
		<t size='1.15' font='Zeppelin32' align='right' color='#c3211d'>%5</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Coins in Bank:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%6</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Players in game:</t>
		<t size='1.15' font='Zeppelin32' align='right' color='#c3211d'>%7/50</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Next Restart:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%8 mins</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Progressive Pot:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%9</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Paycheck:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%10</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Wanted:</t>
		<t size='1.15' font='Zeppelin32' align='right'>%11 / %12</t>
		<br/>
		<t size='1.15' font='Zeppelin32' align='left' color='#b06f27'>Maintained:</t>
		<t size='1.15' font='Zeppelin32' align='right' color='#c3211d'>%13</t>
		",
		(dayz_Survived),
		(player getVariable['zombieKills',0]),
		_humanity,		
		(mapGridPosition getPos player),
		r_player_blood,
		[player getVariable["UK111bank",0]] call BIS_fnc_numberText,
		(count playableUnits),
		119-(round(serverTime/60)),
		_pot,
		UK111_PAY,
		_wanted,
		_bounty,
		_maintained
	];
	uiSleep 10;
	get_progressive_pot = nil;
	UKmonitor_closed = true;
} else {
	titleText ["Wait max 10 seconds!","PLAIN"];
};