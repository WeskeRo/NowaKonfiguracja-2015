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
private ["_vehicle","_missionIndex","_aiList","_aiunit","_aiMissionIndex","_gunnerAlive","_oldGunner","_newGroup","_found","_i"];

_vehicle = _this;//static gun

_missionIndex = _vehicle getVariable [ZEVIndex, -1];

if(_missionIndex < 0 ) exitWith { "FindGunner wrong mission index" call ZEVLog; };
_aiList = [];
while { (alive _vehicle)} do
{
	sleep 60;
	_oldGunner   = gunner _vehicle;
	"ZEVFindGunner - check static gun status" call ZEVLog;
	if((isNull _oldGunner) || (!alive _oldGunner)) then
	{
		_aiList = (position _vehicle) nearEntities ["Man", 50];
		format ["ZEVFindGunner - near units = %1", _aiList] call ZEVLog;
		_i 		= 0;
		_found 	= false;
		while {(count _aiList > 0) && (_i < count _aiList) && (!_found) } do
		{
			_aiunit = objNull;
			_aiunit = _aiList select _i;
			if( (!isNil "_aiunit") && (!isNull _aiunit) && (alive _aiunit)) then
			{
				_aiMissionIndex = _aiunit getVariable [ZEVIndex, -1];

				if((alive _aiunit) && (_aiMissionIndex >= 0) &&(_aiunit != leader (group _aiunit))) then
				{
					unassignVehicle _aiunit;
					[_aiunit] joinSilent grpNull;
					_newGroup = createGroup (side _aiunit);
					[_aiunit] joinSilent _newGroup;
					_aiunit assignAsGunner _vehicle;
					[_aiunit] orderGetIn true;
					format ["ZEVFindGunner - _vehicle = %1, gunner = %2", _vehicle, _aiunit] call ZEVLog;
					_found = true;
				};
			};
			sleep 0.3;
			_i = _i + 1;
		};
	};
	
};