private ["_characterID","_playerObj","_playerID","_dummy","_worldspace","_state","_doLoop","_key","_primary","_medical","_stats","_humanity","_lastinstance","_friendlies","_randomSpot","_position","_debug","_distance","_hit","_fractures","_score","_findSpot","_pos","_isIsland","_w","_clientID","_spawnMC","_namespace"];

//diag_log ("SETUP: attempted with " + str(_this));

_characterID = _this select 0;
_playerObj = _this select 1;
_playerID = getPlayerUID _playerObj;
_playerName = name _playerObj;

if (isNull _playerObj) exitWith {
	diag_log ("SETUP INIT FAILED: Exiting, player object null: " + str(_playerObj));
};

//Add MPHit event handler
// diag_log("Adding MPHit EH for " + str(_playerObj));
_playerObj addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];

if (_playerID == "") then {
	_playerID = getPlayerUID _playerObj;
};

if (_playerID == "") exitWith {
	diag_log ("SETUP INIT FAILED: Exiting, no player ID: " + str(_playerObj));
};

private["_dummy"];
_dummy = getPlayerUID _playerObj;
if ( _playerID != _dummy ) then { 
	diag_log format["DEBUG: _playerID miscompare with UID! _playerID:%1",_playerID]; 
	_playerID = _dummy;
};

//Variables
_worldspace = 	[];

_state = 		[];
//Soul start: SC Edit >>> initialize variables in main scope (helps avoiding scope issues within the file and avoids undeclared variable errors in rpt, aswell they server as default values if anything goes wrong)
_cashMoney = 0;
_bankMoney = 0;
//Soul end: SC Edit

//Do Connection Attempt
_doLoop = 0;
while {_doLoop < 5} do {
	_key = format["CHILD:102:%1:",_characterID];
	_primary = _key call server_hiveReadWrite;
	if (count _primary > 0) then {
		if ((_primary select 0) != "ERROR") then {
			_doLoop = 9;
		};
	};
	_doLoop = _doLoop + 1;
};

if (isNull _playerObj || !isPlayer _playerObj) exitWith {
	diag_log ("SETUP RESULT: Exiting, player object null: " + str(_playerObj));
};

//Wait for HIVE to be free
//diag_log ("SETUP: RESULT: Successful with " + str(_primary));

_medical =		_primary select 1;
_stats =		_primary select 2;
_state =		_primary select 3;
_worldspace = 	_primary select 4;
_humanity =		_primary select 5;
_lastinstance =	_primary select 6;
//Soul start: SC Edit >>> loading player cash into variable / overwriting default 0 value with returned value.
_cashMoney = 	_primary select 7;
//Soul end: SC Edit

//Set position
_randomSpot = false;

if (count _worldspace > 0) then {

	_position = 	_worldspace select 1;
	if (count _position < 3) then {
		//prevent debug world!
		_randomSpot = true;
	};
	_debug = getMarkerpos "respawn_west";
	_distance = _debug distance _position;
	if (_distance < 2000) then {
		_randomSpot = true;
	};
	
	_distance = [0,0,0] distance _position;
	if (_distance < 500) then {
		_randomSpot = true;
	};
	
	// Came from another server force random spawn
	if (_lastinstance != dayZ_instance) then {
		_randomSpot = true;
	};

	//_playerObj setPosATL _position;
} else {
	_randomSpot = true;
};

//diag_log ("LOGIN: Location: " + str(_worldspace) + " doRnd?: " + str(_randomSpot));

//set medical values
if (count _medical > 0) then {
	_playerObj setVariable["USEC_isDead",(_medical select 0),true];
	_playerObj setVariable["NORRN_unconscious", (_medical select 1), true];
	_playerObj setVariable["USEC_infected",(_medical select 2),true];
	_playerObj setVariable["USEC_injured",(_medical select 3),true];
	_playerObj setVariable["USEC_inPain",(_medical select 4),true];
	_playerObj setVariable["USEC_isCardiac",(_medical select 5),true];
	_playerObj setVariable["USEC_lowBlood",(_medical select 6),true];
	_playerObj setVariable["USEC_BloodQty",(_medical select 7),true];
	_playerObj setVariable["unconsciousTime",(_medical select 10),true];
		
	//Add Wounds
	{
		_playerObj setVariable[_x,true,true];
		//["usecBleed",[_playerObj,_x,_hit]] call broadcastRpcCallAll;
		usecBleed = [_playerObj,_x,_hit];
		publicVariable "usecBleed";
	} count (_medical select 8);
	
	//Add fractures
	_fractures = (_medical select 9);
	_playerObj setVariable ["hit_legs",(_fractures select 0),true];
	_playerObj setVariable ["hit_hands",(_fractures select 1),true];
	
	if (count _medical > 11) then {
		//Additional medical stats
		_playerObj setVariable ["messing",(_medical select 11),true];
	};
	
} else {
	//Reset Fractures
	_playerObj setVariable ["hit_legs",0,true];
	_playerObj setVariable ["hit_hands",0,true];
	_playerObj setVariable ["USEC_injured",false,true];
	_playerObj setVariable ["USEC_inPain",false,true];
	_playerObj setVariable ["messing",[0,0],true];
};
	
