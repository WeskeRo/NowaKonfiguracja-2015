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
if (!isServer) exitWith {};

private ["_vehicle","_vehWeapons","_markername","_marker","_startTime","_timePatrolled",
"_unitGroup","_wpmarkername","_wpmarker","_vehOK","_driverOK","_magsName","_magazine"];

_vehicle = _this select 0;
_vehWeapons = weapons _vehicle;

waitUntil {sleep 0.1; (!isNull (driver _vehicle))};

{
	if (_x in ["CarHorn","BikeHorn","TruckHorn","TruckHorn2","SportCarHorn","MiniCarHorn"]) then {
		_vehWeapons = _vehWeapons - [_x];
	};
} forEach _vehWeapons;

_startTime = time;

_vehOK = true;
_driverOK = true;

if ((count _vehWeapons) > 0) then 
{
	while {_vehOK && {_driverOK}} do 
	{	
		//Check if vehicle ammunition needs to be replenished
		{
			if ((_vehicle ammo _x) < 1) then 
			{
				_magsName = getArray (configFile >> "cfgWeapons" >> _x >> "magazines");
				if(count _magsName > 0) then
				{
					_magazine = _magsName select 0;
					_vehicle addMagazine [_magazine, 1];
					_vehicle addMagazineCargoGlobal [_magazine, 1];
					_vehicle setVehicleAmmo 1;
				};
			};
		} forEach _vehWeapons;
		
		//Check if vehicle fuel is low
		if (fuel _vehicle < 0.20) then 
		{
			_vehicle setFuel 1;
			
		};
		
		sleep 20;
		
		_vehOK = ((alive _vehicle)&& {(!(isNull _vehicle))} && {(canMove _vehicle)});
		_driverOK = ((!(isNull (driver _vehicle))) && {(alive (driver _vehicle))});
	};
} 
else 
{
	while {_vehOK && {_driverOK}} do 
	{		
		//Check if vehicle fuel is low
		if (fuel _vehicle < 0.20) then 
		{
			_vehicle setFuel 1;
			
		};

		sleep 20;
		
		_vehOK = ((alive _vehicle)&& {(!(isNull _vehicle))} && {(canMove _vehicle)});
		_driverOK = ((!(isNull (driver _vehicle))) && {(alive (driver _vehicle))});
	};
};

sleep 0.5;

