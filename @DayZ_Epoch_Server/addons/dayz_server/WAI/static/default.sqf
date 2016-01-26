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
[[22691.7,3614.52,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22626.3,3669.31,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22708.9,3749.54,0.00149536], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22796,3746.47,0.000671387], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22771.8,3929.55,0.00576782], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22758.6,4083.44,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22557.1,3993.34,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22782.8,4233.33,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22586.9,4213.39,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22480.2,4232.53,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22400.5,4100.21,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22407.7,3958.61,0.0474243], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22416,3889.99,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22466.5,3818.57,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22519.2,3685.88,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22522.7,3584.36,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22545.8,3454.06,0.00189209], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22498.6,3441.84,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22461.5,3500.85,0.00131226], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22413.9,3547.03,0.00152588], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22448.4,3576.63,0.00131226], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22437.9,3613.93,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22428.9,3659.42,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22381.4,3682.87,0.00183105], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22276.9,3870.85,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22287.1,4026.44,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22273.2,4177.36,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22327.5,4200.62,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22285,4289.71,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22457.6,4343.92,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22544.1,4342.84,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22796.6,4312.53,0.00143433], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22549.8,4421.04,0.000915527], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;
[[22425.4,4423.18,0.0012207], 5, "Random", "Random",4, "Random", "Random", "Random", "Bandit"] call spawn_group;


	
	//Custom static weapon spawns Eg. (with mutiple positions)

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
			[22351.4,4412.96,0.00152588]
		],
		"M2StaticMG",						// Classname of turret
		"extreme",								// Skill level of unit (easy, medium, hard, extreme, Random)
		"Bandit2_DZ",						// Skin classname, use "Random" or classname here
		"Bandit",							// AI Type, "Hero" or "Bandit".
		"Random",							// Primary gun set number. "Random" for random weapon set
		4,									// Number of magazines
		"Random",							// Backpack classname, use "Random" or classname here
		"Random"							// Gearset classname, use "Random" or classname here
	] call spawn_static;
   //
	//Place your custom static weapon spawns below
	





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
