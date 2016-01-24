if(isServer) then {


	//Custom Spawns file//
	/*
	Custom group spawns Eg.

	[
		[953.237,4486.48,0.001],			// Position
		4,									// Number Of units
		"Random",							// Skill level of unit (easy, medium, hard, extreme, Random)
		"Random",							// Primary gun set number or gun and rocket launcher. Syntax is "Random", for gun only or ["Random","AT"], for gun and launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random",							// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] call spawn_group;

	Place your custom group spawns below
	*/





	//
	Custom static weapon spawns Eg. (with mutiple positions)

	[
		[									// Position(s) (can be multiple)
			[22627.2,3576.74,0.00143433],
			[22726,3667.68,1.20419],
			[22594.1,3640.36,11.0865],
			[22591,3703.03,13.9641],
			[22741.7,3731.72,3.60147],
			[22740.6,3769.57,20.3219],
			[22726.2,3845.56,9.47971],
			[22795.2,3965.68,23.6212],
			[22494.9,3888.71,46.5772],
			[22508.9,4058.93,9.47952],
			[22722,4114.41,17.7495],
			[22832.5,4208.5,6.90152],
			[22719,4194.64,0.00143433],
			[22649.5,4220.66,36.5038],
			[22387.7,4197.86,6.90164],
			[22413.6,4145.12,0.00143433],
			[22430,4157.49,0.00143433],
			[22419.9,3959.6,0.0474243],
			[22406.9,3960.84,0.0474243],
			[22397.6,3877.49,11.0865],
			[22419.1,3782.87,9.00156],
			[22514,3780.42,5.89203],
			[22525.8,3507.45,0.00186157],
			[22439.4,3428.74,2.7999],
			[22398.6,3699.19,0.0020752],
			[22315.3,4152.62,35.447],
			[22315.3,4152.62,35.447],
			[22574.6,4309.98,10.0016],
			[22779.4,4339.91,6.02716],
			[22761.2,4297.5,0.00170898],
			[22583.8,4431.67,0.00161743],
			[22550.3,4410.55,0.00183105],
			[22351.4,4412.96,0.00152588],
		],
		"M2StaticMG",						// Classname of turret
		"easy",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		2,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;
   //
	Place your custom static weapon spawns below
	





	/*
	Custom Chopper Patrol spawn Eg.

	[
		[725.391,4526.06,0],				// Position to patrol
		[0,0,0],							// Position to spawn chopper at
		2000,								// Radius of patrol
		10,									// Number of waypoints to give
		"UH1H_DZ",							// Classname of vehicle (make sure it has driver and two gunners)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn heli_patrol;

	Place your heli patrols below
	*/





	/* 
	Custom Vehicle patrol spawns Eg. (Watch out they are stupid)

	[
		[725.391,4526.06,0],				// Position to patrol
		[725.391,4526.06,0],				// Position to spawn at
		200,								// Radius of patrol
		10,									// Number of waypoints to give
		"HMMWV_Armored",					// Classname of vehicle (make sure it has driver and gunner)
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",							// Skin classname, use "Random" or classname here
		"Bandit"							// AI Type, "Hero" or "Bandit".
	] spawn vehicle_patrol;

	Place your vehicle patrols below this line
	*/





	/*
	Paradropped unit custom spawn Eg.

	[
		[911.21545,4532.7612,2.6292224],	// Position that units will be dropped by
		[0,0,0],							// Starting position of the heli
		400,								// Radius from drop position a player has to be to spawn chopper
		"UH1H_DZ",							// Classname of chopper (Make sure it has 2 gunner seats!)
		5,									// Number of units to be para dropped
		"Random",							// Skill level of units (easy, medium, hard, extreme, Random)
		"Random",	or ["Random","at"],		// Primary gun set number and rocket launcher. "Random" for random weapon set, "at" for anti-tank, "aa" for anti-air launcher
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Random",							// Gearset number. "Random" for random gear set.
		"Bandit",							// AI Type, "Hero" or "Bandit".
		true								// true: Aircraft will stay at position and fight. false: Heli will leave if not under fire. 
	] spawn heli_para;

	Place your paradrop spawns under this line
	*/

	diag_log "WAI: Static mission loaded";

};
