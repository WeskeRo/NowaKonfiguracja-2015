private ["_pos","_ret","_loop","_idx","_xx","_yy","_zz"];
_ret 	= [];
_loop 	= true;
_idx	= 0;
while {_loop} do
{
	_pos	= _this buildingPos _idx;
	_xx		= _pos select 0;
	_yy		= _pos select 1;
	_zz		= _pos select 2;
	
	if ((_xx == 0) && (_yy == 0) && (_zz == 0)) then
	{
		_loop = false;
	}
	else
	{
		_ret set [count _ret, _pos];
	};
	_idx = _idx + 1;
	sleep ZEVSleepSmall;
};
format["BuildingPos: %1 = %2", _this, _ret] call ZEVLog;
_ret