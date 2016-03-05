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
private ["_partNode","_partName","_partParms","_weaponParts","_weaponData","_weaponTag","_weaponParms","_aiunit","_magazineQty","_parms","_nameType","_weaponName","_randomList","_globalRandomList","_magazines","_magazine"];
_aiunit					= _this select 0;
_weaponData				= _this select 1;
_weaponTag				= ZEVPrimaryWeapon;
format ["AddWeapon _this =  %1",_this] call ZEVLog;

if ( count _this > 2) then
{
	_weaponTag = _this select 2;
};
_weaponParms		= _weaponData select 1;
_parms				= [_weaponParms, [ZEVNameType,_weaponTag,ZEVMagazineQty]] call ZEVGetProperty;
_nameType			= _parms select 0;
_weaponName			= _parms select 1;
if(_weaponName == "NONE") exitWith { "addWeapon: no weapon selected" call ZEVLog;};
_magazineQty		= _parms select 2;
_randomList			= [_weaponParms, _weaponTag] call ZEVGetPropertyRandomList;
_globalRandomList	= _weaponTag call ZEVGetGlobalRandomList;
format ["ZEV: addWeapon: _weaponName=%1, _magazineQty=%2", _weaponName, _magazineQty] call ZEVLog;
_weaponName 		= [_nameType, _weaponName, _randomList, _globalRandomList] call ZEVSelect;
if (_magazineQty == 0) then
{
	_magazineQty = 1 + random(3);
};
_aiunit setVariable [_weaponTag, _weaponName];
format ["AddWeapon:  _weaponName %1", _weaponName] call ZEVLog;
if (isClass(configFile >> "CfgWeapons" >> _weaponName)) then
{
	_magazines	= getArray (configFile >> "cfgWeapons" >> _weaponName >> "magazines");
	_magazine 	= _magazines select 0;
	format ["Addweapon:  ammo %1", 	_magazine] call ZEVLog;
	_aiunit addweapon _weaponName;
	for "_i" from 1 to _magazineQty do 
	{
		_aiunit addMagazine _magazine;
	};
/*
	_weaponParts	= _weaponData select 2;
	format["AddWeapon: weapon parts = %1", _weaponParts] call ZEVLog;
	{
		if ( typeName _x == "ARRAY") then
		{
			_partNode  = (_x select 0)+"Name";
			_partParms = _x select 1;
			_parms				= [_partParms, [ZEVNameType, _partNode]] call ZEVGetProperty;
			_nameType			= _parms select 0;
			_partName			= _parms select 1;			
			_randomList			= [_partParms, _partNode] call ZEVGetPropertyRandomList;
			_globalRandomList	= _partNode call ZEVGetGlobalRandomList;
			format ["ZEV: addWeaponPart: _partName=%1", _partName] call ZEVLog;
			_partName 			= [_nameType, _partName, _randomList, _globalRandomList] call ZEVSelect;
			format["AddWeapon: _partName = %1", _partName] call ZEVLog;
			if(_partName != "NONE") then
			{
				_aiunit addPrimaryWeaponItem _partName;
			};
		};
	} foreach _weaponParts;	
*/
}
else
{
	format ["AddWeapon:  used non-valid: %1", _weaponName] call ZEVLog;
};

