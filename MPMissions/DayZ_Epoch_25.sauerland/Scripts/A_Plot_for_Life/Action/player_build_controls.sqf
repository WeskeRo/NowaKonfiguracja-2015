private ["_canDo","_passArray","_objHDiff","_isOk","_zheightchanged","_zheightdirection","_rotate","_dir","_object","_position","_isAllowedUnderGround","_location1","_location2","_cancel","_reason","_lastDir","_objectHelper","_objectHelperDir","_objectHelperPos","_vector"];

_object = _this select 0;
_isAllowedUnderGround = _this select 1;
_location1 = _this select 2;
_objectHelper  = _this select 3;

_passArray = [];

_objHDiff = 0;
_isOk = true;
_cancel = false;
_reason = "";
_dir = getDir player; //required to pass direction when building
helperDetach = false;
_canDo = (!r_drag_sqf and !r_player_unconscious);
_position = [_objectHelper] call FNC_GetPos;



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
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		DZE_updateVec = false;
	};
	
	if (DZE_F and _canDo) then {
		if (helperDetach) then {
			_objectHelper attachTo [player];
			DZE_memDir = DZE_memDir-(getDir player);
			helperDetach = false;
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
		} else {		
			_objectHelperPos = getPosATL _objectHelper;
			detach _objectHelper;			
			DZE_memDir = getDir _objectHelper;
			[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
			_objectHelper setPosATL _objectHelperPos;
			_objectHelper setVelocity [0,0,0]; //fix sliding glitch
			helperDetach = true;
		};
		DZE_F = false;
	};

	if(_rotate) then {
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
	};

	if(_zheightchanged) then {
		if (!helperDetach) then {
		detach _objectHelper;
		_objectHelperDir = getDir _objectHelper;
		};

		_position = [_objectHelper] call FNC_GetPos;

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

		if((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
			_position set [2,0];
		};

		if (surfaceIsWater _position) then {
			_objectHelper setPosASL _position;
		} else {
			_objectHelper setPosATL _position;
		};

		if (!helperDetach) then {
		_objectHelper attachTo [player];
		};
		[_objectHelper,[DZE_memForBack,DZE_memLeftRight,DZE_memDir]] call fnc_SetPitchBankYaw;
	};

	sleep 0.5;

	_location2 = [player] call FNC_GetPos;
	_objectHelperPos = [_objectHelper] call FNC_GetPos;
	
	if(DZE_5) exitWith {
		_isOk = false;
		_position = [_object] call FNC_GetPos;
		detach _object;
		_dir = getDir _object;
		_vector = [(vectorDir _object),(vectorUp _object)];	
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if(_location1 distance _location2 > 10) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "You've moved to far away from where you started building (within 10 meters)";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
	
	if(_location1 distance _objectHelperPos > 10) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Object is placed to far away from where you started building (within 10 meters)";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if(abs(_objHDiff) > 10) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cannot move up or down more than 10 meters";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if (player getVariable["combattimeout", 0] >= time) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = (localize "str_epoch_player_43");
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};

	if (DZE_cancelBuilding) exitWith {
		_isOk = false;
		_cancel = true;
		_reason = "Cancelled building.";
		detach _object;
		deleteVehicle _object;
		detach _objectHelper;
		deleteVehicle _objectHelper;
	};
};



_passArray = [_cancel,_reason,_position,_dir,_vector];
_passArray //[bool,string,array,int,array]
