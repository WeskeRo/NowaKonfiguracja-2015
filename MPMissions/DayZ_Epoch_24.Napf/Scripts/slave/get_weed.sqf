//Gather weed -Sukkaed
private ["_hempqty","_hasShovel","_findHemp","_countHemp"];
if (DZE_ActionInProgress) exitWith {};
DZE_ActionInProgress = true;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_hasShovel = "ItemShovel" in items player;
_findHemp = nearestObjects [player,["fiberplant"],5];
_countHemp = count _findHemp;
player removeAction s_player_Getweed;
s_player_Getweed = -1;

if (vehicle player != player) exitWith { 
	cutText ["You cannot do this while in a vehicle!", "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};
if (_hempqty > 9) exitWith { 
	cutText ["WARNING: You have a max amount of weed in your inventory!", "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};
if (!_hasShovel) exitWith { 
	cutText ["You need a shovel to do this!", "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};
if (_countHemp > 0) then {	
	r_interrupt = false;
	player playActionNow "PutDown";
	deleteVehicle (_findHemp select 0);
	player addMagazine "ItemKiloHemp";
	cutText ["You collected some precious weed!", "PLAIN DOWN"];
	//[format["%1 Gathered WEED.",name player]] call my_scripts_logger;
	uiSleep 3;
	if (round(random(100)) == 1) then { [player,1] call GiveXP; };
} else {
	cutText ["There is no more Hemp! :'(", "PLAIN DOWN"];
};
DZE_ActionInProgress = false;
