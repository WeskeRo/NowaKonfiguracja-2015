//DayZ AI Mission Editor by Eugene Zhuravlev © 2014
ZEVMissionAtSameTime					= 2;
ZEVMissionInterval						= 180;
ZEVMissionTimeOut						  = 1200;
ZEVRandomLootGunCnt						= 5;
ZEVRandomLootMagsCnt					= 5;
ZEVRandomLootItemCnt					= 5;
ZEVRandomLootBPackCnt					= 5;
ZEVRandomLootToolCnt					= 5;
ZEVRandomWPCnt							  = 5;
ZEVMissionResearchTime  			= 180;
ZEVMissionConditionCheckTime 	= 20;
ZEVMissionCooldownTime  			= 1800;
ZEVMissionFinishedMissionCleanupDelay = 3600;
ZEVMissionPostDelay						= 5;
ZEVMissionCorpseCleanupTime 	= 3600;
ZEVMissionAIPlayerDetect			= 500;
ZEVMissionDebug							  = 0;
ZEVMissionThrowSmokeShellChance	  = 0.3;
ZEVMissionThrowSmokeShellRate			= 60;
ZEVMissionThrowSmokeMinDistance		= 40;
ZEVMissionThrowSmokeMaxDistance		= 120;
ZEVMissionHumanityGain					  = 10;
_m = ["Bandit Outpost","Reinforcements have Arrived to Bandit Outpost","Outpost has been Cleared, Get Out Now","Outpost remains under Bandit's Control",1500,
_idx = count ZEVStaticMissionList;
ZEVStaticMissionList set [_idx, _m];
_m = ["NAPF HELI PATROL","Patrol over Napf Island has begun","Patrol Heli has Finished its Mission","Patrol Heli has been shot down",5400,
_idx = count ZEVStaticMissionList;
ZEVStaticMissionList set [_idx, _m];
_m = ["IKEA","SUPPLIES IN IKEA CASTLE","Supplies have been recovered","RVL member Failed to recover IKEA Supplies",3600,
_idx = count ZEVStaticMissionList;
ZEVStaticMissionList set [_idx, _m];
_m = ["[ H ] SNIPERS IN THE AREA","SNIPERS HAVE TAKEN OVER AN AREA, FIND OUT WHERE","YOU HAVE FAIL TO TERMINATE ALL SNIPERS","SNIPERS HAVE BEEN KILLED",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] SNIPERS IN THE AREA","SNIPERS HAVE TAKEN OVER AN AREA, FIND OUT WHERE","YOU HAVE FAIL TO TERMINATE ALL SNIPERS","SNIPERS HAVE BEEN KILLED",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] REPAIR TRUCK","REPAIR TRUCK HAS BEEN STOPPED BY BANDITS","REPAIR TRUCK HAS BEEN RECOVERED","BANDITS GET AWAY WITH REPAIR SUPPLIES",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] REPAIR TRUCK","REPAIR TRUCK HAS BEEN STOPPED BY HEROS","REPAIR TRUCK HAS BEEN RECOVERED","HEROS GET AWAY WITH REPAIR SUPPLIES",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] BUILDING MATERIALS","BUILDING MATERIALS HAVE BEEN STOLEN BY HEROS","BUILDING MATERIALS HAVE BEEN RECOVERED","BUILDING MATERIALS HAVE BEEN STOLEN",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] BUILDING SUPPLIES","BUILDING SUPPLIES HAVE BEEN STOLEN BY HEROS","BUILDING SUPPLIES HAVE BEEN RECOVERED","BUILDING SUPPLIES HAVE BEEN STOLEN",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] GUN SUPPLIES","GUN SUPPLY TRUCK HAS BEEN STOPPED BY HEROS","GUNS HAVE BEEN RECOVERED","SUPPLIES OF GUNS HAVE BEEN LOST",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] ARMORY SUPPLIES","ARMORY SUPPLIES HAVE BEEN STOLEN BY BANDITS","ARMORY SUPPLIES HAVE BEEN RECOVERED","ARMORY SUPPLIES HAVE BEEN LOST",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] AMMUNITION DEPOT","AMMO TRUCK IS DOWN, FIND IT","AMMUNITION HAS BEEN RECOVERED","AMMUNITION SUPPLIES HAVE BEEN LOST",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] AMMUNITION TRUCK","AMMO TRUCK IS DOWN, FIND IT","AMMUNITION HAS BEEN RECOVERED","TRUCK WITH AMMUNITION HAS BEEN LOST",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] HUNTING PARTY","HEROS ARE UPRISING","HUNTING PARTY HAVE BEEN ELLIMINATED","RVL MEMBERS HAVE FAILED TO COMPLETE A MISSION",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] BANK THIEVES","BANK HAS BEEN ROBBED BY HEROS","HEROS HAVE BEEN STOPPED","YOU FAILED TO RECOVER BANK'S GOODS",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] BANK THIEVES","BANDITS HAVE ROBBED THE BANK, STOP THEM","BANDITS HAVE BEEN KILLED","YOU HAVE FAILED TO RECOVER BANK'S GOLD",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] ROAD BLOCK","HEROS CREATED A ROAD BLOCK","ROADS HAVE BEEN RE-OPENED","RVL MEMEBR HAVE FAILED TO OPEN UP THE ROADS",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] ROAD BLOCK","BANDITS CREATED A ROAD BLOCK","ROADS HAVE BEEN RE-OPENED","RVL MEMEBR HAVE FAILED TO OPEN UP THE ROADS",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] CARJACKERS","HEROS HAVE CARJACKED FEW CARS","CARS HAVE BEEN RECOVERED","RVL MEMBERS HAVE FAILED TO RECOVER CARS",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] CARJACKERS","BANDITS HAVE CARJACKED FEW CARS","CARS HAVE BEEN RECOVERED","RVL MEMBERS HAVE FAILED TO RECOVER CARS",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] AIRFIELD TAKEOVER","HEROS HAVE GAIN CONTROL OVER AIRFIELD","HEROS HAVE BEEN TERMINATED","WE FAILED TO GAIN CONTROL OVER AIRFIELD",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] RELIGIOUS WARS","CHURCH HAS BEEN TAKEN OVER","RELIGON HAS BEEN RESTORED","WE HAVE FAILED OUR LORD",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] FOOD TRUCK","HEROS STOPPED FOOD TRUCK FROM REACHING ITS DESTINATION","FOOD TRUCK HAS BEEN RECOVERED","HEROS GOT AWAY WITH FOOD SUPPLIES",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] TRUCK WITH FOOD SUPPLIES","BANDITS STOPPED FOOD TRUCK FROM REACHING ITS DESTINATION","FOOD TRUCK HAS BEEN RECOVERED","BANDITS GOT AWAY WITH FOOD SUPPLIES",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] STRONGHOLD","HEROS HAVE SET UP STRONGHOLD","STRONGHOLD HAS BEEN DESTROYED","MISSION FAILED",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] VILLAGE TAKEOVER","BANDITS HAVE TAKEN OVER A VILLAGE","BANDITS HAVE BEEN TERMINATED","MISSION FAIL",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] CITY TAKEOVER","HEROS HAVE TAKEN OVER A CITY","HEROS HAVE BEEN TERMINATED","MISSION FAILED",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] MEDICAL SUPPLIES","MEDS HAVE BEEN STOLEN BY HEROS","HEROS HAVE BEEN TERMINATED","MISSION FAIL",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] MEDICAL DEPOT","MEDS HAVE BEEN STOLEN BY BANDITS","BANDITS HAVE BEEN TERMINATED","MISSION FAIL",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] ISLAND TAKEOVER","ISLAND HAVE BEEN TAKEN OVER BY BANDITS","BANDITS HAVE BEEN KILLED","MISSION FAIL",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ B ] KINGS OF THE MOUNTAIN","HEROS HAVE OCCUPIED A PEAK OF THE MOUNTAIN","HEROS HAVE BEEN KILLED","MISSION FAILED",2400,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];
_m = ["[ H ] ARMY OF ONE","ONE BADASS IS ON THE LOOSE","MISSION SUCCESS","MISSION FAILED",1800,
_idx = count ZEVMissionList;
ZEVMissionList set [_idx, _m];