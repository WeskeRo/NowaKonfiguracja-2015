/*
	DZAI Custom Spawn Definitions File
	
	Description: Defines all custom AI spawns here. Note that you must first define a custom spawn area
	by creating an area marker in the appropriate file in the custom_markers folder.
	
	Explanation of DZAI_spawn_units (For spawning infantry AI)
	
	[
		"dzaicustomspawntest",	//This is the marker name to be used as the patrol and spawning area.
		2, 						//This trigger will spawn a group of 2 AI units.
		1,						//Weapon grade setting. 1 = weapon chosen from Military loot table (see below for explanation of Weapon Grade)
		true					//(OPTIONAL)* Respawn setting. True: AI spawned will respawn (Default). False: AI will not respawn. Spawn area will be deleted when all units have been killed.
	] call DZAI_spawn_units;
	
	The above DZAI_spawn_units call will create 2 respawning AI units with weapons from DayZ's military loot table.
	
	[
		"dzaicustomspawntest",	//This is the marker name to be used as the patrol and spawning area.
		"ArmoredSUV_PMC_DZ",	//Insert a vehicle classname here. Acceptable vehicle types: Air or Land vehicles. Spawn will be cancelled if classname is invalid or banned.
		[3,1],					//Set number of passenger and gunner units here. A driver unit will always be created. DZAI will not add more units to a vehicle than the vehicle type allows. Only land vehicles may have passenger units.
		1,						//Weapon grade setting. 1 = weapon chosen from Military loot table (see below for explanation of Weapon Grade)
		true,					//(OPTIONAL)* Respawn setting. True: AI will respawn with vehicle after a specified time. False: AI and vehicle will not respawn after being destroyed. (Default)
		600						//(OPTIONAL)* Respawn time. Number of seconds to wait until AI and vehicle are respawned. (Default: 600). Timer begins after AI group is wiped out or vehicle is destroyed, whichever comes first.
	] call DZAI_spawn_vehicle;
	
	The above DZAI_spawn_vehicle call will spawn an Armored SUV with 1 driver, 3 passenger units and 1 gunner unit with military-grade weapons, and will respawn after 600 seconds (10 minutes).

	* Optional parameters may be left out of the function call. A default action will be taken instead.
	
	Weapon Grade explanation:
	
	0: Approx 40% of maximum AI skill potential - weapon from Farm/Residential loot table.
	1: Approx 55% of maximum AI skill potential - weapon from Military loot table
	2: Approx 70% of maximum AI skill potential - weapon from MilitarySpecial (Barracks) loot table
	3: Approx 80% of maximum AI skill potential - weapon from HeliCrash loot table 
	
	
	
*/

//----------------------------Add your custom spawn definitions below this line ----------------------------


//##### Castle #####	
	//Castle 1
	[
		"Castle1",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Castle 2
	[
		"Castle2",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Castle 3
	[
		"Castle3",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;

	
	
	
	//Castle 4
	[
		"Castle4",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Castle 5
	[
		"Castle5",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Castle 6
	[
		"Castle6",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;
	
	
	
	
	//Castle 7
	[
		"Castle7",	//This is the marker name to be used as the patrol and spawning area.
		6, 						//This trigger will spawn a group of 5 AI units.
		1,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;
	
//##### Castle End #####	

//##### Valley #####	

	//Valley 1
	[
		"Valley1",	//This is the marker name to be used as the patrol and spawning area.
		7, 						//This trigger will spawn a group of 5 AI units.
		3,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Valley 2
	[
		"Valley2",	//This is the marker name to be used as the patrol and spawning area.
		7, 						//This trigger will spawn a group of 5 AI units.
		2,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Valley 3
	[
		"Valley3",	//This is the marker name to be used as the patrol and spawning area.
		7, 						//This trigger will spawn a group of 5 AI units.
		2,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;

	
	
	
	//Valley 4
	[
		"Valley4",	//This is the marker name to be used as the patrol and spawning area.
		7, 						//This trigger will spawn a group of 5 AI units.
		2,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Valley 5
	[
		"Valley5",	//This is the marker name to be used as the patrol and spawning area.
		7, 						//This trigger will spawn a group of 5 AI units.
		3,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;

//##### Valley End #####	
	
//##### Outposts #####
	
	//Outpost 1
	[
		"Outpost1",	//This is the marker name to be used as the patrol and spawning area.
		12, 						//This trigger will spawn a group of 5 AI units.
		3,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Outpost 2
	[
		"Outpost2",	//This is the marker name to be used as the patrol and spawning area.
		12, 						//This trigger will spawn a group of 5 AI units.
		3,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;



	
	//Outpost 3
	[
		"Outpost3",	//This is the marker name to be used as the patrol and spawning area.
		12, 						//This trigger will spawn a group of 5 AI units.
		3,						//AI spawned by this trigger will have Weapon Grade level 1 
		false					//(OPTIONAL) Respawn setting. True: AI spawned will respawn. False: AI will not respawn. See more here: http://opendayz.net/threads/release-dzai-lite-dynamic-ai-package.11116/page-28#post-79148
	] call DZAI_spawn_units;
	
//##### Outposts End #####