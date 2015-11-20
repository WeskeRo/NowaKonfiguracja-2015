private ["_dragee","_unit","_wallTypes"];
_dragee	= _this select 3; 
allowDropPlayer = true;

_wallTypes = nearestObjects [player,["ModularItems","BuiltItems","Land_DZE_WoodDoor_Base","CinderWallDoor_DZ_Base","Land_DZE_WoodDoorLocked_Base","CinderWallDoorLocked_DZ_Base","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Land_HBarrier5_DZ","MetalGate_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","MetalPanel_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","WoodSmallWallThird_DZ","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked"], 16];

if (count _wallTypes > 0) then {
	_wall = [_wallTypes, player] call BIS_fnc_nearestPosition;
	if ((vehicle player) distance _wall < 10) then {
			cutText [format[">>>Anti-Glitch<<< (Admin notified) Cant drop a player near an epoch building."], "PLAIN DOWN"];
			titleFadeOut 2;
			[format[">>>Anti-Glitch<<< Player: %1 tried to drop Player: %2 near an epoch building", name player, name _dragee]] call my_scripts_logger;
			allowDropPlayer = false;
			sleep 1;
	};
};

if (allowDropPlayer) then {
	player removeAction NORRN_dropAction;
	player removeAction NORRN_carryAction;
	NORRN_remove_drag = true;  
	r_drag_sqf = false;
	r_carry_sqf = false;
	r_action = false;
	_unit = player;
	
	detach _unit;
	detach _dragee;
	_unit switchMove "";
	_dragee switchMove "";
	NORRN_Dragged_body = objNull;
	_dragee setVariable ["NORRN_unit_dragged", false, true]; 
	
	//lie on back
	_dragee playMoveNow "ainjppnemstpsnonwrfldnon";
	norrnRalie = _dragee;
	publicVariable "norrnRalie";
};
