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
private ["_missionIndex","_ai","_aibackpackName","_aibackpackItems","_randomList","_static","_aibpRandomList"];

_missionIndex		= _this select 0;
_ai					= _this select 1;
_aibackpackName		= _this select 2;
_aibackpackItems	= _this select 3;
_static				= _this select 4;
_aibpRandomList		= _this select 5;

if(_aibackpackName != "NONE") then
{
	private ["_itemType", "_items", "_aiUnitBackPack","_itemsQty"];
	
	if(_aibackpackName == "RandomList") then
	{
		_randomList = _aibpRandomList;
		
		if(count _randomList > 0) then
		{
			_aibackpackName = _randomList call BIS_fnc_selectRandom;
		}
		else
		{
			_aibackpackName = "Random";
		};
	};

	if(_aibackpackName == "Random") then
	{
		_aibackpackName = ZEVBackpackList call BIS_fnc_selectRandom;
	};
	
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBackPack:  add AI backpack  %1", _aibackpackName]; };

    _ai addBackpack _aibackpackName;
	
	_aiUnitBackPack = unitBackpack _ai;
	
	_itemType 	= _aibackpackItems select 0;
	_itemsQty 	= _aibackpackItems select 1;
	_items		= _aibackpackItems select 2;

	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBackPack:  add AI _itemType  %1", _itemType]; };
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBackPack:  add AI _itemsQty  %1", _itemsQty]; };
	if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - AddBackPack:  add AI _items  %1", _items]; };
	
	[_aiUnitBackPack, _itemType, _itemsQty, _items, _missionIndex, _static] call ZEVMissionAddBackPackGear;
};
