_this addEventHandler ["Dammaged", 
{ 
	private ["_veh","_part","_damage","_hits","_bool"];
	_veh	= _this select 0;
	_part	= _this select 1;
	_damage = _this select 2;
	format["Vehicle dammaged _part = %1, damage = %2", _part, _damage] call ZEVLog;
	_hits   = [	"wheel_1_1_steering",
				"wheel_1_2_steering",
				"wheel_1_3_steering",
				"wheel_2_1_steering",
				"wheel_2_2_steering",
				"wheel_2_3_steering"];
	if((_damage > 0.5)&&( (_hits find _part) >=0)) then
	{
		format["Vehicle dammaged _part = %1, set need repair flag", _part] call ZEVLog;
		_bool = false;
		_bool  = _veh getVariable [ZEVNeedRepair, false];
		if(!_bool) then
		{
			_veh setVariable [ZEVNeedRepair, true, true];
		};
	};
}];