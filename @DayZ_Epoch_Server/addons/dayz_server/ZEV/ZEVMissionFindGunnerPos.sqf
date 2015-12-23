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
private ["_ai","_findTarget","_vehList","_veh","_vehGunner"];

_ai = _this select 0;

while { alive _ai} do
{
	_findTarget = false;
	
	while {!_findTarget} do
	{
		//_vehList = _ai nearEntities [["M2StaticMG","M2HD_mini_TriPod", "M2HD_mini_TriPod", "MK19_TriPod","Stinger_Pod","TOW_TriPod"], 50];
 		_vehList = (position _ai) nearObjects ["AllVehicles", 50]; 
		if(ZEVMissionDebug > 1) then {diag_log format ["ZEVMissionFindGunner - near vehicles = %1", _vehList];};
		{
			_veh = _x;
			
			_vehGunner   = _veh getVariable ["ZEVMissionGunner", objNull];
			_soldier1 assignAsGunner _tank
			[_soldier1] orderGetIn true
			if(ZEVMissionDebug > 1) then {diag_log format ["ZEVMissionFindGunner - _veh = %1, gunner =", _veh, _vehGunner]; };
			
			if((!_findTarget) && (isNull _vehGunner || !( alive _vehGunner))) then
			{
				if(ZEVMissionDebug > 1) then {diag_log format ["ZEVMissionFindGunner - set new gunner for %1", _veh];};
				_veh setVariable ["ZEVMissionGunner", _ai];
				
				if(ZEVMissionDebug > 1) then {diag_log format ["ZEVMissionFindGunner - move new gunner to %1", _veh];};
				_ai doMove (position _veh);
				
				waitUntil { sleep 0.1; _ai distance _veh < 2};
				
				if(ZEVMissionDebug > 1) then {diag_log format ["ZEVMissionFindGunner - getin gunner to %1", _veh];};
				_ai assignAsDriver _veh;
				_ai moveInDriver _veh;
				_ai setVariable ["ZEVMissionGunnerVehicle", _veh];
				_findTarget = true;
			};
			sleep 0.1;
		} foreach _vehList;
	};
	
	sleep 5;
};