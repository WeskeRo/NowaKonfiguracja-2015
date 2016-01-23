class ExtraRc {
	class Kostey_notebook 
	{
		class ServerInfo { text = "Server info"; 	script = "closeDialog 0; createDialog 'info_dialog'"; 	};
		class dance1 	{ text = "Disco dance"; 	script = "execVM 'Scripts\Fun\dance1.sqf'"; 	};
		class dance2 	{ text = "At work dance"; 	script = "execVM 'Scripts\Fun\dance2.sqf'"; 	};
		class dance3 	{ text = "Stolen dance"; 	script = "execVM 'Scripts\Fun\dance3.sqf'";		};
		class boxing 	{ text = "Boxing"; 			script = "execVM 'Scripts\Fun\boxing.sqf'"; 	};
		class handstand { text = "Handstand"; 		script = "execVM 'Scripts\Fun\handstand.sqf'"; 	};
		class laydown 	{ text = "Laydown"; 		script = "execVM 'Scripts\Fun\laydown.sqf'"; 	};
		class playdead 	{ text = "Play Dead"; 		script = "execVM 'Scripts\Fun\deathflop.sqf'"; 	};
	};
  class ItemRadio {
     class GroupManagement {
        text = "Group Management";
        script = "execVM 'Scripts\dzgm\loadGroupManagement.sqf'";
     };
  };
class ItemToolbox {
        class BuildBike {
            text = "Deploy Bike";
            script = "execVM 'Scripts\deploy\deploy_bike.sqf'";
        };
		class BuildMoto {
            text = "Deploy MotorBike";
            script = "execVM 'Scripts\deploy\deploy_moto.sqf'";
        };
		class BuildMozie {
            text = "Deploy Mozie";
            script = "execVM 'Scripts\deploy\deploy_mozie.sqf'";
        };
		class flip {
            text = "Flip Vehicle";
            script = "execVM 'Scripts\flip.sqf'";
        };
    };
  	class ItemMap {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};

		class grass {
			text = "Grass ON/OFF";
			script =;// "closeDialog 0; if !(UKgrass) then { UKgrass = true; setTerrainGrid 12.5; systemChat('Grass ON'); systemChat('WARNING: Grass will lower your FPS!'); } else { UKgrass = false; setTerrainGrid 50; systemChat('Grass OFF'); };";
		};
		class earplugs {
            text = "Earplugs";
            script = "closeDialog 0;cutText['Toggle earplugs by pressing O','PLAIN'];";
        };
    };

	class ItemKiloHemp {
		class SmokeWeed {
			text = "420";
			script = "execVM 'Scripts\slave\smoke_weed.sqf'";
		};
	};


	class Binocular_Vector  {
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
			text = "5000 Meters";
			script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};	
	class Binocular {
		class viewdistanceTitle {
			text = "View Distance:";
			script = "systemChat('Change View Distance Locally. Click on one of the distance options');";
		};
		class distance400m {
			text = "400 Meters";
			script = "setViewDistance 400; systemChat('ViewDistance: 400');";
		};
		class distance600m {
			text = "600 Meters";
			script = "setViewDistance 600; systemChat('ViewDistance: 600');";
		};
		class distance800m {
			text = "800 Meters";
			script = "setViewDistance 800; systemChat('ViewDistance: 800');";
		};
		class distance1000m {
			text = "1000 Meters";
			script = "setViewDistance 1000; systemChat('ViewDistance: 1000');";
		};
		class distance1250m {
			text = "1250 Meters";
			script = "setViewDistance 1250; systemChat('ViewDistance: 1250');";
		};
		class distance1500m {
			text = "1500 Meters";
			script = "setViewDistance 1500; systemChat('ViewDistance: 1500');";
		};
		class distance2000m {
			text = "2000 Meters";
			script = "setViewDistance 2000; systemChat('ViewDistance: 2000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance3000m {
			text = "3000 Meters";
			script = "setViewDistance 3000; systemChat('ViewDistance: 3000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
		class distance5000m {
			text = "5000 Meters";
			script = "setViewDistance 5000; systemChat('ViewDistance: 5000'); systemChat('Warning: Higher the view distance Lower the FPS');";
		};
	};
  
  };