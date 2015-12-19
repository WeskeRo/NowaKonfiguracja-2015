_halo = uiNamespace getVariable "haloChoice";
deleteVehicle _holder;
_finalSpawnPos = _debug;
if (!isNil "_grid") then {_finalSpawnPos = _grid;};
preloadCamera _finalSpawnPos;

if (_halo > 0) then {
	if (isNil "_haloType") then {	
		player setPosATL [(_finalSpawnPos select 0),(_finalSpawnPos select 1),_haloHeight];
		[player,_haloHeight] spawn BIS_fnc_halo;
	} else {
		_finalSpawnPos call _haloDrop;
	};
} else {
	player setPosATL _finalSpawnPos;
};

player hideObject false;
enableEnvironment true;
0 fadeSound 1;
cutText ["","BLACK IN"];

if (!isNil "_haloDrop") then {
	while {(getPos player) select 2 > _autoOpenHeight} do {
		player allowDamage false;
		if ((isNil "_haloType") || {!((vehicle player) isKindOf _haloType)}) then {
			titleText [format[localize "str_halo_altitude_speed",str (round((getPos player) select 2))+" m",str (abs(round(speed(vehicle player))))+" km/h"],"PLAIN DOWN",.1];
		};
		uiSleep .1;
	};
	if ((((getPos player) select 2) > (_autoOpenHeight - 100)) && {isNil "bis_fnc_halo_para_dirAbs"}) then {[player] spawn BIS_fnc_Halo;};
	DZE_HaloJump = _haloJump;
	player allowDamage true;
};