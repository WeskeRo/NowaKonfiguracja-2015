private ["_cashMoney","_bankMoney","_UK111xp","_weapons","_backpackWpn","_backpackMag","_currentWpn","_backpackWpnTypes","_backpackWpnQtys","_countr","_class","_position","_dir","_currentAnim","_tagSetting","_deployID","_playerUID","_countMags","_magazines","_primweapon","_secweapon","_newBackpackType","_muzzles","_oldUnit","_group","_newUnit","_playerObjName","_wpnType","_ismelee","_hasCompass","_hasRadio","_hasGPS","_hasWatch","_hasMap","_hasNVG","_oldGroup"];

_class 			= _this;
_position 		= getPosATL player;
_dir 			= getDir player;
_currentAnim 	= animationState player;
_tagSetting = player getVariable["DZE_display_name",false];
_playerUID = getPlayerUID player;
_weapons 	= weapons player;
_countMags = call player_countMagazines; 
_magazines = _countMags select 0;
_cashMoney = player getVariable["cashMoney",0];
_bankMoney = player getVariable["bankMoney",0];

if ((_playerUID == dayz_playerUID) && (count _magazines == 0) && (count (magazines player) > 0 )) exitWith {cutText [(localize "str_epoch_player_17"), "PLAIN DOWN"]};

_primweapon	= primaryWeapon player;
_secweapon	= secondaryWeapon player;

if (!(_primweapon in _weapons) && _primweapon != "") then {
	//_weapons = _weapons + [_primweapon];
	//fix added
	_weapons set [(count _weapons), _primweapon];
};

if (!(_secweapon in _weapons) && _secweapon != "") then {
	//_weapons = _weapons + [_secweapon];
	//fix added
	_weapons set [(count _weapons), _secweapon];
};

//BackUp Backpack
dayz_myBackpack = unitBackpack player;
_newBackpackType = (typeOf dayz_myBackpack);
if(_newBackpackType != "") then {
	_backpackWpn = getWeaponCargo unitBackpack player;
	_backpackMag = _countMags select 1;
};

//Get Muzzle
_currentWpn = currentWeapon player;
_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then {
	_currentWpn = currentMuzzle player;
};

//Secure Player for Transformation
player setPosATL dayz_spawnPos;

//BackUp Player Object
_oldUnit = player;
_oldGroup = group player;

//Reset items from new skins
_hasCompass = false;
_hasRadio = false;
_hasGPS = false;
_hasWatch = false;
_hasMap = false;
_hasNVG = false;
if (player hasWeapon "ItemCompass") then {_hasCompass = true;};
if (player hasWeapon "ItemRadio") then {_hasRadio = true;};
if (player hasWeapon "ItemGPS") then {_hasGPS = true;};
if (player hasWeapon "ItemWatch") then {_hasWatch = true;};
if (player hasWeapon "ItemMap") then {_hasMap = true;};                
if (player hasWeapon "NVGoggles") then {_hasNVG = true;};  

//Group system
_oldGroup = group player;

/**********************************/
//DONT USE player AFTER THIS POINT//
/**********************************/

//Create New Character
_group 		= createGroup west;
_newUnit 	= _group createUnit [_class,dayz_spawnPos,[],0,"NONE"];
[_newUnit] joinSilent createGroup WEST;	//+++ fix
_newUnit 	setPosATL _position;
_newUnit 	setDir _dir;

//Soul start: SC Edit >>> readding variables used by single currency mod.
_newUnit setVariable ["cashMoney",_cashMoney,true];
_newUnit setVariable ["bankMoney",_bankMoney];
//Soul end: SC Edit
//XP
if (isNil "_UK111xp") then {
	_newUnit setVariable ["UK111xp",0,true];
} else {
	_newUnit setVariable ["UK111xp",_UK111xp,true];
};

//UK Fix?
_newUnit removeAllMPEventHandlers "MPHit";
_newUnit addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];

//Clear New Character
{_newUnit removeMagazine _x;} count  magazines _newUnit;
removeAllWeapons _newUnit;
	
//Fix for skin trader
removeAllItems _newUnit;

//Equip New Charactar
{
	if (typeName _x == "ARRAY") then {if ((count _x) > 0) then {_newUnit addMagazine [(_x select 0), (_x select 1)]; }; } else { _newUnit addMagazine _x; };
} count _magazines;

{
	_newUnit addWeapon _x;
} count _weapons;

//Check && Compare it
if(str(_weapons) != str(weapons _newUnit)) then {
	//Get Differecnce
	{
		_weapons = _weapons - [_x];
	} count (weapons _newUnit);
	
	//Add the Missing
	{
		_newUnit addWeapon _x;
	} count _weapons;
};

if(_primweapon !=  (primaryWeapon _newUnit)) then {
	_newUnit addWeapon _primweapon;		
};
if (_primweapon == "MeleeCrowbar") then {
	_newUnit addMagazine 'crowbar_swing';
};
if (_primweapon == "MeleeSledge") then {
	_newUnit addMagazine 'sledge_swing';
};
if (_primweapon == "MeleeHatchet_DZE") then {
	_newUnit addMagazine 'Hatchet_Swing';
};
if (_primweapon == "MeleeMachete") then {
	_newUnit addMagazine 'Machete_swing';
};
if (_primweapon == "MeleeFishingPole") then {
	_newUnit addMagazine 'Fishing_Swing';
};

