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
private ["_object", "_dot","_position","_Marker","_name","_missionIndex", "_size","_isMissionRunning","_markerName","_markerDotName","_static"];


if(ZEVMissionDebug > 1) then { diag_log format ["ZEVMission: addunitMarker _this = %1", _this]; };

_object 		= _this select 0;
_name 			= _this select 1;
_missionIndex 	= _this select 2;
_size 			= _this select 3;
_static			= _this select 4;
_Marker 		= "";
_dot 			= "";

_isMissionRunning = [_missionIndex, _static] call ZEVMissionGetMarkerStatus;

if(ZEVMissionDebug > 1) then { diag_log format ["ZEVMission: addunitMarker _this = %1", _this]; };

_markerName		= format["Mission_%1_%2_%3", _missionIndex, name _object, time];
_markerDotName  = format["MissionDOT_%1_%2_%3", _missionIndex, name _object, time];
while { (_isMissionRunning > 0) and (alive _object)} do 
{
	_position		= getPos _object;
	_Marker = createMarker [_markerName, _position];
	_Marker setMarkerColor "ColorRed";
	_Marker setMarkerShape "ELLIPSE";
	_Marker setMarkerBrush "Grid";
	_Marker setMarkerSize [_size,_size];
	_Marker setMarkerText _name;
	_dot = createMarker [_markerDotName, _position];
	_dot setMarkerColor "ColorRed";
	_dot setMarkerType "mil_dot";
	_dot setMarkerText _name;
	sleep 5;
	deleteMarker _Marker;
	deleteMarker _dot;
	_isMissionRunning = [_missionIndex, _static] call ZEVMissionGetMarkerStatus;
};

deleteMarker _Marker;
deleteMarker _dot;

