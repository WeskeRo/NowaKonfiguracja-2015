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
private ["_missionParms","_static","_idx","_nul","_missionCountAtSameTime"];

"ZEVMissionRunStatic: start" call ZEVLog; 
_idx = 0;
{
	_missionParms 	= _x;
	_static 		= _missionParms select 8;
	if(_static == ZEVYES) then
	{
		ZEVMissionInProgress set [_idx, 1];
		_nul = [_idx, _missionParms] execVM "\z\addons\dayz_server\ZEV\ZEVMissionStart.sqf";
		_missionCountAtSameTime = _missionCountAtSameTime + 1;
	};
	_idx = _idx + 1;
}foreach ZEVMissionList;
