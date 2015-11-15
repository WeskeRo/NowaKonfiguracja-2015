class ExtraRc {
	class ItemToolbox {
        class BuildBike {
            text = "Deploy Bike";
            script = "execVM 'Scripts\deploy\deploy_bike.sqf'";
        };
		class BuildMoto {
            text = "Deploy Motorbike";
            script = "execVM 'Scripts\deploy\deploy_moto.sqf'";
        };
		class BuildMozzie {
            text = "Deploy Littlebird";
            script = "execVM 'Scripts\deploy\deploy_bird.sqf'";
        };
		class BuildM240 {
            text = "Deploy M240";
            script = "execVM 'Scripts\deploy\deploy_m240.sqf'";
        };
		class flip {
            text = "Flip Vehicle";
            script = "execVM 'Scripts\flip.sqf'";
        };
    };
	class ItemMap {
		class info {
            text = "Rules & Info";
            script = "closeDialog 0; createDialog 'info_dialog'";
        };
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class lotterya {
			text = "Lottery Info ON/OFF";
			script = "closeDialog 0; if !(Lottery_txt) then { Lottery_txt = true; systemChat('Lottery announcements are now turned ON'); } else { Lottery_txt = false; systemChat('Lottery announcements are now turned OFF'); };";
		};
		class careera {
			text = "Career Info ON/OFF";
			script = "closeDialog 0; if !(Job_txt) then { Job_txt = true; systemChat('Career announcements are now turned ON'); } else { Job_txt = false; systemChat('Career announcements are now turned OFF'); };";
		};
		class grass {
			text = "Grass ON/OFF";
			script = "closeDialog 0; if !(UKgrass) then { UKgrass = true; setTerrainGrid 12.5; systemChat('Grass ON'); systemChat('WARNING: Grass will lower your FPS!'); } else { UKgrass = false; setTerrainGrid 50; systemChat('Grass OFF'); };";
		};
		class earplugs {
            text = "Earplugs";
            script = "closeDialog 0;cutText['Toggle earplugs by pressing O','PLAIN'];";
        };
		class shit {
            text = "Take a Dump";
            script = "execVM 'Scripts\shit.sqf'";
        };
		class colors {
            text = "Color Corrections";
            script = "execVM 'Scripts\colors\colors.sqf'";
        };
    };
	class ItemGPS {
		class info {
            text = "Rules & Info";
            script = "closeDialog 0; createDialog 'info_dialog'";
        };
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class finder {
            text = "Find Vehicle for Key";
            script = "execVM 'Scripts\finder.sqf'";
        };
		class lotterya {
			text = "Lottery Info ON/OFF";
			script = "closeDialog 0; if !(Lottery_txt) then { Lottery_txt = true; systemChat('Lottery announcements are now turned ON'); } else { Lottery_txt = false; systemChat('Lottery announcements are now turned OFF'); };";
		};
		class careera {
			text = "Career Info ON/OFF";
			script = "closeDialog 0; if !(Job_txt) then { Job_txt = true; systemChat('Career announcements are now turned ON'); } else { Job_txt = false; systemChat('Career announcements are now turned OFF'); };";
		};
		class grass {
			text = "Grass ON/OFF";
			script = "closeDialog 0; if !(UKgrass) then { UKgrass = true; setTerrainGrid 12.5; systemChat('Grass ON'); systemChat('WARNING: Grass will lower your FPS!'); } else { UKgrass = false; setTerrainGrid 50; systemChat('Grass OFF'); };";
		};
		class earplugs {
            text = "Earplugs";
            script = "closeDialog 0;cutText['Toggle earplugs by pressing O','PLAIN'];";
        };
		class shit {
            text = "Take a Dump";
            script = "execVM 'Scripts\shit.sqf'";
        };
		class colors {
            text = "Color Corrections";
            script = "execVM 'Scripts\colors\colors.sqf'";
        };
    };
	class ItemRadio {
		class GroupManagement {
			text = "Group Management";
			script = "[] execVM 'Scripts\dzgm\loadGroupManagement.sqf'";
		};
	};
	class EvMoney {
        class Travel {
            text = "What is this?";
            script = "closeDialog 0;cutText['You can use this money to one trip between fast travel points!\nCheck your map!','PLAIN'];";
        };
    };
	class MeleeFishingPole {
		class fishing {
			text = "Cast for Pearls";
			script = "execVM 'Scripts\pearl_fishing.sqf'";
		};
	};
	class Laserbatteries {
        class Jihad {
            text = "Trigger Suicide Bomb";
            script = "execVM 'Scripts\jihad.sqf'";
        };
    };
	class ItemKiloHemp {
		class SmokeWeed {
			text = "420";
			script = "execVM 'Scripts\slave\smoke_weed.sqf'";
		};
	};
	class MakarovSD {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class Colt1911 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class glock17_EP1 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class M9 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class M9SD {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class Makarov {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class revolver_EP1 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class revolver_gold_EP1 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class UZI_SD_EP1 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class RH_mk2 {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
		};
	};
	class vil_APS {
		class suicide {
			text = "Commit Suicide";
			script = "execVM 'Scripts\suicide.sqf'";
		};
		class roulette {
			text = "Russian Roulette";
			script = "execVM 'Scripts\roulette.sqf'";
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
	//Bandit houses
	class ItemSodaSmashtEmpty {
       class B1 {
            text = "Bandit Level 1 House";
            script = "['B1',-5000,'Uroven1DrevenaBudka','ItemSodaSmashtEmpty','Bandit Level 1 House','house'] execVM 'origins\build_it.sqf'";
        };
	};
	class ItemSodaDrwasteEmpty {
		class B2 {
            text = "Bandit Level 2 House";
            script = "['B2',-15000,'Uroven2KladaDomek','ItemSodaDrwasteEmpty','Bandit Level 2 House','house'] execVM 'origins\build_it.sqf'";
        };
	};
	class ItemSodaLemonadeEmpty {
		class B3 {
            text = "Bandit Level 3 House";
            script = "['B3',-25000,'Uroven3DrevenyDomek','ItemSodaLemonadeEmpty','Bandit Level 3 House','house'] execVM 'origins\build_it.sqf'";
        };
	};	
	//Hero houses
	class ItemSodaMtngreenEmpty {
       class H1 {
            text = "Hero Level 1 House";
            script = "['H1',5000,'Uroven1VelkaBudka','ItemSodaMtngreenEmpty','Hero Level 1 House','house'] execVM 'origins\build_it.sqf'";
        };
	};
	class ItemSodaR4z0rEmpty {
		class H2 {
            text = "Hero Level 2 House";
            script = "['H2',15000,'Uroven2MalyDomek','ItemSodaR4z0rEmpty','Hero Level 2 House','house'] execVM 'origins\build_it.sqf'";
        };
	};
	class ItemSodaClaysEmpty {
		class H3 {
            text = "Hero Level 3 House";
            script = "['H3',25000,'Uroven3VelkyDomek','ItemSodaClaysEmpty','Hero Level 3 House','house'] execVM 'origins\build_it.sqf'";
        };
	};	
	//Garages
	class ItemSodaLvgEmpty {
		class SGH {
            text = "Build Small Garage";
            script = "['SGH',2500,'malaGaraz','ItemSodaLvgEmpty','Small Garage','garage'] execVM 'origins\build_it.sqf'";
        };
	};
	class ItemSodaMzlyEmpty {
		class LGH {
			text = "Build Large Garage";
			script = "['LGH',2500,'velkaGaraz','ItemSodaMzlyEmpty','Large Garage','garage'] execVM 'origins\build_it.sqf'";
        };
   };  
   //Stronghold
	class ItemSodaRabbitEmpty {
		class SHH {
			text = "Build Stronghold";
			script = "['KINGH',2500,'krepost','ItemSodaRabbitEmpty','Stronghold','garage'] execVM 'origins\build_it.sqf'";
		};
	};
	//Garage
	class ItemCitrine {
        class BuildGarage {
            text = "Build Garage";
            script = "['Land_MBG_Garage_Single_C','Vehicle Garage','ItemCitrine'] spawn player_build_garage";
        };
    };
	class ItemAmethyst {
        class BuildHelipad {
            text = "Build Spawn Point";
            script = "['HeliHCivil','Vehicle Garage Spawn Point','ItemAmethyst'] spawn player_build_garage";
        };
    };
	class ItemLetter {
        class BuildBed {
            text = "Build Bed";
           script = "execVM 'Scripts\spawn\build_bed.sqf'";
        };
    };
	class ItemBook3 {
        class BuildLaptop {
            text = "Build CCTV monitor";
            script = "['Notebook','CCTV monitor','ItemBook3'] spawn player_build_garage";
        };
    };
	class ItemBook4 {
        class BuildCamera {
            text = "Build CCTV camera";
            script = "['Loudspeaker','CCTV camera','ItemBook4'] spawn player_build_garage";
        };
    };
};