if (count _stats > 0) then {	
	//register stats
	_playerObj setVariable["zombieKills",(_stats select 0),true];
	_playerObj setVariable["headShots",(_stats select 1),true];
	_playerObj setVariable["humanKills",(_stats select 2),true];
	_playerObj setVariable["banditKills",(_stats select 3),true];
	_playerObj addScore (_stats select 1);
	_playerObj setVariable ["moneychanged",0,true];	
	_playerObj setVariable ["bankchanged",0,true];	
	_playerObj setVariable["AsReMixhud", true,true];

	
	//Save Score
	_score = score _playerObj;
	_playerObj addScore ((_stats select 0) - _score);
	
	//record for Server JIP checks
	_playerObj setVariable["zombieKills_CHK",(_stats select 0)];
	_playerObj setVariable["headShots_CHK",(_stats select 1)];
	_playerObj setVariable["humanKills_CHK",(_stats select 2)];
	_playerObj setVariable["banditKills_CHK",(_stats select 3)];
	if (count _stats > 4) then {
		if (!(_stats select 3)) then {
			_playerObj setVariable["selectSex",true,true];
		};
	} else {
		_playerObj setVariable["selectSex",true,true];
	};
} else {
	//Save initial loadout
	//register stats
	_playerObj setVariable["zombieKills",0,true];
	_playerObj setVariable["humanKills",0,true];
	_playerObj setVariable["banditKills",0,true];
	_playerObj setVariable["headShots",0,true];
	_playerObj setVariable ["friendlies",[],true];
	_playerObj setVariable["AsReMixhud", true,true];
	
	//record for Server JIP checks
	_playerObj setVariable["zombieKills_CHK",0,true];
	_playerObj setVariable["humanKills_CHK",0,true];
	_playerObj setVariable["banditKills_CHK",0,true];
	_playerObj setVariable["headShots_CHK",0,true];
};
//ESS
if (_randomSpot) then {
   if (!isDedicated) then {endLoadingScreen;};
   _debug = getMarkerpos "respawn_west";
   _worldspace = [0,[_debug select 0,_debug select 1,0.3]];
};
//ESS

//Record player for management
dayz_players set [count dayz_players,_playerObj];

//record player pos locally for server checking
_playerObj setVariable["CharacterID",_characterID,true];
_playerObj setVariable["humanity",_humanity,true];
_playerObj setVariable["humanity_CHK",_humanity];
//_playerObj setVariable["worldspace",_worldspace,true];
//_playerObj setVariable["state",_state,true];
_playerObj setVariable["lastPos",getPosATL _playerObj];
//Soul start: SC Edit >>> assigning player new variable for cashmoney and bankMoney
_playerObj setVariable ["cashMoney",_cashMoney,true];
_playerObj setVariable ["cashMoney_CHK",_cashMoney];
//Soul end: SC Edit
dayzPlayerLogin2 = [_worldspace,_state,_randomSpot];

// PVDZE_obj_Debris = DZE_LocalRoadBlocks;
_clientID = owner _playerObj;
if (!isNull _playerObj) then {
	_clientID publicVariableClient "dayzPlayerLogin2";
	
	if (isNil "PVDZE_plr_SetDate") then {
		call server_timeSync;
	};
	_clientID publicVariableClient "PVDZE_plr_SetDate";
};
//record time started
_playerObj setVariable ["lastTime",time];
//_playerObj setVariable ["model_CHK",typeOf _playerObj];

// ------------ SOUL - Single Currency - Get Bank Value ----------------
_key2 = format["CHILD:298:%1:",_playerID];
_primary2 = _key2 call server_hiveReadWrite;
if(count _primary2 > 0) then {
	if((_primary2 select 0) != "ERROR") then {
		_bankMoney = _primary2 select 1;
		_playerObj setVariable["bankMoney",_bankMoney,true];
		_playerObj setVariable["bankMoney_CHK",_bankMoney];
	} else {
		_playerObj setVariable["bankMoney",0,true];
		_playerObj setVariable["bankMoney_CHK",0];
	};
} else {
	_playerObj setVariable["bankMoney",0,true];
	_playerObj setVariable["bankMoney_CHK",0];
};

//diag_log ("LOGIN PUBLISHING: " + str(_playerObj) + " Type: " + (typeOf _playerObj));

PVDZE_plr_Login = nil;
PVDZE_plr_Login2 = nil;