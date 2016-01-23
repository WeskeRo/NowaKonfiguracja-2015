/*  

Spawn Configuration:

1. These spawns are just examples to show what this mod can do. You can add or delete
any spawn in the _spawnPoints list. Don't forget to leave off the last comma for the last
element in the array.

2. Spawn format: 
	[Name, Pos, VIP Level, Humanity Level]
	Name - Each spawn must have a unique name. Can be anything. Do not use double quotes " inside.
	Pos - Coordinates in AboveTerrainLevel Format [x,y,z]
	VIP Level -
		0 - Anyone can pick this spawn
		1 - Only players with UIDs in _spawnLevel1 can pick this spawn
		2 - Only players with UIDs in _spawnLevel2 can pick this spawn
		3 - Only players with UIDs in _spawnLevel3 can pick this spawn​
	Humanity Level -
		0 - Anyone can pick this spawn
		Negative # - Only players with humanity less than this number can pick this spawn
		Positive # - Only players with humanity greater than this number can pick this spawn​

3. _customBase - List of UIDs that own custom bases.
   _customBases - List of custom bases in this format: ["Name",[Pos]]
   Name - Each base must have a unique name. Can be anything. Do not use double quotes " inside.
   Pos - In AboveTerrainLevel [x,y,z] format
   These must match the order of the first list. The first UID in _customBase corresponds with the first base in _customBases and so on. 
   These will only show in the spawn list for the player who owns them. If multiple UIDs share the same base then add the same base multiple times to maintain order, 
   or consider making it a VIP spawn in _spawnPoints instead. Pos is exactly where you will spawn, does not run through findSafePos. These override body check.

*/

_bodyCheck = 4000; // If a player has a body within this distance of a spawn that spawn will be blocked. Set to -1 to disable.
_mapRadius = 12000; // Distance from center to farthest edge of map. Only used when spawnNearPlot is enabled.
_spawnNearGroup = false; // Allow players to spawn near their group. Blocked if the player has a body within bodyCheck distance of the leader. Requires DZGM to work.
_spawnNearPlot = false; // Allow players to spawn near their plot. Blocked if the player has a body within bodyCheck distance of their plot. Requires Plot4Life to work. 
_spawnRadius = 800; // Distance around spawn to find a safe pos. Lower is closer to exact coordinates. Do not set too low or BIS_fnc_findSafePos may fail.
_customBase = [
	"76561198014219874", // ebay
	"0",
	"0"
];
_customBases = [ // Do not use a z (height) higher than _autoOpenHeight in haloConfig.sqf if using halo
	["ebay's base",[2324,15365,0]],
	[],
	[]
];

_spawnLevel1 = ["0","0","0"];
_spawnLevel2 = ["0","0","0"];
_spawnLevel3 = ["0","0","0"];
// To give higher level VIPs access to lower level VIP spawns uncomment the two lines below:
// _spawnLevel1 = _spawnLevel1 + _spawnLevel2 + _spawnLevel3;
// _spawnLevel2 = _spawnLevel2 + _spawnLevel3;

_spawnPoints = switch (toLower worldName) do {
	case "sauerland":{
		[
			["Random",[[15448,8466,0],[19488,7462,0],[19478,12440,0],[20210,14501,0],[16453,6895,0],[19666,10377,0],[11000,10157,0],[10669,13320,0],[11349,12225,0],[12104,8936,0],[12879,14983,0]],0,0,1],
			["Buersfeld",[15448,8466,0],0,0],
			["Hoeinghausen",[19488,7462,0],0,0],
			["Berghausen",[19478,12440,0],0,0],
			["Heggen",[20210,14501,0],0,0],
			["Heidermuehle",[16453,6895,0],0,0],
			["Remblinghausen",[19666,10377,0],0,0],
			["Schueren",[11000,10157,0],0,0],
			["Schmallenberg",[10669,13320,0],0,0],
			["Calle",[11349,12225,0],0,0],
			["Oberdorf",[12104,8936,0],0,0],
			["Burg Calle",[12879,14983,0],0,0],
			// Above are defaults
			["Strelingen",[3437,18843,0],0,0],
			["Berghoven",[18734,21955,0],0,0],
			["Oeventrop",[8668,22650,0],0,0],
			["Arnsberg",[1134,24264,0],0,0],
			["Suederbarup",[13260,543,0],0,0],
			["Osterholz",[2580,8344,0],0,0],
			["Uhlenbusch",[4092,12942,0],0,0],
			["Ihrhofen",[9640,19193,0],0,0],
			["Old Airfield",[17253,2167,0],0,0]
		]
	};
};