//Spawn mule -Sukkaed
private ["_slaveCnt","_hasCash","_westGrp","_unit"];
if (DZE_ActionInProgress) exitWith {};
DZE_ActionInProgress = true;
_slaveCnt = (position player) nearEntities [["SurvivorW3_DZ","SurvivorWdesert_DZ"], 50];

if (count _slaveCnt > 1) then {
	cutText [format["You have bought a maximum amount of mules!"], "PLAIN DOWN"];
} else {
	_hasCash = [player, 10000] call SC_fnc_removeCoinsUK111;
	if (_hasCash) then {
		player playActionNow "PutDown";
		_pos = getpos player;
		_westGrp = createGroup west;
		_unit = _westGrp createUnit ["SurvivorW3_DZ", _pos, [], 1.0, "PRIVATE"];
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
		_unit setBehaviour "CARELESS";
		_unit setFormation "WEDGE";
		_unit addBackpack "DZ_LargeGunBag_EP1";
		[_unit] join player;
		cutText [format["You bought a heavy mule!\nRebind select all units key for controlling AIs"], "PLAIN DOWN"];
		systemChat ("Rebind select all units key for controlling AIs");
		[format["%1 Bought a Heavy MULE for 10,000 coins from Slave Dealer.",name player]] call my_scripts_logger;
		uiSleep 3;
	} else {
		cutText [format["You need 10,000 coins to buy this mule!"], "PLAIN DOWN"];
	};
};
DZE_ActionInProgress = false;
