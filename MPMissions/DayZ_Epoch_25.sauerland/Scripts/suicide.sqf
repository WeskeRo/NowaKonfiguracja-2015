closeDialog 0;
decision666 = nil;
canAbort = true;

Suicideconfirm = 
[
	["",true],
	["Suicide Confirmation", [-1], "", -5, [["expression", ""]], "1", "0"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["No", [2], "", -5, 	[["expression", "decision666 = false;"]], "1", "1"],
	["Yes", [3], "", -5, 	[["expression", "decision666 = true;"]], "1", "1"],
	["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
	["Exit", [-1], "", -3, 	[["expression", "decision666 = false;"]], "1", "1"]
];
showCommandingMenu "#USER:Suicideconfirm";

waitUntil { ((!isNil "decision666") or (commandingMenu == "")) };
if (isNil "decision666") then { decision666 = false; };
_secondary = currentWeapon player;

if (decision666) then {
	canAbort = false;
	player switchMove 'ActsPercMstpSnonWpstDnon_suicide1B';
	cutText ["Goodbye cruel world!", "PLAIN DOWN"];
	uiSleep 4.7;
	player fire _secondary;
	playSound "Beretta_single_shot_v1";
	[] spawn (compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf');
	player setHit['Body',1];
} else {
	systemChat ("Suicide cancelled!");
	cutText ["Suicide cancelled! Good for you!","PLAIN DOWN"];
};
