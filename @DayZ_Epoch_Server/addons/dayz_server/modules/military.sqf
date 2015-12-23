private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.75; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
_loot_box = "RUVehicleBox";
_loot_lists = [
[["RPG7V","BAF_L85A2_RIS_CWS"],["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]],
[["MetisLauncher"],["AT13","AT13","AT13","PipeBomb","PipeBomb","PipeBomb"]],
[["Stinger"],["Stinger","Stinger","Stinger"]],
[["Javelin","BAF_L85A2_RIS_CWS"],["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","Javelin","Javelin","Javelin"]],
[["SMAW"],["SMAW_HEAA","SMAW_HEAA","SMAW_HEDP","SMAW_HEDP"]],
[["Strela"],["Strela","Strela","Strela"]],
[["Igla","BAF_L85A2_RIS_CWS"],["Igla","Igla","Igla","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]],
[["AA12_PMC"],["20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE"]],
[["m8_Sharpshooter"],["100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag"]],
[["BAF_AS50_TWS"],["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]],
[["AA12_PMC"],["20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE"]],
[["Igla"],["Igla","Igla","Igla"]],
[["Strela","BAF_L85A2_RIS_CWS"],["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]],
[["SMAW"],["SMAW_HEAA","SMAW_HEAA","SMAW_HEDP","SMAW_HEDP"]],
[["Javelin"],["Javelin","Javelin","Javelin"]],
[["Stinger","BAF_L85A2_RIS_CWS"],["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]],
[["MetisLauncher","BAF_L85A2_RIS_CWS"],["30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]],
[["RPG7V"],["PG7V","PG7V","PG7V","PG7VL","PG7VL","PG7VL","PG7VR","PG7VR","PG7VR","OG7","OG7","OG7"]]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 75;
_wait_time = 900; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 
// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};
 
// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Spawning loot event at %1", _position]);
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorRed";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;
};
 
  /////MESSAGE
 
 _msgDebug = "<t align='center' color='#FF0000' shadow='2' size='1.75'>Attention!</t><br/><img size='4.75' image='fixes\GUI\treasure_hunt\Military_ICON.paa'/><br/><t align='center' color='#ffffff'>USMC lost a crate full of guns, ammmunition and explosives. Find it befere anyone else will.</t>";
 
 [nil, nil, rspawn, [_msgDebug], {if (isNil "hint_debug_msn") then {hint_debug_msn=false;};
 if (debugMonitor)then 
	{
	hint_debug_msn=true;debugMonitor=false;
	};
	hint parseText (_this select 0);
	sleep 15;
if (hint_debug_msn) then
    {
	hint_debug_msn=false;
	debugMonitor=true;
	[] spawn fnc_debug;
	};}] call RE;
 
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};