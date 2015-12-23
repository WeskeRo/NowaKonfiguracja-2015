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
private ["_vehicle","_lootKind", "_vehicleLootType","_vehicleLootItemsQty","_vehicleLootItems",
"_weapon","_mags","_magsQty","_item","_cnt", "_missionIndex","_rndList","_static","_itemRandomList","_vehicleLootItemName","_vehicleLootItemNameFact"];

_vehicle 				= _this select 0;
_lootKind 				= _this select 1; //weapon or mags(items)
_vehicleLootType 		= _this select 2;
_vehicleLootItemsQty	= _this select 3;
_vehicleLootItems		= _this select 4;
_static					= _this select 5;

if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  _vehicle = %1 ", _vehicle]; };
if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  _lootKind = %1 ", _lootKind]; };
if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  _vehicleLootType = %1 ", _vehicleLootType]; };
if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  _vehicleLootItemsQty = %1 ", _vehicleLootItemsQty]; };
if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  _vehicleLootItems = %1 ", _vehicleLootItems]; };

_missionIndex  = _vehicle getVariable "ZEVMissionIndex";
if (_vehicleLootType == "Random") then
{
	if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  get random selection %1 ", ""]; };
	
	if (_lootKind == "weapon") then
	{
		_cnt = round ( random (ZEVRandomLootGunCnt) + 1);
		if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  weapon random qty = %1 ", _cnt]; };
		for "_i" from 1 to _cnt do 
		{
			_weapon		= ZEVGunList call BIS_fnc_selectRandom;
			_mags 		= getArray (configFile >> "cfgWeapons" >> _weapon >> "magazines");

			if (ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddLoot  add random weapon  = %1 ", _weapon]; };
			if (ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddLoot  add random mags  = %1 ", _mags]; };
			_vehicle addWeaponCargoGlobal 	[_weapon, 1];
			_magsQty = round ( random (ZEVRandomLootMagsCnt)) + 1;
			if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  add random _magsQty  = %1 ", _magsQty]; };
			_vehicle addMagazineCargoGlobal [(_mags select 0), _magsQty];
		};

		_cnt = round ( random (ZEVRandomLootToolCnt) + 1);
		if(ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  tool random qty = %1 ", _cnt]; };
		for "_i" from 1 to _cnt do 
		{
			_tool = ZEVToolList call BIS_fnc_selectRandom;
			if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  add random tool  = %1 ", _tool]; };
			_vehicle addWeaponCargoGlobal [_tool, 1];
		};
	};
	if (_lootKind == "magazine") then
	{
		_cnt = round ( random (ZEVRandomLootItemCnt) + 1);
		if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  items random qty = %1 ", _cnt]; };
		for "_i" from 1 to _cnt do 
		{
			_item = ZEVItemList call BIS_fnc_selectRandom;
			if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  add random item  = %1 ", _item]; };
			_vehicle addMagazineCargoGlobal [_item,1];
		};	
	};
}
else   
{
	if (_vehicleLootType == "Specified") then
	{
		if (ZEVMissionDebug > 0) then { diag_log format ["ZEVMission - AddLoot  get Specified selection %1 ", ""]; };
		if (_vehicleLootItemsQty > 0) then
		{
			{
				_vehicleLootItemName	= _x select 0;
				_vehicleLootCountType	= _x select 1;
				_vehicleLootQty			= _x select 2;
				_itemRandomList			= _x select 3;
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - _vehicleLootItemName  = %1 ", _vehicleLootItemName]; };
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - _vehicleLootCountType  = %1 ", _vehicleLootCountType]; };
				if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - _vehicleLootQty  = %1 ", _vehicleLootQty]; };
				
				if(_vehicleLootCountType == "Random") then
				{
					_vehicleLootQty = random(2) + 1;
					if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - random _vehicleLootQty  = %1 ", _vehicleLootQty]; };
				};
				for "_i" from 1 to _vehicleLootQty do
				{
					_vehicleLootItemNameFact = _vehicleLootItemName;
					if(_lootKind == "weapon") then
					{
						if(_vehicleLootItemNameFact == "Random") then
						{
							_vehicleLootItemNameFact = ZEVGunList call BIS_fnc_selectRandom;
						};
						if(_vehicleLootItemNameFact == "RandomList") then
						{
							_rndList = _itemRandomList;
							_vehicleLootItemNameFact = _rndList call BIS_fnc_selectRandom;
						};
						if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - add weapon /  qty = %1 / %2", _vehicleLootItemNameFact, _vehicleLootQty]; };
						_vehicle addWeaponCargoGlobal [_vehicleLootItemNameFact, 1];
						
						if(isClass(configFile >> "CfgWeapons" >> _vehicleLootItemNameFact)) then
						{
							_mags 		= getArray (configFile >> "cfgWeapons" >> _vehicleLootItemNameFact >> "magazines");
							_vehicle addMagazineCargoGlobal [(_mags select 0), 1 + random(2)];
						};
					};
					if(_lootKind == "magazine") then
					{
						if(_vehicleLootItemNameFact == "Random") then
						{
							_vehicleLootItemNameFact = ZEVItemList call BIS_fnc_selectRandom;
						};
						if(_vehicleLootItemNameFact == "RandomList") then
						{
							_rndList = _itemRandomList;
							_vehicleLootItemNameFact = _rndList call BIS_fnc_selectRandom;
						};
						
						if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - add item /  qty = %1 / %2", _vehicleLootItemNameFact, _vehicleLootQty]; };
						_vehicle addMagazineCargoGlobal [_vehicleLootItemNameFact, 1];
					};
					
				};
			}foreach _vehicleLootItems;
		};
	};
};

