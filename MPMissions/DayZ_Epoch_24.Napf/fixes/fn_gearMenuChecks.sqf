private ["_cTarget","_isOk","_display","_inVehicle","_isUnconscious"];
disableSerialization;
_display = (_this select 0);
_inVehicle = (vehicle player) != player;
_cTarget = cursorTarget;
_isUnconscious = player getVariable ["NORRN_unconscious",false];

if (_isUnconscious) exitWith {
	if (alive player) then {
		if (isPlayer player && _isUnconscious) then {
			_display closeDisplay 1;
			systemChat ( "You are unconscious." );
			player setVariable["combattimeout", time + 10, true];
			player setVariable["startcombattimer", 0];
			dayz_combat = 1;
		};
	};
};

if(_inVehicle) then {
	_cTarget = (vehicle player);
};

_isOk = false;
{
	if(!_isOk) then {
		_isOk = _cTarget isKindOf _x;
	};
} count ["LandVehicle","Air", "Ship"];

if((locked _cTarget) && _isOk && (((vehicle player) distance _cTarget) < 12)) then {
	cutText [(localize "str_epoch_player_7") , "PLAIN DOWN"];
	_display closeDisplay 1;
};

//Thief backpack block
if (inSafeZone and _cTarget isKindOf "Man" and alive _cTarget and (((vehicle player) distance _cTarget) < 12)) then {
	cutText ["Cannot access other players gear in the safezone." , "PLAIN DOWN"];
	_display closeDisplay 1;
};
