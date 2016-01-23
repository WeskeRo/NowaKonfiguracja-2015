private ["_obj","_ownername","_type","_name","_holder","_holderpos","_disease"];
player removeAction s_player_packOBJ;
if (DZE_ActionInProgress) exitWith {};
_obj = _this select 3;
_ownername = cursorTarget getVariable["Ownername","nil"];
_type = typeOf _obj;
_name =	getText(configFile >> "CfgVehicles" >> _type >> "displayName");

if (isNull cursorTarget) exitWith { cutText ["Vehicle not found!","PLAIN DOWN"]; };
if (isNil "_ownername") exitWith { cutText ["You cannot dismantle this vehicle","PLAIN DOWN"]; };

if (_ownername == getPlayerUID player) then {
	if (((damage _obj) > 0.7) || !(canMove _obj)) exitWith {
		cutText ["This "+_name+" is too damaged to dismantle.","PLAIN DOWN"];
		systemChat ("This "+_name+" is too damaged to dismantle.");
	};

	_isDismantle = cursorTarget isKindOf _type;
	if (!_isDismantle) exitWith {
		cutText ["Vehicle not found. Try again!","PLAIN DOWN"];
		[format["DISMANTLE: Vehicle not found by %1.",name player]] call my_scripts_logger;
	};
	
	if (UK_deploy) then {
		deleteVehicle _obj;
		player playActionNow "PutDown";
	} else {
		r_interrupt = false;
		deleteVehicle _obj;
		player playActionNow "Medic";
		uiSleep 1;
		[player,"repair",0,false,5] call dayz_zombieSpeak;
		uiSleep 1;
	};

	if (_type == "MMT_Civ") then {
		player addMagazine "PartGeneric";
	};

	if (_type == "Old_moto_TK_Civ_EP1") then {
		player addMagazine "PartGeneric";
		player addMagazine "PartEngine";
	};

	if (_type == "CSJ_GyroC") then {
		player addMagazine "PartGeneric";
		player addMagazine "PartEngine";
		player addMagazine "PartVRotor";
	};

	if (_type == "BAF_GPMG_Minitripod_W") then {
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "100Rnd_762x51_M240";
		player addMagazine "PartGeneric";
		player addMagazine "ItemPole";
		player addMagazine "ItemPole";
		player addMagazine "ItemPole";
		_holder = createVehicle ["weaponHolder", getPosATL player, [], 1, "CAN_COLLIDE"];
		_holderpos = getPosATL _holder;
		_holderpos = [((_holderpos select 0) + 0),((_holderpos select 1) + 1),0];
		_holder setPosATL _holderpos;
		_holder addWeaponCargoGlobal ["M240_scoped_EP1_DZE",1];
	};
	
	if (UK_infection) then {
		if (floor (random 50) < 1) then {
			_disease = ["Aids","Ebola","Cholera","Hepatitis B","Malaria","Plague","Rabies","Rhinovirus","Sepsis","Tuberculosis","Yellow fever","Pneumonia","Monkeypox"] call BIS_fnc_selectRandom;
			r_player_infected = true;
			player setVariable["USEC_infected",true,true];
			[0.6,1] call fnc_usec_pitchWhine;
			addCamShake [55, 0.6, 111];
			cutText ["You cut yourself while packing "+_name+".. Now you have "+_disease+"..","PLAIN DOWN"];
		};
	};
	
} else {
	cutText ["Only owner of this "+_name+" can dismantle it!","PLAIN DOWN"];
};
