private ["_parms","_position","_round","_dr","_minDist","_xx","_yy","_mine_pos","_mine","_vehicleList","_a","_da","_r","_radiusMin","_radiusMax","_mineParms","_mines","_missionObject","_missionIndex","_static","_fieldData","_fieldParms","_fieldMines","_placeType","_spawnDelay","_locationPos","_spawnRadius"];

	_missionObject 	= _this select 0;
	_missionIndex	= _missionObject getVariable ZEVIndex;
	_static			= _missionObject getVariable ZEVStatic;
	_fieldData		= _this select 1;
	_fieldParms		= _fieldData select 1;
	_fieldMines		= _fieldData select 2;
	format["_fieldMines = %1",_fieldMines] call ZEVLog;
	_placeType	= ([_fieldParms, [ZEVPlaceType]] call ZEVGetProperty) select 0;
	_parms 		= ([_fieldParms, [ZEVSpawnDelay]] call ZEVGetProperty) select 0;


	_locationPos	= _missionObject getVariable ZEVLocationPos;
	_spawnRadius    = _missionObject getVariable ZEVSpawnRadius;
	if (_placeType == "Auto") then
	{
		_position 	= [_fieldParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
		_radiusMin	= ([_fieldParms, [ZEVRadiusMin]] call ZEVGetProperty) select 0;
		_radiusMax	= ([_fieldParms, [ZEVRadiusMax]] call ZEVGetProperty) select 0;
		_round		= ([_fieldParms, [ZEVRounds]] call ZEVGetProperty) select 0;
		_minDist	= ([_fieldParms, [ZEVDistanceMin]] call ZEVGetProperty) select 0;
		
		_position   = [_position, ZEVSpecified, _locationPos, _SpawnRadius] call ZEVSelectPos;
		
		if(_round <=0) then { _round = 1;};
		_r = _radiusMin;
		if(_round==1) then {_dr = 0;} else { _dr = (_radiusMax - _r)/(_round-1); };
		if(_minDist <= 0) then { _minDist = 15;};
		
		while {_round > 0} do
		{
			_da= 360 / ( 2*3.1415926 * _r / _minDist);
			_a = 0;
			while {_a < 360 } do
			{
				_xx = _r * sin(_a) + (_position select 0);
				_yy = _r * cos(_a) + (_position select 1);
				_mine_pos = [_xx, _yy, 0];
				
				[_missionObject, _mine_pos] call ZEVAddMine;		
			
				_a = _a + _da;
			};
			_round = _round - 1;
			_r = _r + _dr;
		};
	}
	else
	{
		_mines = _fieldMines select 0;
		_mines = _mines select 2;
		format["_mines = %1",_mines] call ZEVLog;
		if( (typeName (_mines select 0)) == "ARRAY") then
		{
			{
				_mineParms	= _x select 1;
				_mine_pos 	= [_mineParms, [ZEVPositionX,ZEVPositionY,ZEVPositionZ]] call ZEVGetProperty;
				_mine_pos   = [_mine_pos, ZEVSpecified, _locationPos, _SpawnRadius] call ZEVSelectPos;
				
				[_missionObject, _mine_pos] call ZEVAddMine;					
				
			} foreach _mines;
		};
	};