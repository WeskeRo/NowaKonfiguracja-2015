private ["_vehicle","_status"];
_vehicle = _this select 0;
_status = _this select 1;

if (local _vehicle) then {
	if (_status) then {
		_vehicle setVehicleLock "LOCKED";
	} else {
		_vehicle setVehicleLock "UNLOCKED";
	};
	player action ["lightOn", _vehicle];
	[nil, _vehicle, rSAY, "lock", 20] call RE;
	sleep 0.5;
	player action ["lightOff", _vehicle];
};