if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {
	_newUnit addWeapon _secweapon;		
};
_switchUnit = {
	addSwitchableUnit _newUnit;
	setPlayable _newUnit;
	selectPlayer _newUnit;
	
	//Group system -----------------------------------------
	if ((count units _oldGroup > 1) && {!isNil "PVDZE_plr_LoginRecord"}) then {
		[_newUnit] join _oldGroup;
		if (count units _group < 1) then {deleteGroup _group;};
	};
	//-------------------------------------------------------
	
	removeAllWeapons _oldUnit;
	{_oldUnit removeMagazine _x;} count  magazines _oldUnit;
	deleteVehicle _oldUnit;
	if (count units _oldGroup < 1) then {deleteGroup _oldGroup;};
	if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};
};
//Add && Fill BackPack
if (!isNil "_newBackpackType") then {
	if (_newBackpackType != "") then {
		_newUnit addBackpack _newBackpackType;
		dayz_myBackpack = unitBackpack _newUnit;
		//Weapons
		_backpackWpnTypes = [];
		_backpackWpnQtys = [];
		if (count _backpackWpn > 0) then {
			_backpackWpnTypes = _backpackWpn select 0;
			_backpackWpnQtys = _backpackWpn select 1;
		};
		[] call _switchUnit;
		if (gear_done) then {sleep 0.001;};
		["1"] call gearDialog_create;
		//magazines
		_countr = 0;
		{
			if (!(isClass(configFile >> "CfgWeapons" >> _x))) then {
				_countr = _countr + 1;
				if ((typeName _x) != "STRING") then {
					(unitBackpack player) addMagazineCargoGlobal [(_x select 0), 1];
					_idc = 4999 + _countr;
					_idc setIDCAmmoCount (_x select 1);
				} else {
					(unitBackpack player) addMagazineCargoGlobal [_x, 1];
				};
			};
		} count _backpackMag;
		(findDisplay 106) closeDisplay 0;
		_countr = 0;
		{
			(unitBackpack player) addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
			_countr = _countr + 1;
		} count _backpackWpnTypes;
	} else { [] call _switchUnit; };
} else { [] call _switchUnit; };

[objNull, player, rSwitchMove,_currentAnim] call RE;
player disableConversation true;

if (_tagSetting) then { DZE_ForceNameTags = true; };

_playerUID = getPlayerUID player;
_playerObjName = format["PVDZE_player%1",_playerUID];
call compile format["%1 = player;",_playerObjName];
publicVariableServer _playerObjName; //Outcommit in DayZ 1.8 No clue for what this is - Skaronator

//melee check
_wpnType = primaryWeapon player;
_ismelee = (gettext (configFile >> "CfgWeapons" >> _wpnType >> "melee"));
if (_ismelee == "true") then {
	call dayz_meleeMagazineCheck; 
};

//Reset items from new skins -----------------------------
if (!_hasCompass) then {_newUnit removeWeapon "ItemCompass";};
if (!_hasRadio) then {_newUnit removeWeapon "ItemRadio";};
if (!_hasGPS) then {_newUnit removeWeapon "ItemGPS";};    
if (!_hasWatch) then {_newUnit removeWeapon "ItemWatch";};
if (!_hasNVG) then {_newUnit removeWeapon "NVGoggles";};
_newUnit removeWeapon "ItemMap";
player removeWeapon "ItemMap";
for '_i' from 0 to 10 do {player removeWeapon "ItemMap";};

//Remove self-actions
/*
for "_i" from 0 to (player addAction ["",""]) do {
	if !(_i in _this) then { player removeAction _i; };
};
*/
for "_i" from 1 to 3 do {
	{ player removeAction _x; } count [
		s_player_flipveh,s_player_deleteBuild,s_player_butcher,s_player_cook,s_player_packtent,s_player_studybody,s_player_unlockvault,
		s_player_packvault,s_player_lockvault,s_player_information,s_player_fillgen,s_player_upgrade_build,s_player_maint_build,s_player_downgrade_build,
		s_player_fuelauto,s_player_fuelauto2,s_player_plotManagement,s_player_packOBJ,s_player_dance,s_player_swapoil,s_player_travel,s_player_lottery,
		s_player_pawn,s_player_SlaveMenu,s_sell_hooker,s_player_Getweed,s_player_filloil,s_player_cowMenu,s_sell_cow,s_player_clothes,s_player_robber,
		s_bank_dialog,s_bank_dialog2,s_bank_dialog3,s_givemoney_dialog,s_player_nitroInstall,s_medic_actions,s_player_bury_human,s_player_delivery1,
		s_player_delivery2,s_player_manageDoor,s_player_hero_bandit,s_player_sting,s_player_UKcareer,s_player_helidoor,s_player_helidoor_remove,
		s_garage_dialog,s_player_healMe,s_player_slots,s_player_guess,s_player_marketplace,s_player_tacSeat,
		s_player_tacSeat1,s_player_tacSeat2,s_player_tacSeat3,s_player_removeBed,s_player_zedfree,s_player_laptop,s_player_rescue,s_player_rescueME
	];
};

//reveal the same objects we do on login
{player reveal _x} count (nearestObjects [getPosATL player, dayz_reveal, 50]);
