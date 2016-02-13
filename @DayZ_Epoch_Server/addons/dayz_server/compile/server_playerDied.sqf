private ["_characterID","_minutes","_newObject","_playerID","_infected","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_key","_death_record"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =		_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_infected =		_this select 4;
if (((count _this) >= 6) && {(typeName (_this select 5)) == "STRING"} && {(_this select 5) != ""}) then {
	_victimName =	_this select 5;
} else {
	_victimName =  if (alive _newObject) then {name _newObject;} else {"";};
};
_victim = _newObject;
_newObject setVariable ["bodyName", _victimName, true];

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];
_lastHit = _victim getVariable["LastHit",0];

// when a zombie kills a player _killer, _killerName && _weapon will be "nil"
// we can use this to determine a zombie kill && send a customized message for that. right now no killmsg means it was a zombie.

if ((time - _lastHit) < 30) then {
	if ((typeName _killer) != "STRING") then {
		_weapon = _victim getVariable["AttackedByWeapon", "nil"];
		_distance = _victim getVariable["AttackedFromDistance", "nil"];

		if ((owner _victim) == (owner _killer)) then {
			_message = format["%1 killed themselves!",_victimName];
			_loc_message = format["PDEATH: %1 killed themselves!", _victimName];
		} else {
			if (side _killer == EAST) then {
				_message = format["%1 was killed by %2 (AI) with weapon %3 from %4m",_victimName, _killerName, _weapon, _distance];
				_loc_message = format["AI Kill: %1 was killed by %2 (AI) with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
			} else {
				_message = format["%1 was killed by %2 with weapon %3 from %4m",_victimName, _killerName, _weapon, _distance];
				_loc_message = format["PVP Event: %1 was killed by %2 with weapon %3 from %4m", _victimName, _killerName, _weapon, _distance];
			};
		};

		// build array to store death messages to allow viewing at message board in trader citys.
		_death_record = [
			_victimName,
			_killerName,
			_weapon,
			_distance,
			ServerCurrentTime
		];
		PlayerDeaths set [count PlayerDeaths,_death_record];

		if(DZE_DeathMsgGlobal) then { [nil, nil, rspawn, [_killer, _message], { (_this select 0) globalChat (_this select 1) }] call RE; };
		if(DZE_DeathMsgSide) then { [nil, nil, rspawn, [_killer, _message], { (_this select 0) sideChat (_this select 1) }] call RE; };
		if(DZE_DeathMsgTitleText) then { [nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE; };
	};
} else {
	_message = format["%1 died of natural causes!",_victimName];
	_loc_message = format["Accidental Death: %1 died of natural causes!", _victimName];

	if(DZE_DeathMsgGlobal) then { [nil, nil, rspawn, [_victim, _message], { (_this select 0) globalChat (_this select 1) }] call RE; };
	if(DZE_DeathMsgSide) then { [nil, nil, rspawn, [_victim, _message], { (_this select 0) sideChat (_this select 1) }] call RE; };
	if(DZE_DeathMsgTitleText) then { [nil,nil,"per",rTITLETEXT,_message,"PLAIN DOWN"] call RE; };
};

// Cleanup
_victim setVariable["AttackedBy", "nil", true];
_victim setVariable["AttackedByName", "nil", true];
_victim setVariable["AttackedByWeapon", "nil", true];
_victim setVariable["AttackedFromDistance", "nil", true];
_victim setVariable["LastHit", "nil", true];

diag_log _loc_message;

_newObject setVariable["processedDeath",diag_tickTime];

if (typeName _minutes == "STRING") then
{
	_minutes = parseNumber _minutes;
};

if (_characterID != "0") then
{
	_key = format["CHILD:202:%1:%2:%3:",_characterID,_minutes,_infected];
	#ifdef DZE_SERVER_DEBUG_HIVE
	diag_log ("HIVE: WRITE: "+ str(_key));
	#endif
	_key call server_hiveWrite;
}
else
{
	deleteVehicle _newObject;
};