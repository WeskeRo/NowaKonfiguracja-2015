private ["_randomList","_aiVest","_aiunit","_bpData","_bpParms","_vestChilds","_parms","_nameType","_vestName","_globalRandomList"];
_aiunit				= _this select 0;
if ((isNil "_aiunit") || (isNull _aiunit)) exitWith
{
	"AI object is NULL, abort adding vest" call ZEVLog;
};
/*
_bpData				= _this select 1;
_bpParms			= _bpData select 1;
_vestChilds			= _bpData select 2;
_parms				= [_bpParms, [ZEVNameType,ZEVVestName]] call ZEVGetProperty;
_nameType			= _parms select 0;
_vestName				= _parms select 1;
if (_vestName == "NONE") exitWith { "AddVest: No Vest selected" call ZEVLog};

_randomList			= [_bpParms, ZEVVestName] call ZEVGetPropertyRandomList;
_globalRandomList	= ZEVVestName call ZEVGetGlobalRandomList;
_vestName				= [_nameType, _vestName, _randomList, _globalRandomList] call ZEVSelect;
format ["ZEV: add vest %1 for %2", _vestName, _aiunit] call ZEVLog;
_aiunit addVest _vestName;
_aiVest 	= vestContainer _aiunit;
if(!isNull _aiVest) then
{
	clearWeaponCargoGlobal 		_aiVest;
	clearMagazineCargoGlobal 	_aiVest;
	[_aiVest, _vestChilds select 0, ZEVPrimaryWeapon, true] call ZEVAddItemToObject;
	[_aiVest, _vestChilds select 1, ZEVItemName, true]  call ZEVAddItemToObject;
};
*/

