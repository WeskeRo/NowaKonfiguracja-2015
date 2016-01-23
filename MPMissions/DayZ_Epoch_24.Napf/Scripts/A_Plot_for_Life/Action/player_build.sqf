/*
	DayZ Base Building
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_objects","_count","_location","_dir","_classname","_item","_hasrequireditem","_missing","_hastoolweapon","_cancel","_reason","_started","_finished","_animState","_isMedic","_dis","_sfx","_hasbuilditem","_tmpbuilt","_onLadder","_isWater","_require","_text","_offset","_IsNearPlot","_isOk","_location1","_location2","_counter","_limit","_proceed","_num_removed","_position","_object","_canBuildOnPlot","_friendlies","_nearestPole","_ownerID","_findNearestPoles","_findNearestPole","_distance","_classnametmp","_ghost","_isPole","_needText","_lockable","_zheightchanged","_rotate","_combination_1","_combination_2","_combination_3","_combination_4","_combination","_combination_1_Display","_combinationDisplay","_zheightdirection","_abort","_isNear","_need","_needNear","_vehicle","_inVehicle","_requireplot","_objHDiff","_isLandFireDZ","_isTankTrap","_playerID", "_playerUID","_ownerID","_buildcheck","_isowner","_isfriendly","_maxBuildDistance","_vector","_buildOffset","_vUp"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

// disallow building if too many objects are found within plot pole area
_objects = nearestObjects [player, DZE_maintainClasses, (DZE_PlotPole select 0)];
_count = count _objects;
if (_count > DZE_BuildingLimit) exitWith { DZE_ActionInProgress = false; cutText ["\n\nCannot build, too many objects within plot pole area.","PLAIN DOWN"]; };

//if((count (([player] call FNC_GetPos) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"];};

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

_playerUID = [player] call FNC_GetPlayerUID;

if (DZE_APlotforLife) then {
	_playerID = [player] call FNC_GetPlayerUID;
}else{
	_playerID = dayz_characterID;
};

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

DZE_updateVec = false;
DZE_memDir = 0;
DZE_memForBack = 0;
DZE_memLeftRight = 0;

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_item =	_this;

// Need Near Requirements
_abort = false;
_reason = "";

_needNear = 	getArray (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "neednearby");

{
	switch(_x) do{
		case "fire":
		{
			_distance = 3;
			_isNear = {inflamed _x} count (([player] call FNC_GetPos) nearObjects _distance);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "fire";
			};
		};
		case "workshop":
		{
			_distance = 3;
			_isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "workshop";
			};
		};
		case "fueltank":
		{
			_distance = 30;
			_isNear = count (nearestObjects [player, dayz_fuelsources, _distance]);
			if(_isNear == 0) then {
				_abort = true;
				_reason = "fuel tank";
			};
		};
	};
} forEach _needNear;


if(_abort) exitWith {
	cutText [format[(localize "str_epoch_player_135"),_reason,_distance], "PLAIN DOWN"];
	DZE_ActionInProgress = false;
};

_classname = getText (configFile >> "CfgMagazines" >> _item >> "ItemActions" >> "Build" >> "create");
_classnametmp = _classname;
_require = getArray (configFile >> "cfgMagazines" >> _this >> "ItemActions" >> "Build" >> "require");
_text = getText (configFile >> "CfgVehicles" >> _classname >> "displayName");
_ghost = getText (configFile >> "CfgVehicles" >> _classname >> "ghostpreview");

_lockable = 0;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "lockable")) then {
	_lockable = getNumber(configFile >> "CfgVehicles" >> _classname >> "lockable");
};

_requireplot = DZE_requireplot;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "requireplot")) then {
	_requireplot = getNumber(configFile >> "CfgVehicles" >> _classname >> "requireplot");
};

if (_requireplot == 0) then{_requireplot = false}else{_requireplot = true};

_isAllowedUnderGround = 1;
if(isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
	_isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset = 	getArray (configFile >> "CfgVehicles" >> _classname >> "offset");
if((count _offset) <= 0) then {
	_offset = [0,1.5,0];
};

_isPole = (_classname == "Plastic_Pole_EP1_DZ");
_isLandFireDZ = (_classname == "Land_Fire_DZ");

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

if(_isPole) then {
	_distance = DZE_PlotPole select 1;
};

// check for near plot
_findNearestPoles = nearestObjects [(vehicle player), ["Plastic_Pole_EP1_DZ"], _distance];
_findNearestPole = [];

{
	if (alive _x) then {
		_findNearestPole set [(count _findNearestPole),_x];
	};
} count _findNearestPoles;

_IsNearPlot = count (_findNearestPole);

// If item is plot pole && another one exists within 45m
if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(format [localize "str_epoch_player_44", DZE_PlotPole select 1]) , "PLAIN DOWN"]; };

if(_IsNearPlot == 0) then {

	// Allow building of plotpole or items not requiring a plot pole
	if(!(_requireplot) || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};

} else {
	// Since there are plot poles nearby we need to check ownership && friend status

	// check nearest pole only
	_nearestPole = _findNearestPole select 0;
	
	//Plot manager --------------------------------------------------
	_friendlies = _nearestPole getVariable ["plotfriends",[]];
	_fuid  = [];
	{
		_friendUID = _x select 0;
		_fuid  =  _fuid  + [_friendUID];
	} forEach _friendlies;
	_builder  = getPlayerUID player;
	// check if friendly to owner
	if (_builder in _fuid) then {
		_canBuildOnPlot = true;
	};
	// -----------------------------------------------------------------

	_buildcheck = [player, _nearestPole] call FNC_check_owner;
	_isowner = _buildcheck select 0;
	_isfriendly = _buildcheck select 1;
	if ((_isowner) || (_isfriendly)) then {
		_canBuildOnPlot = true;
	};
};

// _message
if(!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };

_missing = "";
_hasrequireditem = true;
{
	_hastoolweapon = _x in weapons player;
	if(!_hastoolweapon) exitWith { _hasrequireditem = false; _missing = getText (configFile >> "cfgWeapons" >> _x >> "displayName"); };
} count _require;

_hasbuilditem = _this in magazines player;
if (!_hasbuilditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_player_31"),_text,"build"] , "PLAIN DOWN"]; };

if (!_hasrequireditem) exitWith {DZE_ActionInProgress = false; cutText [format[(localize "str_epoch_player_137"),_missing] , "PLAIN DOWN"]; };
if (_hasrequireditem) then {

	_location = [0,0,0];
	_isOk = true;

	// get initial players position & set max build range origin.
	if ((DZE_BuildInPlotRadius) && (_requireplot)) then{
		_location1 = [_nearestPole] call FNC_GetPos;
		_maxBuildDistance = _Distance / 2;
		diag_log text "Pole initial location.";
	}else{
		_location1 = [player] call FNC_GetPos;
		_maxBuildDistance = 5;
		diag_log text "Player initial location.";
	};
	
	diag_log format["[Player_Build] _location1 = %1, _maxBuildDistance = %2, DZE_BuildInPlotRadius = %3, _requireplot = %4",_location1, _maxBuildDistance, DZE_BuildInPlotRadius, _requireplot];
	
	_dir = getDir player;

	// if ghost preview available use that instead
	if (_ghost != "") then {
		_classname = _ghost;
	};

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

	_object attachTo [player,_offset];

	_position = [_object] call FNC_GetPos;

	cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];

	_objHDiff = 0;

	if !(_item in DZE_noRotate) then{
		["","","",["Init","Init",0]] spawn build_vectors;
	};
	
	while {_isOk} do {

		_zheightchanged = false;
		_zheightdirection = "";
		_rotate = false;

		if (DZE_Q) then {
			DZE_Q = false;
			_zheightdirection = "up";
			_zheightchanged = true;
		};
		if (DZE_Z) then {
			DZE_Z = false;
			_zheightdirection = "down";
			_zheightchanged = true;
		};
		if (DZE_Q_alt) then {
			DZE_Q_alt = false;
			_zheightdirection = "up_alt";
			_zheightchanged = true;
		};
		if (DZE_Z_alt) then {
			DZE_Z_alt = false;
			_zheightdirection = "down_alt";
			_zheightchanged = true;
		};
		if (DZE_Q_ctrl) then {
			DZE_Q_ctrl = false;
			_zheightdirection = "up_ctrl";
			_zheightchanged = true;
		};
		if (DZE_Z_ctrl) then {
			DZE_Z_ctrl = false;
			_zheightdirection = "down_ctrl";
			_zheightchanged = true;
		};
		if (DZE_4) then {
			_rotate = true;
			DZE_4 = false;
			if(DZE_dirWithDegrees) then{
				DZE_memDir = DZE_memDir - DZE_curDegree;
			}else{
				DZE_memDir = DZE_memDir - 45;
			};
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			if(DZE_dirWithDegrees) then{
				DZE_memDir = DZE_memDir + DZE_curDegree;
			}else{
				DZE_memDir = DZE_memDir + 45;
			};
		};
		
		if(DZE_updateVec) then{
			[_object,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
			DZE_updateVec = false;
		};

		if(_rotate) then {
			[_object,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		};

		if(_zheightchanged) then {
			detach _object;

			_position = getPosATL _object;

			if(_zheightdirection == "up") then {
				_position set [2,((_position select 2)+0.1)];
				_objHDiff = _objHDiff + 0.1;
			};
			if(_zheightdirection == "down") then {
				_position set [2,((_position select 2)-0.1)];
				_objHDiff = _objHDiff - 0.1;
			};

			if(_zheightdirection == "up_alt") then {
				_position set [2,((_position select 2)+1)];
				_objHDiff = _objHDiff + 1;
			};
			if(_zheightdirection == "down_alt") then {
				_position set [2,((_position select 2)-1)];
				_objHDiff = _objHDiff - 1;
			};

			if(_zheightdirection == "up_ctrl") then {
				_position set [2,((_position select 2)+0.01)];
				_objHDiff = _objHDiff + 0.01;
			};
			if(_zheightdirection == "down_ctrl") then {
				_position set [2,((_position select 2)-0.01)];
				_objHDiff = _objHDiff - 0.01;
			};

			_object setDir (getDir _object);

			if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
				_position set [2,0];
			};

			_object setPosATL _position;

			//diag_log format["DEBUG Change BUILDING POS: %1", _position];

			_object attachTo [player];
			
			[_object,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;

		};

		sleep 0.5;

		_location2 = getPosATL player;

		if(DZE_5) exitWith {
			_isOk = false;
			detach _object;
			_dir = getDir _object;
			_vector = [(vectorDir _object),(vectorUp _object)];	
			_position = getPosATL _object;
			//diag_log format["DEBUG BUILDING POS: %1", _position];
			deleteVehicle _object;
		};

		if(_location1 distance _location2 > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "You've moved to far away from where you started building (within 5 meters)";
			detach _object;
			deleteVehicle _object;
		};

		if(abs(_objHDiff) > 5) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cannot move up or down more than 5 meters";
			detach _object;
			deleteVehicle _object;
		};

		if (player getVariable["combattimeout", 0] >= time) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = (localize "str_epoch_player_43");
			detach _object;
			deleteVehicle _object;
		};

		if (DZE_cancelBuilding) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cancelled building.";
			detach _object;
			deleteVehicle _object;
		};
	};

	//No building on roads unless toggled
	if (!DZE_BuildOnRoads) then {
		if (isOnRoad _position) then { _cancel = true; _reason = "Cannot build on a road."; };
	};

	// No building in trader zones
	if(!canbuild) then { _cancel = true; _reason = "Cannot build in a city."; };
	
	if ((DZE_BuildOnGround) && !(_requireplot)) then{
		_toohigh = false;
		if (_ispole) then{
			if ((_position select 2) > DZE_MaxPlotHeight) then{_toohigh = true};
		}else{
			if ((_position select 2) > DZE_MaxNoPlotNeededHeight) then{_toohigh = true};
		};
		if (_toohigh) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "This item must be built at ground level.";
			detach _object;
			deleteVehicle _object;
		};
	};

	if(!_cancel) then {

		_classname = _classnametmp;

		// Start Build
		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

		_tmpbuilt setdir _dir;

		// Get position based on object
		_location = _position;

		if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setVectorDirAndUp _vector;
	
		_buildOffset = [0,0,0];
		_vUp = _vector select 1;
		switch (_classname) do {
			case "MetalFloor_DZ": { _buildOffset = [(_vUp select 0) * .148, (_vUp select 1) * .148,0]; };
		};
		
		_location = [
			(_location select 0) - (_buildOffset select 0),
			(_location select 1) - (_buildOffset select 1),
			(_location select 2) - (_buildOffset select 2)
		];
		
		if (surfaceIsWater _location) then {
			_tmpbuilt setPosASL _location;
			_location = ASLtoATL _location; //Database uses ATL
		} else {
			_tmpbuilt setPosATL _location;
		};

		cutText [format[(localize "str_epoch_player_138"),_text], "PLAIN DOWN"];

		_limit = 3;

		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		}
		else {
			if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
			};
		};

		_isOk = true;
		_proceed = false;
		_counter = 0;

		while {_isOk} do {

			[10,10] call dayz_HungerThirst;
			player playActionNow "Medic";

			_dis=20;
			_sfx = "repair";
			[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
			[player,_dis,true,([player] call FNC_GetPos)] spawn player_alertZombies;

			r_interrupt = false;
			r_doLoop = true;
			_started = false;
			_finished = false;

			while {r_doLoop} do {
				_animState = animationState player;
				_isMedic = ["medic",_animState] call fnc_inString;
				if (_isMedic) then {
					_started = true;
				};
				if (_started && !_isMedic) then {
					r_doLoop = false;
					_finished = true;
				};
				if (r_interrupt || (player getVariable["combattimeout", 0] >= time)) then {
					r_doLoop = false;
				};
				if (DZE_cancelBuilding) exitWith {
					r_doLoop = false;
				};
				sleep 0.1;
			};
			r_doLoop = false;


			if(!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};

			if(_finished) then {
				_counter = _counter + 1;
			};

			cutText [format[(localize "str_epoch_player_139"),_text, _counter,_limit], "PLAIN DOWN"];

			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};

		};

		if (_proceed) then {

			_num_removed = ([player,_item] call BIS_fnc_invRemove);
			if(_num_removed == 1) then {

				cutText [format[localize "str_build_01",_text], "PLAIN DOWN"];

				if (_isPole) then {
					[] spawn player_plotPreview;
				};

				_tmpbuilt setVariable ["OEMPos",_location,true];

				if(_lockable > 1) then {

					_combinationDisplay = "";

					switch (_lockable) do {

						case 2: { // 2 lockbox
							_combination_1 = (floor(random 3)) + 100; // 100=red,101=green,102=blue
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
							dayz_combination = _combination;
							if (_combination_1 == 100) then {
								_combination_1_Display = "Red";
							};
							if (_combination_1 == 101) then {
								_combination_1_Display = "Green";
							};
							if (_combination_1 == 102) then {
								_combination_1_Display = "Blue";
							};
							_combinationDisplay = format["%1%2%3",_combination_1_Display,_combination_2,_combination_3];
						};

						case 3: { // 3 combolock
							_combination_1 = floor(random 10);
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination = format["%1%2%3",_combination_1,_combination_2,_combination_3];
							dayz_combination = _combination;
							_combinationDisplay = _combination;
						};

						case 4: { // 4 safe
							_combination_1 = floor(random 10);
							_combination_2 = floor(random 10);
							_combination_3 = floor(random 10);
							_combination_4 = floor(random 10);
							_combination = format["%1%2%3%4",_combination_1,_combination_2,_combination_3,_combination_4];
							dayz_combination = _combination;
							_combinationDisplay = _combination;
						};
					};

					_tmpbuilt setVariable ["CharacterID",_combination,true];
					_tmpbuilt setVariable ["ownerPUID",_playerID,true];
					
					if ((typeOf _tmpbuilt) in UKindestructible) then {
						_tmpbuilt allowDamage false;
					};

					PVDZE_obj_Publish = [_combination,_tmpbuilt,[_dir,_location,_playerUID,_vector],_classname];
					publicVariableServer "PVDZE_obj_Publish";

					cutText [format[(localize "str_epoch_player_140"),_combinationDisplay,_text], "PLAIN DOWN", 5];
                    systemChat format [(localize "str_epoch_player_140"),_combinationDisplay,_text];

				} else {
					_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];
					_tmpbuilt setVariable ["ownerPUID",_playerID,true];
					
					// fire?
					if(_tmpbuilt isKindOf "Land_Fire_DZ") then {
						_tmpbuilt spawn player_fireMonitor;
					} else {
						PVDZE_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,_playerUID,_vector],_classname];
						publicVariableServer "PVDZE_obj_Publish";
						if (round(random(25)) == 1) then { [player,1] call GiveXP; };
					};
				};
			} else {
				deleteVehicle _tmpbuilt;
				cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
			};

		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};

			deleteVehicle _tmpbuilt;

			cutText [(localize "str_epoch_player_46") , "PLAIN DOWN"];
		};

	} else {
		cutText [format[(localize "str_epoch_player_47"),_text,_reason], "PLAIN DOWN"];
	};
};

DZE_ActionInProgress = false;
