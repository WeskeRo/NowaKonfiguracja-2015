private ["_randomList","_uniform","_aiunit","_bpData","_bpParms","_vestChilds","_parms","_nameType","_uniformName","_globalRandomList"];
_aiunit				= _this select 0;
if ((isNil "_aiunit") || (isNull _aiunit)) exitWith
{
	"AI object is NULL, abort adding uniform" call ZEVLog;
};
/*
_bpData				= _this select 1;
_bpParms			= _bpData select 1;
_vestChilds			= _bpData select 2;
_parms				= [_bpParms, [ZEVNameType,ZEVUniformName]] call ZEVGetProperty;
_nameType			= _parms select 0;
_uniformName				= _parms select 1;
if (_uniformName == "NONE") exitWith { "AddUniform: No uniform selected" call ZEVLog};

_randomList			= [_bpParms, ZEVUniformName] call ZEVGetPropertyRandomList;
_globalRandomList	= ZEVUniformName call ZEVGetGlobalRandomList;
_uniformName				= [_nameType, _uniformName, _randomList, _globalRandomList] call ZEVSelect;
format ["ZEV: add uniform %1 for %2", _uniformName, _aiunit] call ZEVLog;
_aiunit addUniform _uniformName;
_uniform 	= uniformContainer _aiunit;
if(!isNull _uniform) then
{
	clearWeaponCargoGlobal 		_uniform;
	clearMagazineCargoGlobal 	_uniform;
	[_uniform, _vestChilds select 0, ZEVPrimaryWeapon, true] call ZEVAddItemToObject;
	[_uniform, _vestChilds select 1, ZEVItemName, true]  call ZEVAddItemToObject;
};
*/
