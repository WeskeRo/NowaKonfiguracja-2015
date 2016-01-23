//Spawn hooker -Sukkaed
private ["_npc","_limit","_hookerCnt","_hooker_total","_hasCash","_westGrp","_hookerSkin","_unit"];
if (DZE_ActionInProgress) exitWith {};
_hooker_total = player getVariable ["max_hooker", 0];
_npc = cursorTarget;
if !(_npc isKindOf "TK_CIV_Takistani05_EP1") exitWith { titleText ["Target not found, try again!","PLAIN"]; };
_puid = getPlayerUID player;
_limit = _npc getVariable ["limit",[]];
if (_puid in _limit)  exitWith { titleText ["No more hookers available before next restart!","PLAIN"]; };
if (_hooker_total == 6) then { _npc setVariable ["limit",(_limit+[_puid]),true]; };
DZE_ActionInProgress = true;
_hookerCnt = (position player) nearEntities [["Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4","RU_Hooker5"], 50];

if (isNil "_hooker_total") then { player setVariable ["max_hooker",0,true]; };
if (count _hookerCnt > 7) exitWith {
	cutText [format["You have bought a maximum amount of hookers!"], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

if (_hooker_total > 7) exitWith {
	cutText [format["There is no more Hookers before next restart!"], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

_hasCash = [player, 10000] call SC_fnc_removeCoinsUK111;
if (_hasCash) then {
	player setVariable ["max_hooker",_hooker_total + 1,true];
	player playActionNow "PutDown";
	_pos = getPos player;
	_westGrp = createGroup west;
	_hookerSkin = ["Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4","RU_Hooker5"] call BIS_fnc_selectRandom;
	_unit = _westGrp createUnit [_hookerSkin, _pos, [], 1.0, "PRIVATE"];
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
	[_unit] join player;
	cutText [format["You just bought yourself a hooker!\nRebind select all units key for controlling AIs"], "PLAIN DOWN"];
	systemChat ("Rebind select all units key for controlling AIs");
	[format["%1 Bought a HOOKER for 10,000 coins from Slave Dealer.",name player]] call my_scripts_logger;
	uiSleep 3;
} else {
	cutText [format["You need 10,000 coins to buy a hooker!"], "PLAIN DOWN"];
};

DZE_ActionInProgress = false;
