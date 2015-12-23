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
private ["_itemType","_itemsQty","_items","_object","_rndList","_missionIndex","_static"];

_object		= _this select 0;
_itemType 	= _this select 1;
_itemsQty 	= _this select 2;
_items		= _this select 3;
_missionIndex = _this select 4;
_static		= _this select 5;

clearWeaponCargoGlobal _object;
clearMagazineCargoGlobal _object;

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBPGear:  _object: %1 ", 	_object]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBPGear:  _itemType: %1 ", 	_itemType]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBPGear:  _itemsQty: %1 ", 	_itemsQty]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBPGear:  _items: %1 ", 	_items]; };

if(_itemType == "Random") then
{
	_rndList = ZEVItemList;
};
if(_itemType == "RandomList") then
{
	switch(_Static) do
	{
		case 0: {_rndList = ZEVBackpackGearRandomList select _missionIndex;};
		case 1: {_rndList = ZEVStaticBackpackGearRandomList select _missionIndex;};
	};
	
	_itemType = "Random";
};


if(_itemType == "Random") then
{
	private ["_cnt", "_item","_i"];
	_cnt = round(random(ZEVRandomLootBPackCnt)) + 1;
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  random itm Qty = %1 ", _cnt]; };
	
	for "_i" from 1 to _cnt do 
	{
		_item = _rndList call BIS_fnc_selectRandom;
		if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  add random _item = %1 ", _item]; };		
		_object addMagazineCargoGlobal [_item, 1];
	};	
}
else
{
	if (_itemType == "Specified") then
	{
		private ["_itemName", "_itemCountType", "_itemQty","_i","_itemRandomList","_itemNameFact"];
		if(_itemsQty > 0) then
		{
			{
				_itemName		= _x select 0;
				_itemCountType	= _x select 1;
				_itemQty		= _x select 2;
				_itemRandomList = _x select 3;
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  _itemName = %1 ", _itemName]; };
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  _itemCountType = %1 ", _itemCountType]; };
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  _itemQty = %1 ", _itemQty]; };
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddGear:  _itemRandomList = %1 ", _itemRandomList]; };
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
					_object addMagazineCargoGlobal [_itemNameFact, 1];
				};	
			}foreach _items;
		};
	};
};