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
private ["_aiPos","_aiPostype","_locationPos","_locationRadius","_x", "_y","_z"];

_aiPos 			= _this select 0;
_aiPostype		= _this select 1;
_locationPos	= _this select 2;
_locationRadius = _this select 3;
_aiPos			= [(_aiPos select 0) + (_locationPos select 0), (_aiPos select 1) + (_locationPos select 1), (_aiPos select 2) + (_locationPos select 2)];
if(_aiPosType == "Random") then
{
	_x = (_locationPos select 0) - _locationRadius + random( 2 * _locationRadius);
	_y = (_locationPos select 1) - _locationRadius + random( 2 * _locationRadius);
	_z = 0;
	_aiPos	= [_x, _y, _z];
};
if(ZEVMissionDebug > 0) then { diag_log format ["ZEVMissionSelectPos: %1", _aiPos];};
_aiPos