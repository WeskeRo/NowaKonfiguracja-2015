//-----------------------------------------------------------//
//
// 				DayZ Visual Mission Editor 
//				by Eugene Zhuravlev 2014 (c)
// 	Thanks to authors of DZAI for this script
//
//
//  mail	: EugeneZhuravlev@yandex.ru
//	Skype	: EugeneZhuravlev
//	www		: http://DayZMissionEditor.ru/
//  YouTube : http://www.youtube.com/channel/UCWuzUxNJ_Ctf9ynoJqiV2ww
//
//-----------------------------------------------------------//
private ["_unitGroup","_detectBase","_detectFactor","_detectRange","_helicopter","_dirVector","_detected","_detectOrigin","_detectedCount","_startPos"];
_helicopter = _this; //vehicle (leader _unitGroup);
_detectRange = 500;
_unitGroup = group (driver _helicopter);
while {alive driver _helicopter} do
{
	uiSleep 2;

	_detectStartPos = getPosASL _helicopter;
	_startPos 		= getPosASL _helicopter;
	format["ZEVDetectPlayers: _startPos = %1", _startPos] call ZEVLog;
	_dirVector 		= vectorDir _helicopter;
	format["ZEVDetectPlayers: _dirVector = %1", _dirVector] call ZEVLog;
	
	_detectOrigin 	= [(_startPos select 0) + (_dirVector select 0)*200 ,(_startPos select 1) + (_dirVector select 1)*200 , 0];
	format["ZEVMissionPlayerDetect: _detectOrigin = %1", _detectOrigin] call ZEVlog;
	
	_detected 		= _detectOrigin nearEntities [["Man","LandVehicle"],_detectRange];
	format["ZEVMissionPlayerDetect: _detected = %1", _detected] call ZEVLog;
	_detectedCount 	= (count _detected);
	if (_detectedCount > 0) then 
	{
		if (_detectedCount > 15) then 
		{
			_detected resize 15;
		};
		{
			if (isPlayer _x) then 
			{
				_heliAimPos = aimPos _helicopter;
				_playerAimPos = aimPos _x;
				if (!(terrainIntersectASL [_heliAimPos,_playerAimPos]) && {!(lineIntersects [_heliAimPos,_playerAimPos,_helicopter,_x])}) then 
				{ //if no intersection of terrain and objects between helicopter and player, then reveal player
					format["ZEVMissionPlayerDetect: %1", _x] call ZEVLog;
					_unitGroup reveal [_x,2.5];
					format["ZEVMissionPlayerDetect: player %1 detected ",_x] call ZEVLog;
				};
			};
			uiSleep 0.1;
		} forEach _detected;
		uiSleep 15;
	} else 
	{
		uiSleep 7.5;
	};
	
};