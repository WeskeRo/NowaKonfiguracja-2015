private ["_victim", "_attacker","_weapon","_distance","_damage","_pvp"];
_victim = _this select 0;
_attacker = _this select 1;
_damage = _this select 2;
_pvp = true;

if (!isPlayer _victim) exitWith {};

if (side _attacker == EAST) then { _pvp = false; };

if ((owner _victim) == (owner _attacker)) then {
	_attacker = _victim;
	_pvp = false;
};

_weapon = weaponState _attacker;
if (!isNil "_weapon") then {
	if (_weapon select 0 == "Throw") then {
		_weapon = _weapon select 3;
	} else {
		_weapon = _weapon select 0;
	};
} else {
	_weapon = "Unknown";
};

_vehicle = typeOf (vehicle _attacker); 
if ((getText (configFile >> "CfgVehicles" >> _vehicle >> "vehicleClass")) in ["CarW","Car","CarD","Armored","Ship","Support","Air","ArmouredW","ArmouredD","SupportWoodland_ACR"]) then {
	_weapon = getText (configFile >> "CfgVehicles" >> _vehicle >> "displayName");
};

_distance = _victim distance _attacker;

if (_pvp) then { diag_log format["PVP Attack: %1 was hit by %2 with %3 from %4m with %5 dmg", _victim, _attacker, _weapon, _distance, _damage]; };

_victim setVariable["AttackedBy", _attacker, true];
_victim setVariable["AttackedByName", (name _attacker), true];
_victim setVariable["AttackedByWeapon", _weapon, true];
_victim setVariable["AttackedFromDistance", _distance, true];
_victim setVariable["LastHit", time, true];