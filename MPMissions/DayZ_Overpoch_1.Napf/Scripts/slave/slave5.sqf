//Spawn bodyguard -Sukkaed
private ["_guardCnt","_qtyIs","_hasCash","_westGrp","_unit"];
if (DZE_ActionInProgress) exitWith {};
DZE_ActionInProgress = true;
_guardCnt = (position player) nearEntities [["TK_Aziz_EP1","TK_Soldier_Sniper_EP1"], 50];

if (count _guardCnt > 1) then {
	cutText [format["You have bought a maximum amount of Bodyguards!"], "PLAIN DOWN"];
} else {
	_hasCash = [player, 20000] call SC_fnc_removeCoinsUK111;
	if (_hasCash) then {
		player playActionNow "PutDown";
		_pos = getPos player;
		_westGrp = createGroup west;
		_unit = _westGrp createUnit ["TK_Soldier_Sniper_EP1", _pos, [], 1.0, "PRIVATE"];
		{_unit removeMagazine _x;} forEach (magazines _unit);
		{_unit removeWeapon _x;} forEach (weapons _unit);
		_unit addRating 10000000;
		WEST setFriend [RESISTANCE, 0];
		WEST setFriend [EAST, 0];
		EAST setFriend [WEST, 0];
		_unit setVariable ["hooker", true];
		_unit enableAI "TARGET";
		_unit enableAI "AUTOTARGET";
		_unit enableAI "MOVE";
		_unit enableAI "ANIM";
		_unit enableAI "FSM";
		_unit allowDammage true;
		_unit setCombatMode "RED";
		_unit setBehaviour "STEALTH";
		_unit setFormation "WEDGE";
		_unit addWeapon "Mk_48_DZ";
		_unit addWeapon "NVGoggles";
		for "_i" from 1 to 3 do { _unit addMagazine "100Rnd_762x51_M240"; };
		[_unit] join player;
		_unit addEventHandler ["Fired", {_this call player_fired;}];
		cutText [format["You just bought a heavy bodyguard!\nRebind select all units key for controlling AIs"], "PLAIN DOWN"];
		systemChat ("Rebind select all units key for controlling AIs");
		[format["%1 Bought a Heavy BODYGUARD for 20,000 coins from Slave Dealer.",name player]] call my_scripts_logger;
		uiSleep 3;
	} else {
		cutText [format["You need 20,000 coins to buy this Bodyguard!"], "PLAIN DOWN"];
	};
};
DZE_ActionInProgress = false;
