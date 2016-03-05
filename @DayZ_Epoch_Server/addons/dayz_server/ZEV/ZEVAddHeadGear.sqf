private ["_randomList","_aiUnitBackPack","_aiunit","_bpData","_bpParms","_bpChilds","_parms","_nameType","_headGearName","_globalRandomList"];
_aiunit				= _this select 0;
if ((isNil "_aiunit") || (isNull _aiunit)) exitWith
{
	"AI object is NULL, abort adding headgear" call ZEVLog;
};
/*
_bpData				= _this select 1;
_bpParms			= _bpData select 1;
_bpChilds			= _bpData select 2;
_parms				= [_bpParms, [ZEVNameType,ZEVHeadGearName]] call ZEVGetProperty;
_nameType			= _parms select 0;
_headGearName				= _parms select 1;
if (_headGearName == "NONE") exitWith { "Addheadgear: No headgear selected" call ZEVLog};

_randomList			= [_bpParms, ZEVHeadGearName] call ZEVGetPropertyRandomList;
_globalRandomList	= ZEVHeadGearName call ZEVGetGlobalRandomList;
_headGearName				= [_nameType, _headGearName, _randomList, _globalRandomList] call ZEVSelect;
format ["ZEV: add headgear %1 for %2", _headGearName, _aiunit] call ZEVLog;
_aiunit addHeadgear _headGearName;
*/