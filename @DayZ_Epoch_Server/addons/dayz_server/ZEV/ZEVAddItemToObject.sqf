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
private ["_magsQty","_mags","_isWeapon","_isMagazine","_firstItem","_itemHolder","_items","_object","_itemName","_cargo","_qty","_name","_itemParms","_parms","_randomList","_nameType","_qtyType","_globalRandomList","_type"];
_object		= _this select 0;//object
if ((isNil "_object") || (isNull _object)) exitWith
{
	"object is NULL, abort adding item to object creation" call ZEVLog;
};

_itemHolder	= _this select 1;
_type		= _this select 2;
_cargo		= false;
(str _this) call ZEVLog;
format ["_itemHolder = %1",_itemHolder] call ZEVLog;
_items = _itemHolder select 2;
if (count _this > 3) then
{
	_cargo = _this select 3;
};
_firstItem = _items select 0;
(str _firstItem) call ZEVLog;
if (typeName _firstItem == "ARRAY") then
{
	{
		(str _x) call ZEVLog;
		_itemParms 		= _x select 1;
		_parms 			= [_itemParms, [ZEVNameType, _type, ZEVQtyType,ZEVQty]] call ZEVGetProperty;
		_randomList		= [_itemParms, _type] call ZEVGetPropertyRandomList;
		_nameType		= _parms select 0;
		_itemName		= _parms select 1;
		_qtyType		= _parms select 2;
		_qty			= _parms select 3;
		_globalRandomList= _type call ZEVGetGlobalRandomList;
		if (_qtyType == ZEVRandom) then
		{
			_qty = 1 + round(random(5));
		};
		for "_i" from 1 to _qty do 
		{
			_name			= [_nameType, _itemName, _randomList, _globalRandomList] call ZEVSelect;
			_isWeapon		= isClass(configFile>>"cfgWeapons">>_name);
			_isMagazine		= isClass(configFile>>"cfgMagazines">>_name);
			if (_isWeapon || _isMagazine) then
			{
				if (_isWeapon) then
				{
					_mags 		= getArray (configFile >> "cfgWeapons" >> _name >> "magazines");
					_magsQty 	= round ( ZEVRandomLootMagsCnt/2 + random (ZEVRandomLootMagsCnt/2)) + 1;
				};
				switch (_type) do
				{
					case "PrimaryWeapon": 	
					{ 
					
						if (_cargo) then 
						{
							_object addWeaponCargoGlobal [_name,1];
							if (count _mags > 0) then
							{
								_object addMagazineCargoGlobal [(_mags call BIS_fnc_selectRandom), _magsQty];
							};
						}
						else
						{
							_object addWeapon _name;
						};
					};
					case "SecondaryWeapon":
					{ 
						if (_cargo) then 
						{
							_object addWeaponCargoGlobal [_name,1];
							if (count _mags > 0) then
							{
								_object addMagazineCargoGlobal [(_mags call BIS_fnc_selectRandom), _magsQty];
							};
						}
						else
						{
							_object addWeapon _name;
						};
					};
					case "ItemName": 		
					{ 
						if (_cargo) then 
						{
							_object addMagazineCargoGlobal [_name,1];
						}
						else
						{
							_object addMagazine _name;
						};
					};
				};
			};
		};	
	} foreach _items;
};