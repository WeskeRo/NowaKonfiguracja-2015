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
private ["_static", "_ret", "_index","_value"];

_index  = _this select 0;
_static = _this select 1;
_value  = _this select 2;

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionSetMissionInProgress(Static = %2): mission idx = %1", _index,_static]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionSetMissionInProgress(Static = %2): ZEVMissionInProgress = %1", ZEVMissionInProgress,_static]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionSetMissionInProgress(Static = %2): ZEVStaticMissionInProgress = %1", ZEVStaticMissionInProgress,_static]; };
switch(_static) do
{
	case 0: {ZEVMissionInProgress set [_index, _value];};
	case 1: {ZEVStaticMissionInProgress set [_index, _value];};
};
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionSetMissionInProgress(Static = %2): ZEVMissionInProgress = %1", ZEVMissionInProgress,_static]; };
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionSetMissionInProgress(Static = %2): ZEVStaticMissionInProgress = %1", ZEVStaticMissionInProgress,_static]; };
