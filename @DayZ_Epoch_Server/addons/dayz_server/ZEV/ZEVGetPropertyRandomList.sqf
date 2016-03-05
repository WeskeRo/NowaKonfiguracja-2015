private ["_parmList","_ret","_name"];
_parmList 	=	_this select 0;
_name		=  	_this select 1;
_ret = [];
{
	private ["_idx", "_parmName","_parmValue", "_randomList"]; 
	_parmName 	= _x select 0;
	_parmValue	= _x select 1;
	_randomList	= _x select 2;
	
	if (_parmName == _name) then
	{
		_ret = _randomList;
	};
} foreach _parmList;
_ret