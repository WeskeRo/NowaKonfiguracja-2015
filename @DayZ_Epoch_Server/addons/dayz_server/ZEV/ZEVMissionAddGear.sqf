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
private ["_itemType","_itemsQty","_items","_object","_rndList","_missionIndex","_cnt","_item","_itemName","_itemCountType","_itemQty","_static","_itemRandomList","_itemNameFact"];

_object		= _this select 0;
_itemType 	= _this select 1;
_itemsQty 	= _this select 2;
_items		= _this select 3;
_missionIndex = _this select 4;
_static 	= _this select 5;

clearWeaponCargoGlobal 		_object;
clearMagazineCargoGlobal 	_object;

if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _object: %1 ", 	_object]; };
if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemType: %1 ", 	_itemType]; };
if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemsQty: %1 ", 	_itemsQty]; };
if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _items: %1 ", 	_items]; };
_rndList = [];
if(_itemType == "Random") then
{
	_rndList = ZEVItemList;
};
if(_itemType == "RandomList") then
{
	switch(_static) do
	{
		case 0: {_rndList = ZEVGearRandomList select _missionIndex;};
		case 1: {_rndList = ZEVStaticGearRandomList select _missionIndex;};
	};
	
	if(count _rndList == 0) then 
	{
		_rndList = ZEVItemList;
	};
	_itemType = "Random";
};
if(_itemType == "Random") then
{
	_cnt = round(random(ZEVRandomLootBPackCnt)) + 1;
	
	if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  random itm Qty = %1 ", _cnt]; };
	
	for "_i" from 1 to _cnt do 
	{
		_item = _rndList call BIS_fnc_selectRandom;
		if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  add random _item = %1 ", _item]; };		
		_object addMagazine _item;
	};	
}
else
{
	if (_itemType == "Specified") then
	{
		if(_itemsQty > 0) then
		{
			{
				_itemName		= _x select 0;
				_itemCountType	= _x select 1;
				_itemQty		= _x select 2;
				_itemRandomList = _x select 3;
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemName = %1 ", _itemName]; };
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemCountType = %1 ", _itemCountType]; };
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemQty = %1 ", _itemQty]; };
				if(ZEVMissionDebug > 1) then {diag_log format["ZEVMission - AddGear:  _itemRandomList = %1 ", _itemRandomList]; };
				
				if(_itemCountType == "Random")then
				{
					_itemQty = round(random(ZEVRandomLootBPackCnt)) + 1;
				};
				
				
				for "_i" from 1 to _itemQty do 
				{
					_itemNameFact = _itemName;
					if(_itemNameFact == "RandomList") then
					{
						if( count _itemRandomList > 0) then
						{
							_itemNameFact = _itemRandomList call BIS_fnc_selectRandom;
						}
						else
						{
							_itemNameFact = "Random";
						};
					};
					if(_itemNameFact == "Random") then
					{
						_itemNameFact = ZEVItemList call BIS_fnc_selectRandom;
					};
					_object addMagazine _itemNameFact;
				};	
			} foreach _items;
		};
	};
};
