//Deploy things -Sukkaed
private ["_magQTY", "_gunQTY", "_partQTY", "_poleQTY", "_position", "_tripod", "_location", "_moved", "_magQTY2", "_gunQTY2", "_partQTY2", "_poleQTY2", "_finished", "_finishedTime", "_playeruid", "_disease", "_txt"];
closeDialog 0;
if (DZE_ActionInProgress) exitWith { cutText ["Another action already in progress!","PLAIN DOWN"]; };
if !(isNil "UKDeploying") exitWith { cutText ["Deploy already in progress!","PLAIN DOWN"]; };
UKDeploying = true;
UKrelease = false;
_magQTY = {_x == "100Rnd_762x51_M240"} count magazines player;
_gunQTY = {_x == "M240_scoped_EP1_DZE"} count weapons player;
_partQTY = {_x == "PartGeneric"} count magazines player;
_poleQTY = {_x == "ItemPole"} count magazines player;

if (isNil "M240_DEPLOYED") then { M240_DEPLOYED = 0; };
if (M240_DEPLOYED > 1) exitWith {
	cutText ["\n\nYou have built 2 out of a maximum of 2 Static Guns!","PLAIN DOWN"];
	UKDeploying = nil;
};

if ((_magQTY >= 4) && (_gunQTY >= 1) && (_partQTY >= 1) && (_poleQTY >= 3)) then {
	_position = player modelToWorld [0,3,0];
	_tripod = createVehicle ["BAF_GPMG_Minitripod_W", _position, [], 0, "CAN_COLLIDE"];
	_tripod setVehicleLock "LOCKED";
	_tripod setVariable ["MalSar",1,true];
	_tripod attachTo [player,[0,3,0.1]];
	player reveal _tripod;
	cutText ["\n\nSpacebar to deploy!","PLAIN DOWN"];
	
	_location = getPosATL player;
	_moved = false;
	while {!UKrelease} do {
		if (_location distance (getPosATL player) > 1) exitWith { _moved = true; };
		uiSleep 0.1;
	};
	
	if (_moved) exitWith {
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
		detach _tripod;
		deleteVehicle _tripod;
		UKDeploying = nil;
	};
	
	_magQTY2 = {_x == "100Rnd_762x51_M240"} count magazines player;
	_gunQTY2 = {_x == "M240_scoped_EP1_DZE"} count weapons player;
	_partQTY2 = {_x == "PartGeneric"} count magazines player;
	_poleQTY2 = {_x == "ItemPole"} count magazines player;
	if (!(_magQTY2 >= 4) || !(_gunQTY2 >= 1) || !(_partQTY2 >= 1) || !(_poleQTY2 >= 3)) exitWith {
		cutText ["No parts found!!","PLAIN DOWN"];
		detach _tripod;
		deleteVehicle _tripod;
		UKDeploying = nil;
	};
	
	cutText ["\n\nMove to cancel!","PLAIN DOWN"];
	
	if (UK_deploy) then {
		player playActionNow "PutDown";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "PartGeneric";
		player removeMagazine "ItemPole";
		player removeMagazine "ItemPole";
		player removeMagazine "ItemPole";
		player removeWeapon "M240_scoped_EP1_DZE";
		uiSleep 3;
		_finished = true;
	} else {
		player playActionNow "Medic";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "100Rnd_762x51_M240";
		player removeMagazine "PartGeneric";
		player removeMagazine "ItemPole";
		player removeMagazine "ItemPole";
		player removeMagazine "ItemPole";
		player removeWeapon "M240_scoped_EP1_DZE";
		[player,"repair",0,false,10] call dayz_zombieSpeak;
		[player,10,true,(getPosATL player)] spawn player_alertZombies;	
		r_interrupt = false;
		r_doLoop = true;
		_finished = false;
		_finishedTime = diag_tickTime +8;
		while {r_doLoop} do {
			if (diag_tickTime >= _finishedTime) then {
				r_doLoop = false;
				_finished = true;
			};
			if (r_interrupt) then { r_doLoop = false; };
			uiSleep 0.1;
		};
	};
	
	if (_finished) then {
		cutText ["","PLAIN DOWN"];
		detach _tripod;
		_playeruid = getPlayerUID player;
		_tripod setVariable ["Deployed",true,true];
		_tripod setVariable["Ownername", _playeruid, true];
		_tripod setVehicleLock "UNLOCKED";
		M240_DEPLOYED = M240_DEPLOYED + 1;
		if (UK_infection) then {
			if ((floor (random 50)) < 1) then {
				_disease = ["Aids","Ebola","Cholera","Hepatitis B","Malaria","Plague","Rabies","Rhinovirus","Sepsis","Tuberculosis","Yellow fever","Pneumonia","Monkeypox"] call BIS_fnc_selectRandom;
				r_player_infected = true;
				player setVariable["USEC_infected",true,true];
				[0.6,1] call fnc_usec_pitchWhine;
				addCamShake [55, 0.6, 111];
				cutText ["\n\nLooks like you cut yourself in the process.. Now you have "+_disease+"..","PLAIN DOWN"];
			};
		};
		uiSleep 5;
		systemChat ("WARNING: Deployed static guns do not save over the restart!");
	} else {
		detach _tripod;
		deleteVehicle _tripod;
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "PartGeneric";
		player addMagazine "ItemPole";
		player addMagazine "ItemPole";
		player addMagazine "ItemPole";
		player addWeapon "M240_scoped_EP1_DZE";
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
	};
} else {
	_txt = "You need 1x(M240 scoped), 4x(M240 mags), 1x(Scrap Metal) and 3x(Metal Pole) to build this!";
	cutText [_txt,"PLAIN DOWN"];
	systemChat (_txt);
};
UKDeploying = nil;
