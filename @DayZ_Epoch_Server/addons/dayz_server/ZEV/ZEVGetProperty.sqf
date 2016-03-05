private ["_parmList", "_propertyList","_ret"];
_parmList 		= _this select 0;
_propertyList 	= _this select 1;
_ret = [];
format ["GETProperty: %1",_this] call ZEVLog;

{
	private ["_idx", "_parmName","_parmValue", "_randomList"]; 
	_parmName 	= _x select 0;
	_parmValue	= _x select 1;
	_randomList	= _x select 2;
	_idx = _propertyList find _parmName;
	
	if (_idx >=0) then 
	{
		_ret set [_idx, _parmValue];
	};
} foreach _parmList;
_ret