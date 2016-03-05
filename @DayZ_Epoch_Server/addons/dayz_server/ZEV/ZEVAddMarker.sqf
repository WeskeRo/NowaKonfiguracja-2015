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
private ["_dot","_position","_Marker","_name","_missionIndex","_size","_isMissionRunning","_markerName","_markerDotName","_static","_markerColor","_markerRadius","_markerShape","_missionObject"];

_missionObject  = _this;
if((isNil "_missionObject") || (isNull _missionObject)) exitWith
{
	"mission object is NULL, abort adding marker" call ZEVLog;
};

(str _missionObject) call ZEVLog;
_position 		= _missionObject getVariable ZEVLocationPos;
_name 			= _missionObject getVariable ZEVName;
_missionIndex 	= _missionObject getVariable ZEVIndex;
_size 			= _missionObject getVariable ZEVMarkerRadius;
_static 		= _missionObject getVariable ZEVStatic;
_markerColor	= _missionObject getVariable ZEVMarkerColor;
_markerShape	= _missionObject getVariable ZEVMarkerShape;
_Marker 		= "";
_dot 			= "";
format ["_markerShape = %1",_markerShape] call ZEVLog;
if (_size < 20) then
{
	_size = 20;
};
_isMissionRunning = [_missionIndex, _static] call ZEVGetMarkerStatus;
_markerName		= format["mission_%1_%2",_missionIndex, _static];
_markerDotName  = format["dot_%1_%2_%3",_name,_missionIndex, _static];

while { _isMissionRunning > 0 && !isNil "_missionObject" && !isNull _missionObject} do 
{
	format ["AddMarker: _missionIndex = %1, _missionObject = %2",_missionIndex,_missionObject] call ZEVLog;
	_position 		= _missionObject getVariable ZEVLocationPos;
	_Marker = createMarker [_markerName, _position];
	_Marker setMarkerColor _markerColor;
	_Marker setMarkerShape _markerShape;
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
	_isMissionRunning = [_missionIndex, _static] call ZEVGetMarkerStatus;
	
};
