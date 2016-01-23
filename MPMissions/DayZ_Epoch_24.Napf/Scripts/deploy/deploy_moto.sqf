//Deploy things -Sukkaed
private ["_hasScrap", "_hasEngine", "_position", "_bike", "_location", "_moved", "_finished", "_finishedTime", "_playeruid", "_disease", "_txt"];
closeDialog 0;
if (DZE_ActionInProgress) exitWith { cutText ["Another action already in progress!","PLAIN DOWN"]; };
if !(isNil "UKDeploying") exitWith { cutText ["Deploy already in progress!","PLAIN DOWN"]; };
UKDeploying = true;
UKrelease = false;
_hasScrap  = "PartGeneric" in magazines player;
_hasEngine = "PartEngine" in magazines player;

if (_hasScrap && _hasEngine) then {
	_position = player modelToWorld [0,3.5,0];
	_bike = createVehicle ["Old_moto_TK_Civ_EP1", _position, [], 0, "CAN_COLLIDE"];
	_bike setVehicleLock "LOCKED";
	_bike setVariable ["MalSar",1,true];
	_bike attachTo [player,[0,3.5,1.6]];
	player reveal _bike;
	cutText ["\n\nSpacebar to deploy!","PLAIN DOWN"];
	
	_location = getPosATL player;
	_moved = false;
	while {!UKrelease} do {
		if (_location distance (getPosATL player) > 1) exitWith { _moved = true; };
		uiSleep 0.1;
	};
	
	if (_moved) exitWith {
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
		detach _bike;
		deleteVehicle _bike;
		UKDeploying = nil;
	};
	
	_hasScrap2  = "PartGeneric" in magazines player;
	_hasEngine2 = "PartEngine" in magazines player;
	if (!_hasScrap2 || !_hasEngine2) exitWith {
		cutText ["No parts found!!","PLAIN DOWN"];
		detach _bike;
		deleteVehicle _bike;
		UKDeploying = nil;
	};
	
	cutText ["\n\nMove to cancel!","PLAIN DOWN"];
	
	if (UK_deploy) then {
		player playActionNow "PutDown";
		player removeMagazine "PartGeneric";
		player removeMagazine "PartEngine";
		uiSleep 3;
		_finished = true;
	} else {
		player playActionNow "Medic";
		player removeMagazine "PartGeneric";
		player removeMagazine "PartEngine";
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
		detach _bike;
		_playeruid = getPlayerUID player;
		_bike setVariable ["Deployed",true,true];
		_bike setVariable["Ownername", _playeruid, true];
		_bike setVehicleLock "UNLOCKED";
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
		detach _bike;
		deleteVehicle _bike;
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		player addMagazine "PartGeneric";
		player addMagazine "PartEngine";
		cutText ["\n\nBuilding cancelled!","PLAIN DOWN"];
	};
} else {
	_txt = "You need: 1x(Scrap Metal) and 1x(Engine Parts) to build this!";
	cutText [_txt,"PLAIN DOWN"];
	systemChat (_txt);
};
UKDeploying = nil;
if (round(random (100)) == 1) then {["The matrix has you...","",""] spawn BIS_fnc_infoText;uiSleep 5;["","Follow the white rabbit...",""] spawn BIS_fnc_infoText;uiSleep 5;["","","Knock, knock..."] spawn BIS_fnc_infoText;};
