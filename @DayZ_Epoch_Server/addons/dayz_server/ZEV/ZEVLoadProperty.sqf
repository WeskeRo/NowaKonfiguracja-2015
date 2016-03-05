private ["_missionObject", "_missionProps"];
_missionObject = _this select 0;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort LoadProperty" call ZEVLog;
};

_missionProps  = _this select 1;
format["Load props for: %1",_missionObject] call ZEVLog;
format["Props: %1",_missionProps] call ZEVLog;
{
	private ["_varName","_varValue", "_varRandomList"];
	_varName 		= _x select 0;
	_varValue		= _x select 1;
	_varRandomList 	= _x select 2;
	_missionObject setVariable [_varName, _varValue, true];
	_missionObject setVariable [format ["%1_randomList",_varName], _varRandomList, true];
	format["ZEVMission: propName = %1, propValue = %2 ", _varName, _varValue] call ZEVLog;
} foreach _missionProps;
