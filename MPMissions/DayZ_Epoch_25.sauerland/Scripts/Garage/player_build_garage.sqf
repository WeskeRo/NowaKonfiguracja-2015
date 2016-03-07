private ["_objects","_count","_onLadder","_isWater","_cancel","_reason","_canBuildOnPlot","_vehicle","_inVehicle","_houselevel","_classname","_name","_buildingpart","_playerUID","_playerName","_abort","_classnametmp","_requireplot","_isAllowedUnderGround","_offset","_isPole","_isLandFireDZ","_distance","_needText","_findNearestPoles","_findNearestPole","_IsNearPlot","_nearestPole","_playerID","_ownerID","_friendlies","_message","_require","_missing","_hasrequireditem","_hastoolweapon","_location","_isOk","_location1","_dir","_object","_position","_objHDiff","_zheightchanged","_zheightdirection","_rotate","_location2","_tmpbuilt","_limit","_proceed","_counter","_dis","_sfx","_started","_finished","_animState","_isMedic","_activatingPlayer"];

if(DZE_ActionInProgress) exitWith { cutText [(localize "str_epoch_player_40") , "PLAIN DOWN"]; };
DZE_ActionInProgress = true;

// disallow building if too many objects are found within 30m
//if((count ((getPosATL player) nearObjects ["All",30])) >= DZE_BuildingLimit) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"];};

_objects = nearestObjects [player, DZE_maintainClasses, (DZE_PlotPole select 0)];
_count = count _objects;
//if (_count > DZE_BuildingLimit) exitWith { DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_41"), "PLAIN DOWN"]; };
if (_count > DZE_BuildingLimit) exitWith { DZE_ActionInProgress = false; cutText ["\n\nCannot build, too many objects within plot pole area.","PLAIN DOWN"]; };

_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_isWater = 		dayz_isSwimming;
_cancel = false;
_reason = "";
_canBuildOnPlot = false;

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

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

call gear_ui_init;
closeDialog 1;

if (_isWater) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_26", "PLAIN DOWN"];};
if (_inVehicle) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_42"), "PLAIN DOWN"];};
if (_onLadder) exitWith {DZE_ActionInProgress = false; cutText [localize "str_player_21", "PLAIN DOWN"];};
if (player getVariable["combattimeout", 0] >= time) exitWith {DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_43"), "PLAIN DOWN"];};

_classname = _this select 0;;
_name = _this select 1;
_buildingpart = _this select 2;
_playerUID = dayz_playerUID;
_playerName = (name player);


// Need Near Requirements
_abort = false;
_reason = "";

_classnametmp = _classname;

_requireplot = DZE_requireplot;
_isAllowedUnderGround = 0;

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
if(_isPole && _IsNearPlot > 0) exitWith {  DZE_ActionInProgress = false; cutText [(localize "str_epoch_player_44") , "PLAIN DOWN"]; };

if(_IsNearPlot == 0) then {
	// Allow building of plot
	if(_requireplot == 0 || _isLandFireDZ) then {
		_canBuildOnPlot = true;
	};
} else {
	// check nearby plots ownership && then for friend status
	_nearestPole = _findNearestPole select 0;

	// Find owner
	_playerID = getPlayerUID player;
	_ownerID = _nearestPole getVariable ["ownerPUID","0"];

	// check if friendly to owner
	if(_playerID == _ownerID) then {  //Keep ownership
		// owner can build anything within his plot except other plots
		if(!_isPole) then {
			_canBuildOnPlot = true;
		};
	} else {
		// disallow building plot
		if(!_isPole) then {
			_friendlies		= player getVariable ["friendlyTo",[]];
			// check if friendly to owner
			if(_ownerID in _friendlies) then {
				_canBuildOnPlot = true;
			};
		};
	};
};

// _message
if (!_canBuildOnPlot) exitWith {  DZE_ActionInProgress = false; cutText [format[(localize "STR_EPOCH_PLAYER_135"),_needText,_distance] , "PLAIN DOWN"]; };


if (true) then {
	_location = [0,0,0];
	_isOk = true;

	// get inital players position
	_location1 = getPosATL player;
	_dir = getDir player;

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	_object attachTo [player,[0,6,0]];
	_position = getPosATL _object;
	cutText [(localize "str_epoch_player_45"), "PLAIN DOWN"];
	_objHDiff = 0;

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
			_dir = 180;
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			_dir = 0;
		};

		if(_rotate) then {
			_object setDir _dir;
			_object setPosATL _position;
			//diag_log format["DEBUG Rotate BUILDING POS: %1", _position];
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

		};

		sleep 0.5;

		_location2 = getPosATL player;

		if(DZE_5) exitWith {
			_isOk = false;
			detach _object;
			_dir = getDir _object;
			_position = getPosATL _object;
			//diag_log format["DEBUG BUILDING POS: %1", _position];
			deleteVehicle _object;
		};

		if(_location1 distance _location2 > 10) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "You've moved to far away from where you started building (within 10 meters)";
			detach _object;
			deleteVehicle _object;
		};

		if(abs(_objHDiff) > 10) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = "Cannot move up || down more than 10 meters";
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

	if(!_cancel) then {

		_classname = _classnametmp;

		// Start Build
		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];

		_tmpbuilt setDir _dir;

		// Get position based on object
		_location = _position;

		if((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setPosATL _location;
		if((_location select 2) < 0.25) then {
			_tmpbuilt setVectorUp surfaceNormal position _tmpbuilt;
		};
		_location = getPosATL _tmpbuilt;

		cutText [format[(localize "str_epoch_player_138"),_name], "PLAIN DOWN"];

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
			[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

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

			cutText [format[(localize "str_epoch_player_139"),_name, _counter,_limit], "PLAIN DOWN"];

			if(_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};

		};

		if (_proceed) then {
			cutText [format[localize "str_build_01",_name], "PLAIN DOWN"];

			if (_isPole) then {
				[] spawn player_plotPreview;
			};

			_tmpbuilt setVariable ["OEMPos",_location,true];
			_tmpbuilt setVariable ["CharacterID",dayz_characterID,true];
			_tmpbuilt setVariable ["ownerPUID",_playerUID, true];
			_activatingPlayer = player;
			
			if (_proceed) then {
				
				PVDZE_obj_Publish = [dayz_characterID,_tmpbuilt,[_dir,_location,_playerUID],_classname];
				publicVariableServer "PVDZE_obj_Publish";
				
				cutText [format["You have build %1.", _name], "PLAIN DOWN",5];
				//[format["GARAGE BUILD: %1 build %2 at %3",name player,_name,(mapGridPosition getPos player)]] call my_scripts_logger;
				
				player removeMagazine _buildingpart;
 
			} else {
				deleteVehicle _tmpbuilt;
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
		cutText [format[(localize "str_epoch_player_47"),_name,_reason], "PLAIN DOWN"];
	};
};

DZE_ActionInProgress = false;
