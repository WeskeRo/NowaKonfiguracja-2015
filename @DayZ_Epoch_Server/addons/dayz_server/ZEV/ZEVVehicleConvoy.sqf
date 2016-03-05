private ["_i","_AIData","_groupData","_missionIndex","_aiunit","_aiGroup","_vehicle","_gunnerSpots","_spawnDelay","_crews","_vehicleData","_first","_static","_crewMin","_crewMax","_cargoQty","_crewParms","_crewChilds","_parms","_missionObject","_groupParms","_groupChilds","_side","_routes"];
 
    _aiunit = objNull;
	
	_missionObject		= _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort adding Convoy" call ZEVLog;
	};
	
	_groupData			= _this select 1;
	
	_missionIndex		= _missionObject getVariable ZEVIndex;
	_static				= _missionObject getVariable ZEVStatic;
	
	
	_groupParms			= _groupData select 1;
	_groupChilds		= _groupData select 2;
	
	_parms				= [_groupParms, [ZEVSide,ZEVSpawnDelay]] call ZEVGetProperty;
	_side				= _parms select 0;
	_spawnDelay			= _parms select 1;

	_routes				= _groupChilds select 0;
	_crews = [];
	for "_i" from 1 to count _groupChilds-1 do 
	{
		_crews set [count _crews, _groupChilds select _i];
	};
	
	_first 				= true;
	
	if ( count _crews == 0) exitWith {};
	
	if (_spawnDelay != 0) then {sleep _spawnDelay;};
	/*
	if (_side == "EAST") then {_aiGroup 	= createGroup EAST;	};
	if (_side == "RESISTANCE") then {_aiGroup 	= createGroup Resistance;};
	if (_side == "Civilian") then {_aiGroup 	= createGroup Civilian;};
	_aiGroup setVariable [ZEVIndex, _missionIndex, true];
	_aiGroup setVariable [ZEVStatic, _static, true];
	*/
	_aiGroup = [_missionObject, _side] call ZEVCreateGroup;
	
	{
		_crewParms 		= _x select 1;
		_crewChilds		= _x select 2;
		
		_vehicleData 	= _crewChilds select 0;
		_aIData  		= _crewChilds select 1;
		
		_parms			= [_crewParms, [ZEVCrewMin,ZEVCrewMax]] call ZEVGetProperty;
		_crewMin		= _parms select 0;
		_crewMax     	= _parms select 1;
		
		_vehicle 	= [_missionObject, _vehicleData] call ZEVAddVehicle;
		
		[_vehicle, "Convoy", _missionIndex, 25, _static, "ColorRed"] spawn ZEVAddUnitMarker;
		
		_aiunit		= [_missionObject, _aiGroup, _AIData] call ZEVAddAIUnit;
		_aiunit assignAsDriver _vehicle;
		_aiunit moveInDriver _vehicle;
		_aiunit setSkill 1;

		_gunnerSpots = _vehicle emptyPositions "gunner";
		_vehicle setVariable ["Pilot", _aiunit];
		for "_i" from 0 to (_gunnerSpots - 1) do 
		{
			_aiunit		= [_missionObject, _aiGroup, _AIData] call ZEVAddAIUnit;
			_aiunit assignAsGunner _vehicle;
			_aiunit moveInGunner _vehicle;
			sleep ZEVSleepSmall;
		};
		_vehicle call ZEVSetupVehicle;
		_gunnerSpots = _vehicle emptyPositions "cargo";
		
		_cargoQty = _crewMin + floor(random(_crewMax-_crewMin));
		if (_cargoQty > _gunnerSpots) then {_cargoQty = _gunnerSpots;};
		
		for "_i" from 0 to (_cargoQty - 1) do 
		{
			_aiunit		= [_missionObject, _aiGroup, _AIData] call ZEVAddAIUnit;
			_aiunit assignAsCargo _vehicle;
			_aiunit moveInCargo [_vehicle,_i];
			sleep ZEVSleepSmall;
		};

		_vehicle setVehicleAmmo 1;
		[_vehicle] spawn ZEVVehicleRearm;
		sleep ZEVSleepSmall;
	} foreach _crews;
	[_missionObject, _aiGroup, _routes] call ZEVAddWayPoints;
	[_vehicle, _missionIndex, _static] spawn 
	{
		private ["_veh","_idx","_parms","_pos", "_markerStatus","_stat","_mObj"];
		_veh = _this select 0;
		_idx = _this select 1;
		_stat= _this select 2;
		_markerStatus = [_idx, _stat] call ZEVGetMarkerStatus;
		_mObj = _veh getVariable ZEVObject;
		while { (!isNull _veh) && (alive _veh) && (_markerStatus > 0) && (!isNull _mObj)} do
		{
			_mObj = _veh getVariable ZEVObject;
			_mObj setVariable [ZEVLocationPos, getPos _veh, true];
			/*
			_parms = [_idx, _stat] call ZEVGetActiveMissionParms;
			_pos 	= getPos _veh;
			_parms set [0, _pos];
			[_idx, _stat, _parms] call ZEVSetActiveMissionParms;
			*/
			_markerStatus = [_idx, _stat] call ZEVGetMarkerStatus;
			sleep 10;
		};
	};
	

