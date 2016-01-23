scriptName "Functions\misc\fn_damageHandler.sqf";
/***********************************************************
	PROCESS DAMAGE TO A UNIT
	- Function
	- [unit, selectionName, damage, source, projectile] call fnc_usec_damageHandler;
************************************************************/
private ["_unit","_hit","_damage","_total"];
_unit = _this select 0;
_hit = _this select 1;
_damage = _this select 2;
//_source = _this select 3;
//_ammo = _this select 4;
_total = _damage;
_state = true;

//***Zupa Config ****//

_godmodeVechilesEverywhere = false; // Godmode on all locked vehicles
_onlyLockedVehicles = true; //Plotarea: Godmode for Only locked vehicles (true) or locked and unlocked(false)
_onlyVehicleWithoutGear = false; // Only godmode on vehicles that hold no gear.
_safeZoneGodVehicle = false; // Godmode vehicles in safezones. (or specific zone's)

// donator plotpole only works with PLOT FOR LIFE, set FALSE if you dont have it.
_donatorsPlots = false; // True = only godmode vehicles for donaters in the list, False = godmode for every guy.
_plotDonators = ["76561198101253426","505"]; // PUID's of poeple who donated for plotpole

// Chernarus safezone area's - change these to other coordinates for other maps. ( You can also add specific locations on the map.
_safezones = [ 
    [[5070.75,9729.54],100,"Air"],
    [[1606.6443,7803.5156],100,"Bandit"],
    [[4063.4226,11664.19],100,"Bash"],
    [[12944.227,12766.889],100,"Hero"],
    [[11447.472,11364.504],100,"Klen"],
    [[6315.88,7791.3],100,"Stary"] // [[x,y],distance,"just name"]
];

//***END Config ****//


systemChat "checks";
if((locked _unit && _godmodeVechilesEverywhere  && (count (crew _unit)) < 1))then{_state = false;
};

if(_state)then{
if(_safeZoneGodVehicle )then{
{if ((_unit distance (_x select 0)) <  (_x select 1)) then {_state = false;

};} forEach _safezones;
};
};


if(_state)then{
_gearCount = 0;
if(_onlyVehicleWithoutGear)then{
//_weaps = count(getWeaponCargo _unit);
//_mags = count(getMagazineCargo _unit);
//_backs = count(getBackpackCargo _unit);
//_gearCount = _gearCount + _weaps + _mags + _backs;
};
_plots = nearestObjects [_unit, ["Plastic_Pole_EP1_DZ"], DZE_PlotPole select 0];	
if((count(_plots) > 0))then{		
	_thePlot = _plots select 0;
	_plotOwner = _thePlot getVariable ["ownerPUID",0];
if ( (_gearCount == 0) &&(locked _unit || !(_onlyLockedVehicles) ) && (count (crew _unit)) < 1 && (  !(_donatorsPlots) || (_plotOwner in _plotDonators))) then {_state = false;

};
};
};



//diag_log ("DAMAGE VEH: " + typeof(_unit) + " / " + str(_hit) + " / " + str(_damage) + " / " + str(getDammage _unit));

if (local _unit && _state) then {
	_total = [_unit,_hit,_damage] call object_setHitServer;
};
_total