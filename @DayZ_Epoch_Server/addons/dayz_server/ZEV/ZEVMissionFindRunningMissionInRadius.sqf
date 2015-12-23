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
private ["_pos","_ret","_runStatus","_radius","_parmRadius","_parmTrigRadius","_parmPos","_parm","_static","_ZEVActiveMissionParm","_ZEVMissionInProgress"];
_pos 	= _this select 0;
_radius = _this select 1;
_static = _this select 2;
_ret = 0;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionFindRunningMissionInRadius(Static = %2):  _this = %1 ", _this, _static]; };
switch(_static) do
{
	case 0: {_ZEVActiveMissionParm = ZEVActiveMissionParm};
	case 1: {_ZEVActiveMissionParm = ZEVStaticActiveMissionParm};
};
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionFindRunningMissionInRadius(Static = %2):  _ZEVActiveMissionParm = %1 ", _ZEVActiveMissionParm, _static]; };
_ZEVMissionInProgress = [_static] call ZEVMissionGetMissionInProgress;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionFindRunningMissionInRadius(Static = %2):  _ZEVMissionInProgress = %1 ", _ZEVMissionInProgress, _static]; };

for "_i" from 0 to count _ZEVActiveMissionParm - 1 do 
{
	_runStatus = _ZEVMissionInProgress select _i;
	if(_runStatus == 1) then
	{
		_parm 			= _ZEVActiveMissionParm select _i;
		_parmPos 		= _parm select 0;
		_parmRadius 	= _parm select 1;
		_parmTrigRadius = _parm select 2;
		
		if((_pos distance _parmPos) <  (_parmTrigRadius + _radius)) then
		{
			_ret = _ret + 1;
		};
	};
};
if (_static == 1) then 
{
	_ret = 0;
};
_ret