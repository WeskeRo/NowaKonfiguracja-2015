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
private ["_dot","_position","_Marker","_name","_missionIndex", "_size",
"_isMissionRunning","_markerName","_markerDotName","_missionParms","_static","_markerColor"];
_position 		= _this select 0;
_name 			= _this select 1;
_missionIndex 	= _this select 2;
_size 			= _this select 3;
_static 		= _this select 4;
_markerColor	= _this select 5;
_Marker 		= "";
_dot 			= "";

if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionAddMarker:  _this = %1 ", _this]; };
//_missionParms 	= ZEVActiveMissionParm select _missionIndex;// [_locationPos, _locationRadius, _locationTriggerRadius]];
_missionParms = [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionAddMarker:  _missionParms = %1 ", _missionParms]; };
_position		= _missionParms select 0;
if(_size < 200) then
{
	_size = 200;
};
_isMissionRunning = [_missionIndex, _static] call ZEVMissionGetMarkerStatus;
if(ZEVMissionDebug > 0) then {diag_log format["ZEVMission - ZEVMissionAddMarker:  _isMissionRunning = %1 ", _isMissionRunning]; };

_markerName		= format["mission_%1_%2",_missionIndex, _static];
_markerDotName  = format["dot_%1_%2_%3",_name,_missionIndex, _static];

while { _isMissionRunning > 0} do 
{
	_Marker = createMarker [_markerName, _position];
	_Marker setMarkerColor _markerColor;
	_Marker setMarkerShape "ELLIPSE";
	_Marker setMarkerBrush "Grid";
	_Marker setMarkerSize [_size,_size];
	_Marker setMarkerText _name;
	_dot = createMarker [_markerDotName, _position];
	_dot setMarkerColor "ColorBlack";
	_dot setMarkerType "mil_dot";
	_dot setMarkerText _name;
	sleep 30;
	deleteMarker _Marker;
	deleteMarker _dot;
	_isMissionRunning = [_missionIndex, _static] call ZEVMissionGetMarkerStatus;
	_missionParms = [_missionIndex, _static] call ZEVMissionGetActiveMissionParms;
	_position		= _missionParms select 0;
};
