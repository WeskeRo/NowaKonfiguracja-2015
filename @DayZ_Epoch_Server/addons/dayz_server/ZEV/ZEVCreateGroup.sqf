//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
// 	Thanks to authors of EMS and WAI and BIS wiki for code examples
//
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://dzmissioneditor.ucoz.ru/
//
//-----------------------------------------------------------//
private ["_groups","_missionIndex","_aiGroup","_static",
		 "_missionObject","_side"];
 
	_missionObject	= _this select 0;
	_side			= _this select 1;
	if((isNil "_missionObject") || (isNull _missionObject)) exitWith
	{
		"mission object is NULL, abort adding group creation" call ZEVLog;
	};
	
	_missionIndex	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	_aiGroup = grpNull;
	while {(isNil "_aiGroup") || (_aiGroup == grpNull) || (isNull _aiGroup)} do
	{
		format ["Try to create group of side = %1",_side] call ZEVLog;
		switch (_side) do
		{
			case "EAST" : 		{_aiGroup 	= createGroup EAST;	};
			case "RESISTANCE" : {_aiGroup 	= createGroup Resistance;	};
			case "Civilian" : 	{_aiGroup 	= createGroup Civilian;	};
			case "WEST" : 		{_aiGroup 	= createGroup WEST;	};
		};
		format ["group creation result = %1",_aiGroup] call ZEVLog;
		sleep ZEVSleepSmall;
	};
_groups = [];
_groups = _missionObject getVariable [ZEVGroupList, []];	
_groups set [count _groups, _aiGroup];
_missionObject setVariable [ZEVGroupList, _groups];	
_aiGroup setVariable [ZEVIndex, _missionIndex, true];
_aiGroup setVariable [ZEVStatic, _static, true];
_aiGroup
