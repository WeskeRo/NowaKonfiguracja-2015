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
private [
"_aiGroupSkills","_aiGroupSkillsValueType","_aiGroupSkillsParms","_routeData","_aiData","_aiGroupType","_aiFormation","_aiSide",
"_AIParmsQty","_groupData","_missionIndex","_aiGroup","_static","_qtyMin","_qtyMax","_qtyTotal","_box","_areaPosType","_areaPos","_areaRadius",
"_buildings","_currentBuilding","_buildingPositions","_buildingPosQty","_aiQty","_i","_area","_parms","_areaProps","_tmp","_groupProps","_groupChilds","_missionObject",
"_locationPos","_locationRadius","_tmp2"];
     
	_missionObject	= _this select 0;
	
	if(isNull _missionObject) exitWith { "AddAreaSecurity - missionObject is NULL" call ZEVLog; };
	
	_groupData		= _this select 1;
	
	_groupProps		= _groupData select 1;
	_groupChilds	= _groupData select 2;
	
	_parms			= [_groupProps, [ZEVSquadMin, ZEVSquadMax, ZEVQty, ZEVSide]] call ZEVGetProperty;
	_qtyMin			= _parms select 0;
	_qtyMax			= _parms select 1;
	_qtyTotal		= _parms select 2;
	_aiSide			= _parms select 3;
	
	_area				= _groupChilds select 0;
	_aiData 			= _groupChilds select 1;
	_box				= _groupChilds select 2;
	
	_locationPos	= _missionObject getVariable ZEVLocationPos;
	_locationRadius = _missionObject getVariable ZEVSpawnRadius;
	
	
	format ["Add areaSecurity: _area = %1",_area] call ZEVLog;
	
	_areaProps		= _area select 1;
	_areaPosType	= ([_areaProps, [ZEVPositionType]] call ZEVGetProperty) select 0;
	_areaPos 		= [_areaProps, [ZEVPositionX, ZEVPositionY, ZEVPositionZ]] call ZEVGetProperty;
	_areaRadius		= ([_areaProps, [ZEVSpawnRadius]] call ZEVGetProperty) select 0;
	_areaPos 		= [_areaPos, _areaPosType, _locationPos, _locationRadius] call ZEVSelectPos;	
	
	_tmp		= nearestObjects [_areaPos, ["house"], _areaRadius];
	_buildings = [];
	_buildingPositions = 0;
	{
		_buildingPositions	= _x call ZEVBuildingPos;
		_buildingPosQty		= count _buildingPositions;
		if ( _buildingPosQty > 0 ) then
		{
			_buildings set [count _buildings, [_x,_buildingPositions]];
		};
	} foreach _tmp;
	
	format ["AddSecurityArea _buildings = %1", _buildings] call ZEVLog;
	
		_i = 0;
	while { (_i < _qtyTotal) && (count _buildings > 0)} do
	{
		format ["AddSecurityArea in While _buildings = %1", _buildings] call ZEVLog;
		_tmp2				= _buildings call BIS_fnc_selectRandom;
		_currentBuilding 	= _tmp2 select 0;
		_buildingPositions	= _tmp2 select 1;
		_buildings 			= _buildings - [_tmp2];
		//_buildingPositions	= _currentBuilding call ZEVBuildingPos;//[_currentBuilding] call BIS_fnc_buildingPositions;
		_buildingPosQty		= count _buildingPositions;
		
		_aiQty = _qtyMin + round(random(_qtyMax - _qtyMin)); 
		if (_aiQty > _buildingPosQty) then
		{
			_aiQty = _buildingPosQty;
		};
		if (_i + _aiQty > _qtyTotal) then
		{
			_aiQty = _qtyTotal - _i;
		};
		if (_aiQty > 0) then
		{
			format ["AddAreaSecurity: add %1 units",_aiQty] call ZEVLog;
			[_missionObject, _aiData, _box, _currentBuilding, _aiQty, _areaPos, _areaRadius, _aiSide, _buildings, _buildingPositions] call ZEVBuildingPatrol;
			_i = _i + _aiQty;
		};
		sleep ZEVSleepSmall;
	};
	

    
