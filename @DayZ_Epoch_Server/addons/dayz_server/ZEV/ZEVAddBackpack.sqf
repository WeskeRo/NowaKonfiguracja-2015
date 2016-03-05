private ["_randomList","_aiUnitBackPack","_aiunit","_bpData","_bpParms","_bpChilds","_parms","_nameType","_bpName","_globalRandomList"];
_aiunit				= _this select 0;
if ((isNil "_aiunit") || (isNull _aiunit)) exitWith
{
	"AI object is NULL, abort adding backpack" call ZEVLog;
};

_bpData				= _this select 1;
_bpParms			= _bpData select 1;
_bpChilds			= _bpData select 2;
_parms				= [_bpParms, [ZEVNameType,ZEVBackpackName]] call ZEVGetProperty;
_nameType			= _parms select 0;
_bpName				= _parms select 1;
if (_bpName == "NONE") exitWith { "AddBackPack: No backpack selected" call ZEVLog};

_randomList			= [_bpParms, ZEVBackpackName] call ZEVGetPropertyRandomList;
_globalRandomList	= ZEVBackpackName call ZEVGetGlobalRandomList;
_bpName				= [_nameType, _bpName, _randomList, _globalRandomList] call ZEVSelect;
format ["ZEV: add backpack %1 for %2", _bpName, _aiunit] call ZEVLog;
_aiunit addBackpack _bpName;
_aiUnitBackPack 	= unitBackpack _aiunit;
if (!isNull _aiUnitBackPack) then
{
	clearWeaponCargoGlobal 		_aiUnitBackPack;
	clearMagazineCargoGlobal 	_aiUnitBackPack;
	[_aiUnitBackPack, _bpChilds select 0, ZEVPrimaryWeapon, true] call ZEVAddItemToObject;
	[_aiUnitBackPack, _bpChilds select 1, ZEVItemName, true]  call ZEVAddItemToObject;
};
	

