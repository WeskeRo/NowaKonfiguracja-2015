private ["_ai","_grp","_missionIndex","_locPos","_locationRadius","_grpData","_wp0","_wp1","_AIData","_routesData","_startPos","_dropPos","_hc","_gunnerSpots","_drop","_cleanheli","_static","_squadMin","_squadMax","_missionObject","_groupParms","_grpChilds","_parms","_side","_spawnDelay","_vehicleData","_h","_helipos"];
_ai 			= objNull;
format ["AddParadropStart _this = %1", _this] call ZEVLog;
_missionObject	= _this select 0;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort Paradrop creation" call ZEVLog;
};

_grpData		= _this select 1;
_missionIndex	= _missionObject getVariable ZEVIndex;
_static			= _missionObject getVariable ZEVStatic;
format ["paradeop start ZEVStatic = %1 _static = %2",ZEVStatic, _static] call ZEVLog;
_locPos			= _missionObject getVariable ZEVLocationPos;
_locationRadius = _missionObject getVariable ZEVSpawnRadius;
_groupParms		= _grpData select 1;
_grpChilds    	= _grpData select 2;
_parms			= [_groupParms, [ZEVSide,ZEVSquadMin,ZEVSquadMax,ZEVSpawnDelay]] call ZEVGetProperty;
_side			= _parms select 0;
_squadMin		= _parms select 1;
_squadMax		= _parms select 2;
_spawnDelay		= _parms select 3;
_wp0			= _grpChilds select 0;
_wp1			= _grpChilds select 1;
_vehicleData	= _grpChilds select 2;
_routesData		= _grpChilds select 3;
_aiData 		= _grpChilds select 4;

if (_spawnDelay !=0) then
{
	sleep _spawnDelay;
};
if (_squadMin < 1 ) then { _squadMin = 1; };
if (_squadMin > _squadMax) then { _squadMax = _squadMin};
_squadMin = _squadMin + floor(random(_squadMax - _squadMin));
/*
if (_side == "EAST") then
{
	_grp 	= createGroup EAST;	
};
if (_side == "Resistance") then
{
	_grp 	= createGroup Resistance;	
};
if (_side == "Civilian") then
{
	_grp 	= createGroup Civilian;	
};
_grp setVariable [ZEVIndex,  _missionIndex, true];
_grp setVariable [ZEVStatic, _static, true];
*/
_grp = [_missionObject, _side] call ZEVCreateGroup;

_startPos 		= [ _wp0 select 1, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
_startPos 		= [_startPos, ZEVSpecified, _locPos, _locationRadius] call ZEVSelectPos;
_dropPos		= [ _wp1 select 1, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
_dropPos 		= [_dropPos, ZEVSpecified, _locPos, _locationRadius] call ZEVSelectPos;
_ai = [_missionObject, _grp,_aiData] call ZEVAddAIUnit;
_hc = [_missionObject, _vehicleData, "FLY"] call ZEVAddAircraft;
if (isNil "_hc" || isNull _hc) exitWith
{
	"Aircraft not created, cancel paradrop" call ZEVLog;
};
_hc setFuel 1;
_hc engineOn true;
_hc flyInHeight 200;
_hc addEventHandler ["GetIn",{
	if (isPlayer (_this select 2)) then {
		(_this select 2) action ["getOut",(_this select 0)]; 
		0 = [nil,(_this select 2),"loc",rTITLETEXT,"Players are not permitted to enter AI vehicles!","PLAIN DOWN",5] call RE;
		/*(_this select 0) setVehicleLock "LOCKED";*/
	};
}];
_ai assignAsDriver _hc;
_ai moveInDriver _hc;
_hc setVehicleAmmo 1;
_gunnerSpots = _hc emptyPositions "gunner";
_hc setVariable ["Pilot", _ai];
for "_i" from 0 to (_gunnerSpots - 1) do 
{
	_ai = [_missionObject, _grp,_aiData] call ZEVAddAIUnit;
	_ai assignAsGunner _hc;
	_ai moveInGunner _hc;
};
_grp allowFleeing 0;
_grp setBehaviour "AWARE";
_grp setSpeedMode "FULL";
_grp setCombatMode "RED";
{_x doMove [(_dropPos select 0), (_dropPos select 1), 100]} foreach (units _grp);	
[_hc] spawn ZEVVehicleRearm;	
_drop = true;
while {( alive _hc)&&(_drop)} do 
{
	sleep 1;
	_helipos = getpos _hc;
	
	if (_helipos distance [(_dropPos select 0),(_dropPos select 1),100] <= 200) then 
	{
		_h = [_missionObject, _hc, [_aiData, _routesData, _squadMin, _squadMax, _side]] spawn ZEVAddParadropDrop;
		_drop = false;
		waitUntil {scriptDone _h};
	};
};
if (isNull _hc) exitWith { "ParadropStart: Helicopted is nill" call ZEVLog; };
_ai =  _hc getVariable "Pilot";
_ai doMove [(_startPos select 0), (_startPos select 1), 200];
_cleanheli = True;
while {_cleanheli} do 
{
	_ai doMove [(_startPos select 0), (_startPos select 1), 200];
	sleep 20;
	_helipos = getpos _hc;
	if ((_helipos distance [(_startPos select 0),(_startPos select 1),200] <= 400) OR (!alive _hc)) then 
	{
		deleteVehicle _hc;
		{deleteVehicle _x} forEach (units _grp);
		_cleanheli = False;
	};
};