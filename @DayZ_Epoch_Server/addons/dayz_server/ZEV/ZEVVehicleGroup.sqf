private ["_f","_routes","_aiData","_side","_groupData","_missionIndex","_aiunit","_aiGroup","_aiVehicle","_gunnerSpots","_vehicleData","_spawnDelay","_static","_crewMin","_crewMax","_missionObject","_groupParms","_groupChilds","_parms"];
    _aiunit = objNull;
	_missionObject	= _this select 0;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort adding vehicle group" call ZEVLog;
	};
	
	_groupData		= _this select 1;
	_missionIndex	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	_groupParms		= _groupData select 1;
	_groupChilds	= _groupData select 2;
	_parms = [_groupParms, [ZEVSide,ZEVCrewMin,ZEVCrewMax,ZEVSpawnDelay]] call ZEVGetProperty;
	_side				= _parms select 0;
	_crewMin			= _parms select 1;
	_crewMax			= _parms select 2;
	_spawnDelay			= _parms select 3;
	_routes				= _groupChilds select 0;
	_vehicleData		= _groupChilds select 1;
	_aiData				= _groupChilds select 2;
	if(_crewMin < 0) then { _crewMin = 0;};
	if(_crewMax < _crewMin) then { _crewMax = _crewMin;};
	if(_spawnDelay != 0) then {	sleep _spawnDelay;};
	/*
	if(_side == "EAST") then {_aiGroup 	= createGroup EAST;	};
	if(_side == "RESISTANCE") then {_aiGroup 	= createGroup Resistance;};
	if(_side == "Civilian") then {_aiGroup 	= createGroup Civilian;};
	_aiGroup setVariable [ZEVIndex, _missionIndex];	
	_aiGroup setVariable [ZEVStatic, _static];	
	*/
	_aiGroup = [_missionObject, _side] call ZEVCreateGroup;
	_aiVehicle = [_missionObject, _vehicleData] call ZEVAddVehicle;
	_aiunit = [_missionObject, _aiGroup,_aiData] call ZEVAddAIUnit;
	_aiunit assignAsDriver 	_aiVehicle;
	_aiunit moveInDriver 	_aiVehicle;
	_aiunit setSkill 1;
	//ZEVAutoRepair.sqf
	//_aiGroup selectLeader _aiunit;
	_f = false;

	_aiVehicle call ZEVSetupVehicle;

	_gunnerSpots = _aiVehicle emptyPositions "gunner";
	_aiVehicle setVariable ["Pilot", _aiunit];
	for "_i" from 0 to (_gunnerSpots-1) do 
	{
		_aiunit = [_missionObject, _aiGroup,_AIData] call ZEVAddAIUnit;
		_aiunit assignAsGunner _aiVehicle;
		_aiunit moveInGunner _aiVehicle;
		if(!_f) then
		{
			_aiGroup selectLeader _aiunit;
			_f = true;
		};
		sleep ZEVSleepSmall;
	};
	_gunnerSpots 	= _aiVehicle emptyPositions "cargo";
	_crewMin 		= _crewMin + floor(random(_crewMax - _crewMin));
	if (_gunnerSpots > _crewMin) then	{_gunnerSpots = _crewMin;};
	for "_i" from 0 to (_gunnerSpots - 1) do 
	{
		_aiunit = [_missionObject, _aiGroup,_AIData] call ZEVAddAIUnit;
		_aiunit assignAsCargo _aiVehicle;
		_aiunit moveInCargo [_aiVehicle,_i];
		if(!_f) then
		{
			_aiGroup selectLeader _aiunit;
			_f = true;
		};
		sleep ZEVSleepSmall;
	};
	_aivehicle setVehicleAmmo 1;
	[_aivehicle] spawn ZEVVehicleRearm;
	[_missionObject, _aiGroup, _routes] call ZEVAddWayPoints;