//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
// 	Thanks to authors of EMS and WAI and BIS wiki for code examples
//
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://DayZMissionEditor.ru/
//  YouTube : http://www.youtube.com/channel/UCWuzUxNJ_Ctf9ynoJqiV2ww
//
//-----------------------------------------------------------//
private ["_aiunit","_aiGroup","_missionIndex","_locationPos","_locationRadius","_groupData",
"_AIParmsQty","_aiSide","_aiFormation","_aiGroupType","_aiSquadQty","_helliClass","_wp0","_wp1","_AIData","_routeData",
"_aiName","_aiPosType","_aiPos","_behaviour","_combatmode","_armor","_aiweaponAndMag","_aigear","_aibackpack","_aiskillsParms","_startPos",
"_dropPos","_helicopter","_gunnerSpots","_aiSkillsValueType","_aiSkills","_drop",
"_helipos","_cleanheli","_dropDelay","_missionParms","_static","_aiSquadQtyMax"];
 
	_aiunit 	= objNull;

	_missionIndex	= _this select 0;
	_groupData		= _this select 1;
	_static			= _this select 2;
	
	_missionParms 	= [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;//[_locationPos, _locationRadius, _locationTriggerRadius]];	
	_locationPos	= _missionParms select 0;
	_locationRadius = _missionParms select 1;
    
	_AIParmsQty			= _groupData select 0;
	_aiSide				= _groupData select 1;
	_aiFormation		= _groupData select 2;
	_aiGroupType		= _groupData select 3;
	_aiSquadQty			= _groupData select 4;
	_helliClass			= _groupData select 5;
	_wp0				= _groupData select 6;
	_wp1				= _groupData select 7;
	_AIData 			= _groupData select 8;//бот
	_routeData			= _groupData select 9;//маршрут группы
	_dropDelay			= _groupData select 10;//маршрут группы
	_aiSquadQtyMax		= _groupData select 11;
	
	sleep _dropDelay;

	if (_aiSquadQty < 1 ) then { _aiSquadQty = 1; };
	if (_aiSquadQty > _aiSquadQtyMax) then { _aiSquadQtyMax = _aiSquadQty};

	_aiSquadQty = _aiSquadQty + floor(random(_aiSquadQtyMax - _aiSquadQty));
	
	if(_aiSide == "EAST") then
	{
		_aiGroup 	= createGroup EAST;	
	};
	if(_aiSide == "Resistance") then
	{
		_aiGroup 	= createGroup Resistance;	
	};
	if(_aiSide == "Civilian") then
	{
		_aiGroup 	= createGroup Civilian;	
	};

	_aiGroup setFormation _aiFormation;	
	_aiGroup setVariable ["ZEVMissionIndex", _missionIndex, true];
	_aiGroup setVariable ["ZEVMissionStatic", _static, true];

	_aiName			= _AIData select 0;
	_aiPosType		= _AIData select 1;
	_aiPos			= _AIData select 2;
	_behaviour		= _AIData select 3;
	_combatmode		= _AIData select 4;
	_armor			= _AIData select 5;
	_aiweaponAndMag = _AIData select 6;//["weapon",magsQty];
	_aigear			= _AIData select 7;
	_aibackpack		= _AIData select 8;
	_aiskillsParms  = _AIData select 9;
    
	_aiSkillsValueType = _aiskillsParms select 0;
	_aiSkills		   = _aiskillsParms select 1;
	
	_startPos 		= _wp0 select 2;
	_startPos 		= [_startPos, "Specified", _locationPos, _locationRadius] call ZEVMissionSelectPos;
	_dropPos		= _wp1 select 2;
	_dropPos 		= [_dropPos, "Specified", _locationPos, _locationRadius] call ZEVMissionSelectPos;
	
	
	_aiunit = [_aiGroup,_AIData] call ZEVMissionAddAIUnit;
	
	_helicopter = createVehicle [_helliClass, [(_startPos select 0),(_startPos select 1), 200], [], 0, "FLY"];
	_helicopter setFuel 1;
	_helicopter engineOn true;
	_helicopter flyInHeight 150;
	_helicopter setVariable ["ObjectID","1",true];
	
	_helicopter addEventHandler ["GetIn",{
		if (isPlayer (_this select 2)) then {
			(_this select 2) action ["getOut",(_this select 0)]; 
			0 = [nil,(_this select 2),"loc",rTITLETEXT,"Players are not permitted to enter AI vehicles!","PLAIN DOWN",5] call RE;
			/*(_this select 0) setVehicleLock "LOCKED";*/
		};
	}];
	
	PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _helicopter];	

	_aiunit assignAsDriver _helicopter;
	_aiunit moveInDriver _helicopter;
	
	_helicopter setVehicleAmmo 1;
	
	_gunnerSpots = _helicopter emptyPositions "gunner";
	_helicopter setVariable ["Pilot", _aiunit];
	for "_i" from 0 to (_gunnerSpots - 1) do 
	{
		_aiName createUnit [[0,0,0], _aiGroup, "_aiunit=this;",1,"PRIVATE"];
		[_aiunit] joinSilent _aiGroup; // !!!!!!!!!!!!
		[_aiunit, 	_aiSkills, _aiSkillsValueType] call ZEVMissionSetupSkills;

		_aiunit setVariable ["unithealth",[12000,0,0]];
		_aiunit setVariable ["removeNVG",1];
		_aiunit setVariable ["unconscious",true];	//Prevent AI heli crew from being knocked unconscious
		_aiunit addWeapon "NVGoggles";

		_aiunit assignAsGunner _helicopter;
		_aiunit moveInGunner _helicopter;
		_aiunit setVariable ["ZEVMissionIndex", _missionIndex];
		_aiunit setVariable ["ZEVMissionStatic", _static];
	};

	{_x addweapon "Makarov";_x addmagazine "8Rnd_9x18_Makarov";_x addmagazine "8Rnd_9x18_Makarov";} forEach (units _aiGroup);

	_aiGroup allowFleeing 0;
	_aiGroup setBehaviour "AWARE";
	_aiGroup setSpeedMode "FULL";
	_aiGroup setCombatMode "RED";
	
	{_x doMove [(_dropPos select 0), (_dropPos select 1), 100]} forEach (units _aiGroup);	
	
	[_helicopter] spawn ZEVMissionVehicleRearm;	
	
	_drop = True;

	while {(alive _helicopter) AND (_drop)} do 
	{
		sleep 1;
		
		_helipos = getpos _helicopter;
		
		if (_helipos distance [(_dropPos select 0),(_dropPos select 1),100] <= 150) then 
		{
			_h = [_missionIndex, _aiSquadQty, _AIData, _routeData, _helicopter, _aiSide, _locationPos, _locationRadius, _static] spawn ZEVMissionAddParadropSquadDrop;
			_drop = false;
			waitUntil {scriptDone _h};
		};
	};
	
	_aiunit =  _helicopter getVariable "Pilot";
	_aiunit doMove [(_startPos select 0), (_startPos select 1), 100];
	
	_cleanheli = True;

	while {_cleanheli} do 
	{
		sleep 20;
		
		_helipos = getpos _helicopter;
		
		if ((_helipos distance [(_startPos select 0),(_startPos select 1),100] <= 400) OR (!alive _helicopter)) then 
		{
			deleteVehicle _helicopter;
			{deleteVehicle _x} forEach (units _aiGroup);
			_cleanheli = False;
		};
	};
