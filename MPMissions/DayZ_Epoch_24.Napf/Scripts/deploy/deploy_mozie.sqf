//Deploy things -Sukkaed
private ["_hasScrap", "_hasEngine", "_hasRotor", "_position", "_bird", "_location", "_moved", "_finished", "_finishedTime", "_playeruid", "_disease", "_txt"];
closeDialog 0;
if (DZE_ActionInProgress) exitWith { cutText ["Another action already in progress!","PLAIN DOWN"]; };
if !(isNil "UKDeploying") exitWith { cutText ["Deploy already in progress!","PLAIN DOWN"]; };
UKDeploying = true;
UKrelease = false;
_hasScrap  = "PartGeneric" in magazines player;
_hasEngine = "PartEngine" in magazines player;
_hasRotor  = "PartVRotor" in magazines player;

if (_hasScrap && _hasEngine && _hasRotor) then {
	_position = player modelToWorld [0,7,0];
	_bird = createVehicle ["CSJ_GyroC", _position, [], 0, "CAN_COLLIDE"];
	_bird setVehicleLock "LOCKED";
	_bird setVariable ["MalSar",1,true];
	_bird attachTo [player,[0,7,2.2]];
	player reveal _bird;
	cutText ["\n\nSpacebar to deploy!","PLAIN DOWN"];
	
	_location = getPosATL player;
	_moved = false;
	while {!UKrelease} do {
		if (_location distance (getPosATL player) > 1) exitWith { _moved = true; };
		uiSleep 0.1;
	};
	
	if (_moved) exitWith {
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
		detach _bird;
		deleteVehicle _bird;
		UKDeploying = nil;
	};
	
	_hasScrap2  = "PartGeneric" in magazines player;
	_hasEngine2 = "PartEngine" in magazines player;
	_hasRotor2  = "PartVRotor" in magazines player;
	if (!_hasScrap2 || !_hasEngine2 || !_hasRotor2) exitWith {
		cutText ["No parts found!!","PLAIN DOWN"];
		detach _bird;
		deleteVehicle _bird;
		UKDeploying = nil;
	};
	
	cutText ["\n\nMove to cancel!","PLAIN DOWN"];
	
	if (UK_deploy) then {
		player playActionNow "PutDown";
		player removeMagazine "PartGeneric";
		player removeMagazine "PartEngine";
		player removeMagazine "PartVRotor";
		uiSleep 3;
		_finished = true;
	} else {
		player playActionNow "Medic";
		player removeMagazine "PartGeneric";
		player removeMagazine "PartEngine";
		player removeMagazine "PartVRotor";	
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
		detach _bird;
		_playeruid = getPlayerUID player;
		_bird setVariable ["Deployed",true,true];
		_bird setVariable["Ownername", _playeruid, true];
		_bird setVehicleLock "UNLOCKED";
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
		systemChat ("WARNING: Deployed vehicles do not save over the server restart!");
	} else {
		detach _bird;
		deleteVehicle _bird;
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		player addMagazine "PartGeneric";
		player addMagazine "PartEngine";
		player addMagazine "PartVRotor";
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
	};
} else {
	_txt = "You need: 1x(Scrap Metal), 1x(Engine Parts) and 1x(Main Rotor Assembly) to build this!";
	cutText [_txt,"PLAIN DOWN"];
	systemChat (_txt);
};
UKDeploying = nil;
if (round(random (100)) == 1) then {["The matrix has you...","",""] spawn BIS_fnc_infoText;uiSleep 5;["","Follow the white rabbit...",""] spawn BIS_fnc_infoText;uiSleep 5;["","","Knock, knock..."] spawn BIS_fnc_infoText;};
