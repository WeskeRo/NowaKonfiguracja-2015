disableSerialization;
if (isNil "DayZ_UseSteamID") then { DayZ_UseSteamID = true; };

DZE_DeathMsgGlobal = true;
dayz_paraSpawn = false;
MaxVehicleLimit = 150;
MaxDynamicDebris = 1;
DefaultMagazines = ["ItemBandage","ItemBandage","vil_20Rnd_9x18_aps","ItemPainkiller","PartGeneric"];
DefaultWeapons = ["vil_APS","ItemFlashlight","ItemGPS","ItemHatchet_DZE","ItemToolbox","ItemRadio","EvMoney"];
DefaultBackpack = "DZ_Assault_Pack_EP1";
dayz_maxLocalZombies = 10;
dayz_maxGlobalZombiesInit = 5;
dayz_maxGlobalZombiesIncrease = 3;
dayz_maxZeds = 250;
DZE_teleport = [99999,99999,99999,99999,99999];
dayz_zedsAttackVehicles = false;
dayz_maxAnimals = 0;
DynamicVehicleDamageLow = 0;
DynamicVehicleDamageHigh = 50;
dayz_fullMoonNights = true;
DZE_BackpackGuard = false;
DZE_BuildingLimit = 200;
DZE_FriendlySaving = false;
DZE_HumanityTargetDistance = 40;
DZE_PlayerZed = false;
DZE_ForceNameTags = true;
DZE_ConfigTrader = true;
DZE_MissionLootTable = true;
DZE_SelfTransfuse = true;
MaxMineVeins = 5;
DZE_DamageBeforeMaint = 0;
DZE_APlotforLife = true;
DZE_PlotOwnership = false;
DZE_modularBuild = true;
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Preferred any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees
EpochEvents = [
	["any","any","any","any",10,"hated"],
	["any","any","any","any",12,"clean_server"],
	["any","any","any","any",15,"supply_drop"],
	["any","any","any","any",20,"hated"],
	["any","any","any","any",22,"ikea"],
	["any","any","any","any",30,"hated"],
	["any","any","any","any",32,"clean_server"],
	["any","any","any","any",35,"safes"],
	["any","any","any","any",40,"hated"],
	["any","any","any","any",48,"hated"],
	["any","any","any","any",50,"clean_server"]
];
DZE_R3F_WEIGHT = false;
DZE_PlotPole = [50,60];
DZE_StaticConstructionCount = 0;
//UK_lucklevel = 0;
//UK_transfuse = false;
//UK_maintain = false;
//UK_infection = true;
//UK_deploy = false;
//UK_repair = false;
//UK_shield = false;
//UK_boost = false;

//UK111_Admins = ["76561198028730952","76561198117584022","76561198063160037","76561198044878061","76561198118368547","76561198032057910","76561198194737661"];
UKtraders = ["Secretary1","Secretary3","Secretary4","Secretary5","Farmwife1","USMC_LHD_Crew_Yellow","Taliban10","RU_Villager4","RU_Priest","Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4","RU_Hooker5","TK_CIV_Takistani05_EP1","Profiteer1","ValentinaFit","Sportswoman2","Sportswoman3"];
UKslaves = ["Hooker1","Hooker2","Hooker3","Hooker4","Hooker5","RU_Hooker1","RU_Hooker2","RU_Hooker3","RU_Hooker4","RU_Hooker5","SurvivorWdesert_DZ","SurvivorW3_DZ","TK_Aziz_EP1","TK_Soldier_Sniper_EP1","Sportswoman3"];
UKsirenCARS = ["policecar","SUV_TK_CIV_EP1","SUV_TK_CIV_EP1_DZE1","SUV_TK_CIV_EP1_DZE2","SUV_TK_CIV_EP1_DZE3","SUV_TK_CIV_EP1_DZE4","LadaLM","LadaLM_DZE1","LadaLM_DZE2","LadaLM_DZE3","LadaLM_DZE4","Copcar","Copcarhw","Copcarswat"];
//UKindestructible = ["CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoorSmallLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallDoorSmall_DZ","MetalFloor_DZ"];
UKindestructible = ["CinderWallHalf_DZ","CinderWall_DZ","MetalFloor_DZ","Land_MBG_Garage_Single_C","Plastic_Pole_EP1_DZ","MAP_vojenska_palanda","CinderWallDoorway_DZ","CinderWallDoorSmallLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallDoorSmall_DZ"];
//UKbringBack = ["CinderWallDoorway_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallDoor_DZ_Base"];
UKbringBack = [];
UKlocal_vehicles = ["Old_bike_TK_INS_EP1","Old_moto_TK_Civ_EP1","CSJ_GyroC","AH6X_DZ","BAF_GPMG_Minitripod_W","Pickup_PK_TK_GUE_EP1_DZE","pook_H13_transport_PMC","Fishing_Boat","VWGolf","TowingTractor","Chukar_EP1","MAZ_543_SCUD_TK_EP1","GLT_M300_ST","Ikarus_TK_CIV_EP1","ATV_US_EP1","VolhaLimo_TK_CIV_EP1","350z_yellow","policecar"];
UKgarages = ["Land_MBG_Garage_Single_C","Soldier_Sniper_PMC","Tanny_PMC","GUE_Soldier_1","US_Delta_Force_AR_EP1","malaGaraz","velkaGaraz"];
CurrencyName = "Coins";
DZE_ATM = ["RU_Functionary2","MAP_pc"];
MaxBankMoney = 500000;
SafeZoneEnterCount = 0;
sirensOn = 0;
UKsong_limit = 0;
UKmonitor_closed = true;
Lottery_txt = true;
Job_txt = true;
UKgrass = false;
UKgunnerGlitch = true;

UKColourVehicles = [
	"Mi17_Ins",
	"Mi17_Civilian",
	"Mi17_CDF",
	"UH60M_EP1_DZE",
	"Mi17_medevac_Ins",
	"ori_pragaCopter_green",
	"ori_pragaCopter_yellow",
	"Mi17_medevac_CDF",
	"UH60M_EP1_DZ",
	"C130J_US_EP1_DZ",
	"AH6X_DZ",
	"MH6J_DZ",
	"Mi17_Civilian_DZ",
	"AH6J_EP1_DZE",
	"AH6J_EP1_DZ",
	"An2_2_TK_CIV_EP1",
	"Su39",
	"AH6X_EP1",
	"MH6J_EP1",
	"An2_1_TK_CIV_EP1",
	"AH6J_EP1",
	"Mi17_UN_CDF_EP1",
	"UH60M_MEV_EP1",
	"UH60M_EP1",
	"UH1H_TK_EP1",
	"Mi17_TK_EP1",
	"car_sedan",
	"UralRefuel_INS",
	"UAZ_INS",
	"UAZ_RU",
	"car_hatchback",
	"GLT_M300_LT",
	"GLT_M300_ST",
	"ori_ScrapBuggy",
	"Ural_INS",
	"Ural_CDF",
	"UralOpen_CDF",
	"UralOpen_INS",
	"UralCivil",
	"UralCivil2",
	"UralRefuel_CDF",
	"UralRepair_CDF",
	"UralRepair_INS",
	"UralReammo_CDF",
	"UralReammo_INS",
	"HMMWV",
	"HMMWV_M2",
	"HMMWV_TOW",
	"HMMWV_MK19",
	"UAZ_CDF",
	"Offroad_DSHKM_INS",
	"Pickup_PK_GUE",
	"hilux1_civil_1_open",
	"Offroad_SPG9_Gue",
	"datsun1_civil_1_open",
	"Skoda",
	"Pickup_PK_INS",
	"Offroad_DSHKM_Gue",
	"HMMWV_Ambulance_DES_EP1",
	"UralSalvage_TK_EP1",
	"Offroad_DSHKM_TK_GUE_EP1",
	"Offroad_SPG9_TK_GUE_EP1",
	"HMMWV_MK19_DES_EP1",
	"TT650_TK_CIV_EP1",
	"MtvrReammo_DES_EP1",
	"UAZ_AGS30_TK_EP1",
	"UAZ_Unarmed_UN_EP1",
	"Ural_UN_EP1",
	"UralRepair_TK_EP1",
	"HMMWV_Ambulance_CZ_DES_EP1",
	"HMMWV_Avenger_DES_EP1",
	"M1030_US_DES_EP1",
	"MtvrSupply_DES_EP1",
	"Lada1_TK_CIV_EP1",
	"Ikarus",
	"LAV25_HQ",
	"V3S_Gue",
	"V3S_Civ",
	"Kamaz",
	"HMMWV_Avenger",
	"Ural_TK_CIV_EP1",
	"UralSupply_TK_EP1",
	"MTVR",
	"LAV25",
	"UralRefuel_TK_EP1",
	"UralReammo_TK_EP1",
	"MtvrRefuel",
	"MtvrReammo",
	"MtvrRepair",
	"HMMWV_Armored",
	"UAZ_Unarmed_TK_CIV_EP1",
	"UAZ_Unarmed_TK_EP1",
	"HMMWV_Ambulance",
	"Pickup_PK_TK_GUE_EP1",
	"UAZ_MG_TK_EP1",
	"Lada2",
	"VWGolf",
	"M1030",
	"TT650_TK_EP1",
	"TT650_Gue",
	"TT650_Civ",
	"TT650_Ins",
	"MMT_Civ",
	"MtvrRepair_DES_EP1",
	"MtvrSalvage_DES_EP1",
	"HMMWV_DES_EP1",
	"MTVR_DES_EP1",
	"MtvrRefuel_DES_EP1",
	"Lada2_TK_CIV_EP1",
	"Offroad_DSHKM_Gue_DZE",
	"M1130_CV_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
	"SUV_TK_CIV_EP1",
	"SUV_TK_EP1",
	"BTR40_MG_TK_INS_EP1",
	"Offroad_DSHKM_Gue_DZ",
	"ori_transit",
	"Pickup_PK_GUE_DZE",
	"Pickup_PK_TK_GUE_EP1_DZE",
	"VolhaLimo_TK_CIV_EP1",
	"ori_poldek",
	"ori_titanic",
	"ori_survivorBus",
	"Ikarus_TK_CIV_EP1",
	"BRDM2_HQ_TK_GUE_EP1",
	"BRDM2_TK_EP1",
	"BRDM2_TK_GUE_EP1",
	"HMMWV_M1151_M2_CZ_DES_EP1_DZE",
	"BRDM2_ATGM_TK_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZE",
	"BTR40_MG_TK_GUE_EP1",
	"BTR40_TK_INS_EP1",
	"BTR40_TK_GUE_EP1",
	"Pickup_PK_INS_DZE3",
	"Pickup_PK_TK_GUE_EP1_DZE4",
	"Pickup_PK_GUE_DZ",
	"Pickup_PK_TK_GUE_EP1_DZE2",
	"HMMWV_M1035_DES_EP1",
	"hilux1_civil_3_open_EP1",
	"S1203_ambulance_EP1",
	"S1203_TK_CIV_EP1",
	"ori_vil_lada_2105_rust",
	"ori_poldek_black",
	"Old_moto_TK_Civ_EP1",
	"ATV_US_EP1",
	"ATV_CZ_EP1",
	"HMMWV_M998A2_SOV_DES_EP1_DZ",
	"UAZ_MG_TK_EP1_DZE",
	"Pickup_PK_TK_GUE_EP1_DZE1",
	"Offroad_DSHKM_Gue_DZE1",
	"M1133_MEV_EP1",
	"ori_vil_originsmod_truck_civ",
	"HMMWV_DZ",
	"ori_vil_originsmod_lublin_truck",
	"Pickup_PK_INS_DZ",
	"Pickup_PK_GUE_DZE1",
	"UAZ_MG_TK_EP1_DZ",
	"Volha_2_TK_CIV_EP1",
	"BTR90_DZE",
	"UralCivil2_DZE",
	"LAV25_DZE",
	"LAV25_DZ",
	"UAZ_RU_DZE1",
	"UAZ_CDF_DZE1",
	"hilux1_civil_1_open_DZE",
	"car_sedan_DZE1",
	"Lada2_DZE1",
	"VWGolf_DZE1",
	"BTR90_HQ_DZE",
	"UralCivil_DZE",
	"V3S_RA_TK_GUE_EP1_DZE",
	"MtvrRefuel_DES_EP1_DZ",
	"UAZ_INS_DZE1",
	"UAZ_Unarmed_TK_EP1_DZE1",
	"UAZ_Unarmed_TK_CIV_EP1_DZE1",
	"hilux1_civil_1_open_DZE1",
	"datsun1_civil_1_open_DZE",
	"car_hatchback_DZE1",
	"Volha_2_TK_CIV_EP1_DZE1",
	"Skoda_DZE1",
	"KamazOpen_DZE",
	"V3S_Refuel_TK_GUE_EP1",
	"Lada1_TK_CIV_EP1_DZE1",
	"LAV25_HQ_DZE",
	"UAZ_Unarmed_UN_EP1_DZE1",
	"car_sedan_DZE3",
	"datsun1_civil_1_open_DZE1",
	"car_hatchback_DZE4",
	"Lada2_TK_CIV_EP1_DZE1",
	"VolhaLimo_TK_CIV_EP1_DZE1",
	"V3S_TK_GUE_EP1",
	"BMP2_UN_EP1",
	"M113_UN_EP1_DZ",
	"M113_TK_EP1",
	"M113Ambul_UN_EP1",
	"SUV_Orange_DZE1",
	"SUV_Yellow",
	"SUV_Camo",
	"SUV_Yellow_DZE1",
	"SUV_Green_DZE1",
	"SUV_Camo_DZE1",
	"SUV_Orange",
	"SUV_Pink",
	"SUV_White",
	"SUV_Red",
	"SUV_Pink_DZE1",
	"SUV_White_DZE1",
	"WarfareSupplyTruck_RU",
	"WarfareSupplyTruck_INS",
	"WarfareSupplyTruck_USMC",
	"V3S_Reammo_TK_GUE_EP1",
	"M113_UN_EP1",
	"M113_UN_EP1_DZE",
	"M113_TK_EP1_DZ",
	"SUV_Red_DZE1",
	"SUV_Charcoal_DZE1",
	"SUV_TK_CIV_EP1_DZE1",
	"SUV_Silver",
	"SUV_Charcoal",
	"SUV_Green",
	"SUV_Blue",
	"T55_TK_GUE_EP1",
	"V3S_Open_TK_CIV_EP1",
	"V3S_TK_GUE_EP1",
	"V3S_Supply_TK_GUE_EP1",
	"M113_UN_EP1_DZE",
	"M113_TK_EP1_DZE",
	"M113Ambul_TK_EP1",
	"SUV_Silver_DZE1",
	"SUV_Blue_DZE1"
];

//Model Variables
Bandit1_DZ = 	"Bandit1_DZ";
Bandit2_DZ = 	"Bandit2_DZ";
BanditW1_DZ = 	"BanditW1_DZ";
BanditW2_DZ = 	"BanditW2_DZ";
Survivor1_DZ = 	"Survivor2_DZ";
Survivor2_DZ = 	"Survivor2_DZ";
SurvivorW2_DZ = "SurvivorW2_DZ";
SurvivorW3_DZ = "SurvivorW2_DZ";
Sniper1_DZ = 	"Sniper1_DZ";
Camo1_DZ = 		"Camo1_DZ";
Soldier1_DZ = 	"Soldier1_DZ";
Rocket_DZ = 	"Rocket_DZ";

AllPlayers = ["TK_GUE_Soldier_3_EP1","Survivor3_DZ","Survivor2_DZ","SurvivorWcombat_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ","SurvivorWsequishaD_DZ","SurvivorWsequisha_DZ","SurvivorWpink_DZ","SurvivorW3_DZ","SurvivorW2_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","BanditW2_DZ","Soldier_Crew_PMC","Sniper1_DZ","Camo1_DZ","Soldier1_DZ","Rocket_DZ","Rocker1_DZ","Rocker2_DZ","Rocker3_DZ","Rocker4_DZ","Priest_DZ","Functionary1_EP1_DZ","GUE_Commander_DZ","Ins_Soldier_GL_DZ","Haris_Press_EP1_DZ","Pilot_EP1_DZ","RU_Policeman_DZ","pz_policeman","pz_suit1","pz_suit2","pz_worker1","pz_worker2","pz_worker3","pz_doctor","pz_teacher","pz_hunter","pz_villager1","pz_villager2","pz_villager3","pz_priest","Soldier_TL_PMC_DZ","Soldier_Sniper_PMC_DZ","Soldier_Bodyguard_AA12_PMC_DZ","Drake_Light_DZ","CZ_Special_Forces_GL_DES_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","FR_OHara_DZ","FR_Rodriguez_DZ","CZ_Soldier_Sniper_EP1_DZ","Graves_Light_DZ","GUE_Soldier_MG_DZ","GUE_Soldier_Sniper_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_CO_DZ","GUE_Soldier_2_DZ","TK_Special_Forces_MG_EP1_DZ","TK_Soldier_Sniper_EP1_DZ","TK_Commander_EP1_DZ","RU_Soldier_Crew_DZ","INS_Lopotev_DZ","INS_Soldier_AR_DZ","INS_Soldier_CO_DZ","INS_Bardak_DZ","INS_Worker2_DZ"];

//Skins
Clothing1 = ["FR_Ohara_DZ","FR_Miles","FR_Cooper","FR_Rodriguez_DZ","FR_Sykes","FR_AC","FR_AR","FR_Assault_GL","FR_Assault_R","FR_Commander"];
Clothing2 = ["Soldier1_DZ","USMC_Soldier","USMC_Soldier2","USMC_SoldierM_Marksman","USMC_SoldierS","USMC_Soldier_AA","USMC_Soldier_Pilot"];
Clothing3 = ["Ins_Soldier_GL_DZ","CDF_Soldier","CDF_Commander","CDF_Soldier_AR","CDF_Soldier_Crew","CDF_Soldier_Light","CDF_Soldier_Pilot"];
Clothing4 = ["GUE_Soldier_Crew_DZ","RU_Soldier","RU_Soldier_Crew","RU_Soldier_Light","RU_Soldier_Pilot","RUS_Commander","RUS_Soldier1","MVD_Soldier_Sniper"];
Clothing5 = ["Graves_Light_DZ","Drake","Graves","Herrera","Pierce","US_Delta_Force_Assault_EP1","US_Soldier_AR_EP1","US_Soldier_AT_EP1","US_Soldier_MG_EP1","US_Pilot_Light_EP1","US_Soldier_SL_EP1"];
Clothing6 = ["CZ_Special_Forces_GL_DES_EP1_DZ","CZ_Soldier_AT_DES_EP1","CZ_Soldier_Light_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_TL_DES_EP1"];
Clothing7 = ["Bandit2_DZ","MVD_Soldier_Sniper","GER_Soldier_EP1","GER_Soldier_MG_EP1","GER_Soldier_TL_EP1"];
Clothing8 = ["Soldier_Bodyguard_AA12_PMC_DZ","CIV_Contractor2_BAF","BAF_crewman_DDPM","BAF_Soldier_FAC_DDPM","BAF_Soldier_N_DDPM","BAF_Soldier_Marksman_DDPM","BAF_Soldier_Officer_DDPM","BAF_Soldier_L_DDPM"];
Clothing9 = ["TK_INS_Soldier_EP1_DZ","TK_Commander_EP1","TK_Soldier_Crew_EP1","TK_Soldier_MG_EP1","TK_Special_Forces_MG_EP1","TK_INS_Bonesetter_EP1"];
Clothing10 = ["Survivor2_DZ"];
Clothing11 = ["FR_Rodriguez_DZ","FR_Corpsman","FR_GL","FR_Light","FR_Marksman","FR_R","FR_Sapper","FR_TL","Mercenary_Default20b","Mercenary_Default20c","Mercenary_Default20d"];
//Hero
Clothing12 = ["Drake_Light_DZ","arma1_us_soldier_sabass","arma1_us_soldier_sabmark","arma1_us_soldier_sabot","frb_tl","frb_tl_mask","frb_gl","frb_gl_mask","frb_mg","frb_mg_mask","frb_mark","frb_mark_mask","frb_stealth_tl","frb_stealth_rifleman","frb_stealth_sabot","frb_stealth_mark"];
Clothing13 = ["Soldier_Sniper_PMC_DZ","SBH_Alpha_Soldier1","SBH_Alpha_Soldier2","SBH_Alpha_Soldier3","SBH_Alpha_Soldier4","SBH_Alpha_Soldier5","SBH_Alpha_Soldier6","SBH_Alpha_Soldier7","SBH_Alpha_Soldier8","SBH_Alpha_Soldier9","SBH_Alpha_Soldier10","SBH_Alpha_Soldier11","SBH_Alpha_Soldier12"];
Clothing14 = ["CZ_Soldier_Sniper_EP1_DZ"];
Clothing15 = ["Camo1_DZ","US_Delta_Force_TL_EP1","US_Delta_Force_EP1","US_Delta_Force_Medic_EP1","US_Delta_Force_Marksman_EP1","US_Delta_Force_Air_Controller_EP1"];
Clothing16 = ["Rocket_DZ","SFSG_des_tl","SFSG_des_op","SFSG_des_ar","SFSG_des_med","SFSG_des_demo","SFSG_des_mrk","SFSG_des_jtac","SFSG_mtp_tl","SFSG_mtp_op","SFSG_mtp_ar","SFSG_mtp_med","SFSG_mtp_demo","SFSG_mtp_mrk","SFSG_mtp_jtac","SFSG_wdl_tl","SFSG_wdl_op","SFSG_wdl_ar","SFSG_wdl_med","SFSG_wdl_demo","SFSG_wdl_mrk","SFSG_wdl_jtac","SFSG_mtpw_tl","SFSG_mtpw_op","SFSG_mtpw_ar","SFSG_mtpw_med","SFSG_mtpw_demo","SFSG_mtpw_mrk","SFSG_mtpw_jtac"];
Clothing17 = ["Sniper1_DZ","Navy_SEAL_TL","Navy_SEAL_GL","Navy_SEAL_MG","Navy_SEAL_AT","Navy_SEAL_Medic","Navy_SEAL_Marksman","Navy_SEAL_diver","Navy_SEAL_diver_medic","Navy_SEAL_diver_land","Navy_SEAL_AC","Navy_SEAL_ACa","Navy_SEAL_ACb","Navy_SEAL_Shotgun","Navy_SEAL_Sabot","Navy_SEAL_SD"];
Clothing18 = ["Soldier_TL_PMC_DZ","G_WDL_Mercenary_Default0","G_WDL_Mercenary_Default1","G_WDL_Mercenary_Default2","G_WDL_Mercenary_Default3","G_WDL_Mercenary_Default4","G_WDL_Mercenary_Default5","G_WDL_Mercenary_Default6","G_WDL_Mercenary_Default7","G_WDL_Mercenary_Default8","G_WDL_Mercenary_Default9","G_WDL_Mercenary_Default10","G_WDL_Mercenary_Default11","G_WDL_Mercenary_Default12","G_WDL_Mercenary_Default13","G_WDL_Mercenary_Default14","G_WDL_Mercenary_Default15","G_WDL_Mercenary_Default16"];
Clothing19 = ["GUE_Soldier_Sniper_DZ","UKSF_des_tl","UKSF_des_op","UKSF_des_ar","UKSF_des_med","UKSF_des_demo","UKSF_des_mrk","UKSF_des_jtac","UKSF_wdl_tl","UKSF_wdl_op","UKSF_wdl_ar","UKSF_wdl_med","UKSF_wdl_demo","UKSF_wdl_mrk","UKSF_wdl_jtac","UKSF_des_tl_l","UKSF_des_op_l","UKSF_des_ar_l","UKSF_des_med_l","UKSF_des_demo_l","UKSF_des_mrk_l","UKSF_des_jtac_l","UKSF_wdl_tl_l","UKSF_wdl_op_l","UKSF_wdl_ar_l","UKSF_wdl_med_l","UKSF_wdl_demo_l","UKSF_wdl_mrk_l","UKSF_wdl_jtac_l"];
Clothing20 = ["TK_INS_Warlord_EP1_DZ","nof_fsk_tl","nof_fsk_marksman","nof_fsk_grenadier","nof_fsk_heavy","nof_fsk_corpsman","MVD_Soldier"];
//Bandit
Clothing21 = ["Bandit1_DZ","Winter_SOF_Sabot","Winter_SOF_MG","Winter_SOF_TL","Winter_SOF_Medic","Winter_SOF_Marksman","Winter_SOF_GL","Winter_SOF_AT","Winter_SOF_AC","Winter_SOF_DA1","Winter_SOF_DA1a","Winter_SOF_DA1b","Winter_SOF_DA1c","Winter_OPFOR1","Winter_OPFOR2","Winter_OPFOR3","Winter_OPFOR4","Winter_OPFOR5","Winter_OPFOR6","Winter_OPFOR7","Winter_OPFOR8","Winter_OPFOR9","Winter_OPFOR10","EWinter_OPFOR1","EWinter_OPFOR2","EWinter_OPFOR3","EWinter_OPFOR4","EWinter_OPFOR5","EWinter_OPFOR6","EWinter_OPFOR7","EWinter_OPFOR8","EWinter_OPFOR9","EWinter_OPFOR10"];
Clothing22 = ["Bandit2_DZ","Gangsta_merc1","Gangsta_merc2","Gangsta_merc3","Gangsta_merc4","Gangsta_merc5","Gangsta_merc6","Gangsta_merc7","Gangsta_merc8","Gangsta_merc9","Gangsta_merc10","EGangsta_merc1","EGangsta_merc2","EGangsta_merc3","EGangsta_merc4","EGangsta_merc5","EGangsta_merc6","EGangsta_merc7","EGangsta_merc8","EGangsta_merc9","EGangsta_merc10","Taliban1","Taliban2","Taliban3","Taliban4","Taliban5","Taliban6","Taliban7","Taliban8","Taliban9","Taliban11","Taliban12","ETaliban1","ETaliban2","ETaliban3","ETaliban4","ETaliban5","ETaliban6","ETaliban7","ETaliban8","ETaliban9","ETaliban10","ETaliban11","ETaliban12","Terrorist1","Terrorist2","Terrorist3","Terrorist4","Terrorist5","Terrorist6","Terrorist7","Terrorist8","Terrorist9","Terrorist10","Terrorist11","Terrorist12","ETerrorist1","ETerrorist2","ETerrorist3","ETerrorist4","ETerrorist5","ETerrorist6","ETerrorist7","ETerrorist8","ETerrorist9","ETerrorist10","ETerrorist11","ETerrorist12"];
Clothing23 = ["BanditW1_DZ"];
Clothing24 = ["BanditW2_DZ"];
Clothing25 = ["GUE_Commander_DZ","US_Army_Soldier_Light","US_Army_Soldier_GL","US_Army_Soldier2","US_Army_Soldier_Officer","US_Army_Soldier_SL","US_Army_Soldier_TL","US_Army_Soldier_LAT","US_Army_Soldier_AT","US_Army_Soldier_HAT","US_Army_Soldier_AA","US_Army_Soldier_Medic","US_Army_Soldier_AR","US_Army_Soldier_MG","US_Army_SoldierM_Marksman","US_Army_SoldierS"];
Clothing26 = ["GUE_Soldier_2_DZ","Desert_SOF_TL","Desert_SOF_GL","Desert_SOF_MG","Desert_SOF_AT","Desert_SOF_Medic","Desert_SOF_Marksman","Desert_SOF_AC","Desert_SOF_Shotgun","Desert_SOF_Sabot","Desert_SOF_DA1","Desert_SOF_DA1a","Desert_SOF_DA1b","Desert_SOF_DA2","WDL_Mercenary_Default0","WDL_Mercenary_Default1","WDL_Mercenary_Default2","WDL_Mercenary_Default3","WDL_Mercenary_Default4","WDL_Mercenary_Default5","WDL_Mercenary_Default5a","G_WDL_Mercenary_Default5a","WDL_Mercenary_Default6","WDL_Mercenary_Default7","WDL_Mercenary_Default8","WDL_Mercenary_Default9","WDL_Mercenary_Default10","WDL_Mercenary_Default11","WDL_Mercenary_Default12","WDL_Mercenary_Default13","WDL_Mercenary_Default14","WDL_Mercenary_Default15","WDL_Mercenary_Default16"];
Clothing27 = ["GUE_Soldier_CO_DZ","G_Mercenary_Default9a","G_Mercenary_Default9b","Mercenary_Default10","Mercenary_Default11","Mercenary_Default12","Mercenary_Default13","Mercenary_Default14","Mercenary_Default15","Mercenary_Default16","Mercenary_Default17","Mercenary_Default18","Mercenary_Default19","Mercenary_Default19a","G_Mercenary_Default19a","Mercenary_Default20","Mercenary_Default22","Mercenary_Default23","Mercenary_Default24","Mercenary_Default25","Mercenary_Default26","Mercenary_Default27","Mercenary_Default28","G_Mercenary_Default0","G_Mercenary_Default1","G_Mercenary_Default2","G_Mercenary_Default3","G_Mercenary_Default4","G_Mercenary_Default5","G_Mercenary_Default6","G_Mercenary_Default7","G_Mercenary_Default8","G_Mercenary_Default9","G_Mercenary_Default10","G_Mercenary_Default11","G_Mercenary_Default12","G_Mercenary_Default13","G_Mercenary_Default14","G_Mercenary_Default15","G_Mercenary_Default16","G_Mercenary_Default17","G_Mercenary_Default18","G_Mercenary_Default19","G_Mercenary_Default20","G_Mercenary_Default20b","G_Mercenary_Default21","G_Mercenary_Default22","G_Mercenary_Default23","G_Mercenary_Default24","G_Mercenary_Default25","G_Mercenary_Default26","G_Mercenary_Default27","G_Mercenary_Default28"];
AllPlayers = AllPlayers + Clothing1 + Clothing2 + Clothing3 + Clothing4 + Clothing5 + Clothing6 + Clothing7 + Clothing8 + Clothing9 + Clothing10 + Clothing11  + Clothing12  + Clothing13  + Clothing14  + Clothing15  + Clothing16  + Clothing17  + Clothing18  + Clothing19 + Clothing20 + Clothing21+ Clothing22+ Clothing23+ Clothing24+ Clothing25+ Clothing26+ Clothing27 ;

MeleeWeapons = ["MeleeFishingPole","MeleeCrowbar","MeleeBaseBallBatNails","MeleeBaseBallBatBarbed","MeleeBaseBallBat","Crossbow_DZ","MeleeSledge","MeleeMachete","MeleeHatchet_DZE"];
gear_done = false;

//Cooking
meatraw = [
	"FoodSteakRaw",
	"FoodmeatRaw",
	"FoodbeefRaw",
	"FoodmuttonRaw",
	"FoodchickenRaw",
	"FoodrabbitRaw",
	"FoodbaconRaw",
	"ItemTrout",
	"ItemSeaBass",
	"ItemTuna"
];
exceptionsraw = ["ItemTuna"];
meatcooked = [
	"FoodSteakCooked",
	"FoodmeatCooked",
	"FoodbeefCooked",
	"FoodmuttonCooked",
	"FoodchickenCooked",
	"FoodrabbitCooked",
	"FoodbaconCooked",
	"ItemTroutCooked",
	"ItemSeaBassCooked",
	"ItemTunaCooked"
];
//Eating
no_output_food = ["FoodMRE", "FoodPistachio", "FoodNutmix","FoodBioMeat"]+meatcooked+meatraw;

// Food with increased chance for infection.
badfood = ["FoodBioMeat","FoodCanUnlabeled"];

food_with_output=[
	"FoodCanBakedBeans",
	"FoodCanSardines",
	"FoodCanFrankBeans",
	"FoodCanPasta",
	"FoodCanGriff",
	"FoodCanBadguy",
	"FoodCanBoneboy",
	"FoodCanCorn",
	"FoodCanCurgon",
	"FoodCanDemon",
	"FoodCanFraggleos",
	"FoodCanHerpy",
	"FoodCanOrlok",
	"FoodCanPowell",
	"FoodCanTylers",
	"FoodCanUnlabeled"
];

food_output = [
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty"
];
//Drinking
no_output_drink = ["ItemWaterbottle", "ItemWaterbottleBoiled"];
drink_with_output = [
	"ItemSoda",  //just to define item for ItemSodaEmpty
	"ItemSodaRbull",
	"ItemSodaOrangeSherbet",
	"ItemSodaCoke",
	"ItemSodaPepsi",
	"ItemSodaMdew",
	"ItemSodaMtngreen",
	"ItemSodaR4z0r",
	"ItemSodaClays",
	"ItemSodaSmasht",
	"ItemSodaDrwaste",
	"ItemSodaLemonade",
	"ItemSodaLvg",
	"ItemSodaMzly",
	"ItemSodaRabbit"
];
drink_output = [
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];
boil_tin_cans = [
	"TrashTinCan",
	"FoodCanGriffEmpty",
	"FoodCanBadguyEmpty",
	"FoodCanBoneboyEmpty",
	"FoodCanCornEmpty",
	"FoodCanCurgonEmpty",
	"FoodCanDemonEmpty",
	"FoodCanFraggleosEmpty",
	"FoodCanHerpyEmpty",
	"FoodCanOrlokEmpty",
	"FoodCanPowellEmpty",
	"FoodCanTylersEmpty",
	"FoodCanUnlabeledEmpty",
	"ItemSodaEmpty",
	"ItemSodaCokeEmpty",
	"ItemSodaPepsiEmpty",
	"ItemSodaMdewEmpty",
	"ItemSodaMtngreenEmpty",
	"ItemSodaR4z0rEmpty",
	"ItemSodaClaysEmpty",
	"ItemSodaSmashtEmpty",
	"ItemSodaDrwasteEmpty",
	"ItemSodaLemonadeEmpty",
	"ItemSodaLvgEmpty",
	"ItemSodaMzlyEmpty",
	"ItemSodaRabbitEmpty"
];

dayz_combination = "";
dayz_humanitytarget = "";
dayz_combatLog = "";
canRoll = true;

canbuild = true;

//Hunting Variables
dayZ_partClasses = [
	"PartFueltank",
	"PartWheel",
	//"PartGeneric",	//No need to add, it is default for everything
	"PartEngine"
];
dayZ_explosiveParts = [
	"palivo",
	"motor"
];
//Survival Variables
SleepFood =				2160; //minutes (48 hours)
SleepWater =			1440; //minutes (24 hours)
SleepTemperatur	= 		90 / 100;	//Firs Value = Minutes untill Player reaches the coldest Point at night (without other effects! night factor expected to be -1)			//TeeChange

//Server Variables
allowConnection = 		false;
isSinglePlayer =		false;
PVDZE_serverObjectMonitor = [];
PlayerDeaths = [];

//Streaming Variables (player only)
dayz_Locations = [];
dayz_locationsActive = [];

//GUI
Dayz_GUI_R = 0.38; // 0.7
Dayz_GUI_G = 0.63; // -0.63
Dayz_GUI_B = 0.26; // -0.26

//P4L
if (isNil "Dayz_Dark_UI") then { Dayz_Dark_UI = false; };

//Player self-action handles
dayz_resetSelfActions = {
	s_player_fire =			-1;
	s_player_cook =			-1;
	s_player_boil =			-1;
	s_player_fireout =		-1;
	s_player_butcher =		-1;
	s_player_packtent = 	-1;
	s_player_packvault = 	-1;
	s_player_lockvault = 	-1;
	s_player_unlockvault = 	-1;
	s_player_fillwater =	-1;
	s_player_fillwater2 = 	-1;
	s_player_fillfuel = 	-1;
	s_player_grabflare = 	-1;
	s_player_dropflare =	-1;
	s_player_callzombies = 	-1;
	s_player_showname = 	-1;
	s_player_debuglootpos = 	-1;
	s_player_pzombiesattack = 	-1;
	s_player_pzombiesvision =	-1;
	s_player_pzombiesfeed = 	-1;
	s_player_removeflare = 	-1;
	s_player_painkiller =	-1;
	s_player_studybody = 	-1;
	s_player_tamedog =		-1;
	s_player_madsci_crtl =	-1;
	s_player_parts_crtl =	-1;
	s_build_Sandbag1_DZ = 	-1;
	s_build_Hedgehog_DZ =	-1;
	s_build_Wire_cat1 =		-1;
	s_player_deleteBuild =	-1;
	s_player_forceSave = 	-1;
	s_player_checkGear = 	-1;
	s_player_flipveh = 		-1;
	s_player_stats =		-1;
	s_player_sleep =		-1;
	s_player_movedog =		-1;
	s_player_speeddog =		-1;
	s_player_calldog = 		-1;
	s_player_feeddog = 		-1;
	s_player_waterdog = 	-1;
	s_player_staydog = 		-1;
	s_player_trackdog = 	-1;
	s_player_barkdog = 		-1;
	s_player_warndog = 		-1;
	s_player_followdog = 	-1;
	s_player_repair_crtl =  -1;
	s_player_information =  -1;
	s_player_fuelauto =  	-1;
	s_player_fuelauto2 =  	-1;
	s_player_fillgen = 		-1;
	s_player_upgrade_build = 	-1;
	s_player_maint_build = 		-1;
	s_player_downgrade_build = 	-1;
	s_player_towing	=			-1;
	s_halo_action = 			-1;
	s_player_SurrenderedGear = 	-1;
	s_player_heli_lift = 		-1;
	s_player_heli_detach = 		-1;
	s_player_lockUnlock_crtl = 	-1;
	s_player_packOBJ = 		-1;
	s_player_clothes =		-1;
	s_player_sirens_on = 	-1;
	s_player_sirens_off = 	-1;
	copcar_stoppolice = 	-1;
	s_player_dance = 		-1;
	s_player_filloil = 		-1;
	s_player_swapoil = 		-1;
	s_player_travel = 		-1;
	s_player_lottery = 		-1;
	s_player_slots = 		-1;
	s_player_guess = 		-1;
	s_player_pawn = 		-1;
	s_player_hat = 			-1;
	s_player_SlaveMenu =	-1;
	s_sell_hooker = 		-1;
	s_player_Getweed = 		-1;
	s_player_cowMenu = 		-1;
	s_sell_cow =			-1;
	s_player_robber = 		-1;
	s_water_suicide = 		-1;
	s_player_nitroInstall = -1;
	s_player_nitrobooston = -1;
	s_medic_actions	= 		-1;
	s_player_bury_human = 	-1;
	s_player_plotManagement = -1;
	s_givemoney_dialog = 	-1;
	s_bank_dialog = 		-1;
	s_bank_dialog2 = 		-1;
	s_bank_dialog3 = 		-1;
	s_player_delivery1 = 	-1;
	s_player_delivery2 = 	-1;
	s_player_manageDoor = 	-1;
	s_player_mining = 		-1;
	s_player_mine = 		-1;
	s_player_hero_bandit = 	-1;
	s_player_sting = 		-1;
	s_player_UKcareer = 	-1;
	s_player_inCarlockUnlock_crtl = -1;
    s_player_incarlockunlock = [];
	s_player_detach = 		-1;
	s_player_helidoor = 	-1;
	s_player_helidoor_remove = -1;
	s_garage_dialog = 		-1;
	s_player_healMe =		-1;
	s_player_marketplace = 	-1;
	s_player_tacSeat = 		-1;
	s_player_tacSeat1 = 	-1;
	s_player_tacSeat2 = 	-1;
	s_player_tacSeat3 = 	-1;
	s_player_cargoDrop = 	-1;
	s_player_removeBed = 	-1;
	suv_packgun = 			-1;
	suv_deploygun = 		-1;
	s_player_zedfree = 		-1;
	s_player_laptop = 		-1;
	s_player_rescue = 		-1;
	s_player_rescueME =		-1;
	//Origins
	s_player_build_origins_house = -1;
	s_player_build_origins_garage = -1;
	s_player_build_origins_stronghold = -1;
	s_player_origins_unlock = -1;
	s_player_origins_stronghold_doors = -1;
	sub_up = -1;
	sub_down = -1;
	//P4L
	s_player_maintain_area = -1;
	s_player_maintain_area_preview = -1;
	s_player_toggleSnap = -1;
    s_player_toggleSnapSelect = -1;
    s_player_toggleSnapSelectPoint = [];
    snapActions = -1;
	s_player_plot_boundary_on = -1;
	s_player_plot_boundary_off = -1;
	s_player_plot_take_ownership = -1;
	//Vectors
	s_player_toggleDegree = -1;
	s_player_toggleDegrees = [];
	degreeActions = -1;
	s_player_toggleVector = -1;
	s_player_toggleVectors = [];
	vectorActions = -1;
};
call dayz_resetSelfActions;

//Lock from inside & stuff
dayz_myLockedVehicle = objNull;
DZE_SubMarine = objNull;
theSUV = objNull;
siren_guy = objNull;
boost_guy = objNull;

//Engineering variables
s_player_lastTarget = [objNull,objNull,objNull,objNull,objNull];
s_player_repairActions = [];
s_player_lockunlock = [];

//Custom
s_player_madsci 		= 	[];
s_player_parts 			= 	[];
s_player_combi 			= 	[];

//P4L
snapGizmos = [];
snapGizmosNearby = [];

//Initialize Medical Variables
r_interrupt = 			false;
r_doLoop = 				false;
r_self = 				false;
r_self_actions = 		[];
r_drag_sqf = 			false;
r_action = 				false;
r_action_unload = 		false;
r_player_handler = 		false;
r_player_handler1 = 	false;
r_player_dead = 		false;
r_player_unconscious = 	false;
r_player_infected =		false;
r_player_injured = 		false;
r_player_inpain = 		false;
r_player_loaded = 		false;
r_player_cardiac = 		false;
r_fracture_legs =		false;
r_fracture_arms =		false;
r_player_vehicle =		player;
r_player_blood = 		12000;
r_player_lowblood = 	false;
r_player_timeout =		0;
r_player_bloodTotal = 	r_player_blood;
r_public_blood =		r_player_blood;
r_player_bloodDanger =	r_player_bloodTotal * 0.2;
r_player_actions = 		[];
r_handlerCount = 		0;
r_action_repair = 		false;
r_action_targets = 		[];
r_pitchWhine = 			false;
r_isBandit =			false;
isInTraderCity =		false;
NORRN_dropAction =		-1;
DZE_PROTOBOX = objNull;

//ammo routine
r_player_actions2 = [];
r_action2 = false;
r_player_lastVehicle = objNull;
r_player_lastSeat = [];
r_player_removeActions2 = {
	if (!isNull r_player_lastVehicle) then {
		{
			r_player_lastVehicle removeAction _x;
		} count r_player_actions2;
		r_player_actions2 = [];
		r_action2 = false;
	};
};

USEC_woundHit 	= [
	"",
	"body",
	"hands",
	"legs",
	"head_hit"
];
DAYZ_woundHit 	= [
	[
		"body",
		"hands",
		"legs",
		"head_hit"
	],
	[ 0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,2,2,3]
];
DAYZ_woundHit_ok = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,0,0,0,1,1,1,2,2]
];
DAYZ_woundHit_dog = [
	[
		"body",
		"hands",
		"legs"
	],
	[0,0,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2]
];
USEC_MinorWounds 	= [
	"hands",
	"legs"
];
USEC_woundPoint	= [
	["Pelvis","aimpoint"],
	["aimpoint"], //,"RightShoulder","LeftShoulder"
	["lelbow","relbow"],
	["RightFoot","LeftFoot"],
	["neck","pilot"]
];
USEC_typeOfWounds = [
	"Pelvis",
	"aimpoint",
	"lelbow","relbow",
	"RightFoot","LeftFoot",
	"neck","pilot"
];

DZE_vehicleZwounds = [
	"sklo predni L",
	"sklo predni P",
	"sklo zadni",
	"sklo zadni L",
	"sklo zadni P",
	"sklo P",
	"Glass1",
	"Glass2",
	"Glass3",
	"Glass4",
	"Glass5",
	"Glass6"
];

DZE_HeliAllowTowFrom = [
	"CH_47F_EP1_DZE",
	"CH_47F_EP1_DZ",
	"CH_47F_BAF",
	"CH_47F_EP1",
	"BAF_Merlin_DZE",
	"CH53_DZE"
];

DZE_HeliAllowToTow = [
	"hilux1_civil_1_open",
	"HMMWV_Base",
	"Lada_base",
	"Offroad_DSHKM_base",
	"Pickup_PK_base",
	"SkodaBase",
	"tractor",
	"VWGolf",
	"Volha_TK_CIV_Base_EP1",
	"S1203_TK_CIV_EP1",
	"SUV_Base_EP1",
	"ArmoredSUV_Base_PMC",
	"UAZ_Base",
	"LandRover_Base",
	"Ship"
];

//Initialize Zombie Variables
dayz_zombieTargetList = [
	["SoldierWB",50],
	["Air",500],
	["LandVehicle",200]
];
PVDZE_plr_Hit = [];
PVDZE_obj_Publish = [];		//used for eventhandler to spawn a mirror of players tent
PVDZE_plr_HideBody = objNull;
dayz_selectedVault = objNull;
dayz_selectedDoor = objNull;

PVDZE_veh_Publish = [];		// for vehicle traders
PVDZE_obj_Trade = [];		// For all traders increment qty
PVDZE_plr_TradeMenu = [];  		// For all traders
PVDZE_plr_DeathB = [];

//DayZ settings
dayz_dawn = 6;
dayz_dusk = 18;
DAYZ_agentnumber = 0;
dayz_animalDistance = 800;
dayz_zSpawnDistance = 1000;

dayz_maxMaxModels = 80; // max quantity of Man models (player || Z, dead || alive) around players. Below this limit we can spawn Z // max quantity of loot piles around players. Below this limit we can spawn some loot
dayz_spawnArea = 200; // radius around player where we can spawn loot & Z
dayz_cantseeDist = 100; // distance from which we can spawn a Z in front of any player without ray-tracing && angle checks
dayz_cantseefov = 50; // half player field-of-view. Visible Z won't be spawned in front of any near players
dayz_canDelete = 200; // Z, further than this distance from its "owner", will be deleted

if(isNil "DZE_SelfTransfuse") then {
	DZE_SelfTransfuse = false;
};
if(isNil "dayz_maxAnimals") then {
	dayz_maxAnimals = 5;
};
if(isNil "timezoneswitch") then {
	timezoneswitch = 0;
};
if(isNil "dayz_maxLocalZombies") then {
	dayz_maxLocalZombies = 15;
};
if(isNil "dayz_maxGlobalZombiesInit") then {
	dayz_maxGlobalZombiesInit = 15;
};
if(isNil "dayz_maxGlobalZombiesIncrease") then {
	dayz_maxGlobalZombiesIncrease = 5;
};
if(isNil "dayz_maxZeds") then {
	dayz_maxZeds = 500;
};
if (isNil "DZE_PlayerZed") then {
	DZE_PlayerZed = true;
};
if (isNil "DZE_GodModeBase") then {
	DZE_GodModeBase = false;
};
if(isNil "DZEdebug") then {
	DZEdebug = false;
};
if (isNil "DZE_Debug_Damage") then {
	DZE_Debug_Damage = true;
};
if(isNil "DZE_TRADER_SPAWNMODE") then {
	DZE_TRADER_SPAWNMODE = false;
};
if(isNil "dayz_tameDogs") then {
	dayz_tameDogs = false;
};
if(isNil "dayz_sellDistance_vehicle") then {
	dayz_sellDistance_vehicle = 10;
};
if(isNil "dayz_sellDistance_boat") then {
	dayz_sellDistance_boat = 30;
};
if(isNil "dayz_sellDistance_air") then {
	dayz_sellDistance_air = 40;
};
if(isNil "dayz_paraSpawn") then {
	dayz_paraSpawn = false;
};
if(isNil "dayz_minpos") then {
	dayz_minpos = -20000;
};
if(isNil "dayz_maxpos") then {
	dayz_maxpos = 20000;
};
if(isNil "DZE_BuildingLimit") then {
	DZE_BuildingLimit = 150;
};
if(isNil "DZE_HumanityTargetDistance") then {
	DZE_HumanityTargetDistance = 25;
};
if(isNil "DZE_FriendlySaving") then {
	DZE_FriendlySaving = true;
};
if(isNil "DZE_BuildOnRoads") then {
	DZE_BuildOnRoads = false;
};
if(isNil "DZE_MissionLootTable") then {
	DZE_MissionLootTable = false;
};
if(isNil "DZE_ConfigTrader") then {
	DZE_ConfigTrader = false;
};
if(isNil "DZE_LootSpawnTimer") then {
	DZE_LootSpawnTimer = 10;
};
if(isNil "DZE_HeliLift") then {
	DZE_HeliLift = true;
};
if(isNil "DZE_DamageBeforeMaint") then {
	DZE_DamageBeforeMaint = 0.09;
};
if(isNil "DZE_StaticConstructionCount") then {
	DZE_StaticConstructionCount = 0;
};
if (isNil "DZE_selfTransfuse_Values") then {
	DZE_selfTransfuse_Values = [12000, 15, 300];
};

//P4L
if (isNil "helperDetach") then {
	helperDetach = false;
};
if (isNil "DZE_snapExtraRange") then {
	DZE_snapExtraRange = 0;
};
if (isNil "DZE_PlotOwnership") then {
	DZE_PlotOwnership = false;
};
if (isNil "DZE_checkNearbyRadius") then {
	DZE_checkNearbyRadius = 30;
};

// needed on server
if(isNil "DZE_PlotPole") then {
	DZE_PlotPole = [30,45];
};
if(isNil "DZE_maintainRange") then {
	DZE_maintainRange = ((DZE_PlotPole select 0)+20);
};

DZE_REPLACE_WEAPONS = [["Crossbow","ItemMatchbox","ItemHatchet"],["Crossbow_DZ","ItemMatchbox_DZE","ItemHatchet_DZE"]];

if(isNil "dayz_zedSpawnVehCount") then {
	dayz_zedSpawnVehCount = dayz_maxLocalZombies / 2;
};
if(isNil "dayz_spawnAirCount") then {
	dayz_spawnAirCount = 0;
};
if(isNil "dayz_zedsAttackVehicles") then {
	dayz_zedsAttackVehicles = true;
};

// update objects
dayz_updateObjects = ["Plane","Tank","Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "VaultStorage","LockboxStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","Scaffolding_DZ","Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek","malaGaraz","velkaGaraz","kingramida","krepost","ori_safe"];

dayz_disallowedVault = ["TentStorage", "BuiltItems","ModularItems","DZE_Base_Object"];
dayz_reveal = ["AllVehicles","WeaponHolder","Land_A_tent","BuiltItems","ModularItems","DZE_Base_Object"];

dayz_allowedObjects = ["TentStorage","TentStorageDomed","TentStorageDomed2", "VaultStorageLocked", "Hedgehog_DZ", "Sandbag1_DZ","BagFenceRound_DZ","TrapBear","Fort_RazorWire","WoodGate_DZ","Land_HBarrier1_DZ","Land_HBarrier3_DZ","Land_HBarrier5_DZ","Fence_corrugated_DZ","M240Nest_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","Plastic_Pole_EP1_DZ","Generator_DZ","StickFence_DZ","LightPole_DZ","FuelPump_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","SandNest_DZ","DeerStand_DZ","MetalPanel_DZ","WorkBench_DZ","WoodFloor_DZ","WoodLargeWall_DZ","WoodLargeWallDoor_DZ","WoodLargeWallWin_DZ","WoodSmallWall_DZ","WoodSmallWallWin_DZ","WoodSmallWallDoor_DZ","LockboxStorageLocked","WoodFloorHalf_DZ","WoodFloorQuarter_DZ","WoodStairs_DZ","WoodStairsSans_DZ","WoodStairsRails_DZ","WoodSmallWallThird_DZ","WoodLadder_DZ","Land_DZE_GarageWoodDoor","Land_DZE_LargeWoodDoor","Land_DZE_WoodDoor","Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoorSmall_DZ","CinderWallDoorSmallLocked_DZ","MetalFloor_DZ","Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek","malaGaraz","velkaGaraz","kingramida","krepost","ori_safe","WoodRamp_DZ","GunRack_DZ","FireBarrel_DZ","WoodCrate_DZ","Scaffolding_DZ","MAP_P_ytong","Sign_Danger","MAP_toilet_b","Land_MBG_Garage_Single_C","HeliHCivil","MAP_vojenska_palanda","Notebook","Loudspeaker"];

DZE_LockableStorage = ["VaultStorage","VaultStorageLocked","LockboxStorageLocked","LockboxStorage"];
DZE_LockedStorage = ["VaultStorageLocked","LockboxStorageLocked"];
DZE_UnLockedStorage = ["VaultStorage","LockboxStorage"];

DZE_maintainClasses = ["ModularItems","DZE_Housebase","Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek","malaGaraz","velkaGaraz","kingramida","krepost","ori_safe","LightPole_DZ","BuiltItems","Plastic_Pole_EP1_DZ","Fence_corrugated_DZ","CanvasHut_DZ","ParkBench_DZ","MetalGate_DZ","StickFence_DZ","DesertCamoNet_DZ","ForestCamoNet_DZ","DesertLargeCamoNet_DZ","ForestLargeCamoNet_DZ","DeerStand_DZ","Scaffolding_DZ","FireBarrel_DZ","CinderWallHalf_DZ","CinderWall_DZ","CinderWallDoorway_DZ","CinderWallDoorSmallLocked_DZ","CinderWallSmallDoorway_DZ","CinderWallDoor_DZ","CinderWallDoorLocked_DZ","CinderWallDoorSmall_DZ","MetalFloor_DZ","Land_MBG_Garage_Single_C","HeliHCivil","MAP_vojenska_palanda","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","Notebook","Loudspeaker"];

DZE_DoorsLocked = ["Land_DZE_GarageWoodDoorLocked","Land_DZE_LargeWoodDoorLocked","Land_DZE_WoodDoorLocked","CinderWallDoorLocked_DZ","CinderWallDoorSmallLocked_DZ"];

// List of removable items that require crowbar
DZE_isRemovable = ["Fence_corrugated_DZ","M240Nest_DZ","ParkBench_DZ","Plastic_Pole_EP1_DZ","FireBarrel_DZ","Scaffolding_DZ"];
DZE_isWreck = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
DZE_isWreckBuilding = ["Land_wreck_cinder","Land_wood_wreck_quarter","Land_wood_wreck_floor","Land_wood_wreck_third","Land_wood_wreck_frame","Land_iron_vein_wreck","Land_silver_vein_wreck","Land_gold_vein_wreck","Land_ammo_supply_wreck"];

DZE_isNewStorage = ["VaultStorage","OutHouse_DZ","Wooden_shed_DZ","WoodShack_DZ","StorageShed_DZ","GunRack_DZ","WoodCrate_DZ","Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek","malaGaraz","velkaGaraz","kingramida","krepost","ori_safe"];

// These work with just a running generator
dayz_fuelpumparray = ["FuelPump_DZ","Land_A_FuelStation_Feed","Land_Ind_FuelStation_Feed_EP1","Land_FuelStation_Feed_PMC","FuelStation","Land_ibr_FuelStation_Feed","Land_fuelstation_army","Land_fuelstation","land_fuelstation_w","Land_benzina_schnell"];
DZE_fueltruckarray = ["KamazRefuel_DZ","UralRefuel_TK_EP1_DZ","MtvrRefuel_DES_EP1_DZ","V3S_Refuel_TK_GUE_EP1_DZ","MtvrRefuel_DZ","KamazRefuel_DZE","UralRefuel_TK_EP1_DZE","MtvrRefuel_DES_EP1_DZE","V3S_Refuel_TK_GUE_EP1_DZE","MtvrRefuel_DZE"];

// Standard Fuel sources
dayz_fuelsources = ["Land_Ind_TankSmall","Land_fuel_tank_big","Land_fuel_tank_stairs","Land_fuel_tank_stairs_ep1","Land_wagon_tanker","Land_fuelstation","Land_fuelstation_army","land_fuelstation_w","Land_benzina_schnell"];

DZE_Lock_Door = "";

//P4L
if (isNil "DZE_plotOwnershipExclusions") then {
	DZE_plotTakeOwnershipItems = dayz_allowedObjects - (DZE_LockableStorage + ["Plastic_Pole_EP1_DZ","TentStorage","TentStorageDomed","TentStorageDomed2"]);
};

//init global arrays for Loot Chances
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\loot_init.sqf";

if (isServer) then {
	dayz_players = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];

	DZE_DYN_AntiStuck = 0;
	DZE_DYN_AntiStuck2nd = 0;
	DZE_DYN_AntiStuck3rd = 0;

	if(isNil "dayz_fullMoonNights") then {
		dayz_fullMoonNights = false;
	};
	if(isNil "EpochEvents") then {
		EpochEvents = [];
	};
	if(isNil "DZE_vehicleAmmo") then {
		DZE_vehicleAmmo = 0;
	};

	if(isNil "DZE_BackpackGuard") then {
		DZE_BackpackGuard = true;
	};

	if(isNil "DZE_CleanNull") then {
		DZE_CleanNull = false;
	};
	if (isNil "DZE_DeathMsgGlobal") then {
		DZE_DeathMsgGlobal = false;
	};
	if (isNil "DZE_DeathMsgSide") then {
		DZE_DeathMsgSide = false;
	};
	if (isNil "DZE_DeathMsgTitleText") then {
		DZE_DeathMsgTitleText = false;
	};
	
	//DZE_safeVehicle = ["ParachuteWest","ParachuteC"];
	DZE_safeVehicle = ["ParachuteWest","ParachuteC","MMT_Civ","Old_moto_TK_Civ_EP1","AH6X_DZ","BAF_GPMG_Minitripod_W","UralCivil2"];
};

if (!isDedicated) then {

	dayz_spawnPos = getPosATL player;

	dayz_buildingMonitor = [];	//Buildings to check
	dayz_bodyMonitor = [];

	// weather control var
	zeroPreviousWeather = [0,0,[0,0],0];
	zeroCurrentWeather = [0,0,[0,0],0];

	if (DZE_MissionLootTable) then {
		dayz_baseTypes = 		getArray (missionConfigFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	} else {
		dayz_baseTypes = 		getArray (configFile >> "CfgBuildingLoot" >> "Default" >> "zombieClass");
	};


	//temperature variables
	dayz_temperatur 		= 	36;		//TeeChange
	dayz_temperaturnormal 	= 	36;		//TeeChange
	dayz_temperaturmax 		= 	42;		//TeeChange
	dayz_temperaturmin 		= 	27;		//TeeChange

	//player special variables
	dayZ_lastPlayerUpdate = 0;
	dayZ_everyonesTents =	[];
	dayz_hunger	=			0;
	dayz_thirst = 			0;
	dayz_combat =			0;
	dayz_preloadFinished = 	false;
	dayz_statusArray =		[1,1];
	dayz_disAudial =		0;
	dayz_disVisual =		0;
	dayz_firedCooldown = 	0;
	dayz_DeathActioned =	false;
	dayz_canDisconnect = 	true;
	dayz_damageCounter =	time;
	dayz_lastSave =			time;
	dayz_isSwimming	=		true;
	dayz_isKneeling	=		false;
	dayz_isCrawling	=		false;
	dayz_PreviousTown =		"Wilderness";
	dayz_currentDay = 		0;
	dayz_hasLight = 		false;
	dayz_surfaceNoise =		0;
	dayz_surfaceType =		"None";
	dayz_noPenalty = 		[];
	dayz_heavenCooldown =	0;
	deathHandled = 			false;
	dayz_lastHumanity =		0;
	dayz_guiHumanity =		-90000;
	dayz_firstGroup = 		group player;
	dayz_originalPlayer = 	player;
	dayz_sourceBleeding =	objNull;
	dayz_clientPreload = 	false;
	dayz_authed = 			false;
	dayz_panicCooldown = 	0;
	dayz_areaAffect =		2.5;
	dayz_heartBeat = 		false;
	dayzClickTime =			0;
	//Current local
	dayz_spawnZombies = 0;
	dayz_swarmSpawnZombies = 0;
	//Max local
	dayz_maxLocalZombies = 30; // max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
	//Current NearBy
	dayz_CurrentNearByZombies = 0;
	//Max NearBy
	dayz_maxNearByZombies = 60; // max quantity of Z controlled by local gameclient, used by player_spawnCheck. Below this limit we can spawn Z
	//Current total
	dayz_currentGlobalZombies = 0;
	//Max global zeds.
	dayz_maxGlobalZeds = 3000;
	dayz_spawnDelay =		120;
	dayz_spawnWait =		-120;
	dayz_lootDelay =		3;
	dayz_lootWait =			-300;
	//used to count global zeds around players
	dayz_CurrentZombies = 0;
	//Used to limit overall zed counts
	dayz_tickTimeOffset = 0;
	dayz_currentWeaponHolders = 0;
	dayz_maxMaxWeaponHolders = 80;
	dayz_maxCurrentZeds = 0;
	dayz_inVehicle =		false;
	dayz_Magazines = 		[];
	dayzGearSave = 			false;
	dayz_unsaved =			false;
	dayz_scaleLight = 		0;
	dayzDebug = false;
	dayzState = -1;

	DZE_ActionInProgress =		false;

	// DayZ Epoch Client only variables
	if(isNil "DZE_AllowForceSave") then {
		DZE_AllowForceSave = false;
	};
	if(isNil "DZE_AllowCargoCheck") then {
		DZE_AllowCargoCheck = true;
	};
	if(isNil "DZE_ForceNameTags") then {
		DZE_ForceNameTags = false;
	};
	if(isNil "DZE_ForceNameTagsOff") then {
		DZE_ForceNameTagsOff = false;
	};
	if(isNil "DZE_ForceNameTagsInTrader") then {
		DZE_ForceNameTagsInTrader = false;
	};
	if(isNil "DZE_HaloJump") then {
		DZE_HaloJump = true;
	};

	if(isNil "DZE_AntiWallLimit") then {
		DZE_AntiWallLimit = 3;
	};
	if(isNil "DZE_requireplot") then {
		DZE_requireplot = 1;
	};
	if(isNil "DZE_R3F_WEIGHT") then {
		DZE_R3F_WEIGHT = true;
	};

	DZE_AntiWallCounter = 0;

	DZE_FreshSpawn = false;

	DZE_myHaloVehicle = objNull;
	dayz_myLiftVehicle = objNull;
	//DZE_myDetachChute = objNull;

	DZE_Friends = [];

	DZE_CanPickup = true;
	DZE_Q = false;
	DZE_Z = false;

	DZE_Q_alt = false;
	DZE_Z_alt = false;

	DZE_Q_ctrl = false;
	DZE_Z_ctrl = false;

	DZE_5 = false;
	DZE_4 = false;
	DZE_6 = false;

	DZE_cancelBuilding = false;
	DZE_PZATTACK = false;

	DZE_trees = ["t_picea2s_snow.p3d","b_corylus.p3d","t_quercus3s.p3d","t_larix3s.p3d","t_pyrus2s.p3d","str_briza_kriva.p3d","dd_borovice.p3d","les_singlestrom_b.p3d","les_singlestrom.p3d","smrk_velky.p3d","smrk_siroky.p3d","smrk_maly.p3d","les_buk.p3d","str krovisko vysoke.p3d","str_fikovnik_ker.p3d","str_fikovnik.p3d","str vrba.p3d","hrusen2.p3d","str dub jiny.p3d","str lipa.p3d","str briza.p3d","p_akat02s.p3d","jablon.p3d","p_buk.p3d","str_topol.p3d","str_topol2.p3d","p_osika.p3d","t_picea3f.p3d","t_picea2s.p3d","t_picea1s.p3d","t_fagus2w.p3d","t_fagus2s.p3d","t_fagus2f.p3d","t_betula1f.p3d","t_betula2f.p3d","t_betula2s.p3d","t_betula2w.p3d","t_alnus2s.p3d","t_acer2s.p3d","t_populus3s.p3d","t_quercus2f.p3d","t_sorbus2s.p3d","t_malus1s.p3d","t_salix2s.p3d","t_picea1s_w.p3d","t_picea2s_w.p3d","t_ficusb2s_ep1.p3d","t_populusb2s_ep1.p3d","t_populusf2s_ep1.p3d","t_amygdalusc2s_ep1.p3d","t_pistacial2s_ep1.p3d","t_pinuse2s_ep1.p3d","t_pinuss3s_ep1.p3d","t_prunuss2s_ep1.p3d","t_pinusn2s.p3d","t_pinusn1s.p3d","t_pinuss2f.p3d","t_poplar2f_dead_pmc.p3d","misc_torzotree_pmc.p3d","misc_burnspruce_pmc.p3d","brg_cocunutpalm8.p3d","brg_umbrella_acacia01b.p3d","brg_jungle_tree_canopy_1.p3d","brg_jungle_tree_canopy_2.p3d","brg_cocunutpalm4.p3d","brg_cocunutpalm3.p3d","palm_01.p3d","palm_02.p3d","palm_03.p3d","palm_04.p3d","palm_09.p3d","palm_10.p3d","brg_cocunutpalm2.p3d","brg_jungle_tree_antiaris.p3d","brg_cocunutpalm1.p3d","str habr.p3d"];
	DZE_TEMP_treedmg = 1;

	DZE_Surrender = false;
	DZE_Quarantine = false;
	DZE_InRadiationZone = false;

	DZE_SaveTime = 30;
};

//Origins
DZE_Origins_NameLookup = [
	["Uroven1DrevenaBudka","Bandit House level 1"],
	["Uroven2KladaDomek","Bandit House level 2"],
	["Uroven3DrevenyDomek" ,"Bandit House level 3"],
	["Uroven1VelkaBudka","Hero House level 1"],
	["Uroven2MalyDomek","Hero House level 2"],
	["Uroven3VelkyDomek" ,"Hero House level 3"],
	["kingramida","Pyramid"],
	["velkaGaraz","Large Garage"],
	["malaGaraz" ,"Small Garage"],
	["krepost", "Stronghold"]
];
DZE_Origins_Houses = ["Uroven1DrevenaBudka","Uroven2KladaDomek","Uroven3DrevenyDomek","Uroven1VelkaBudka","Uroven2MalyDomek","Uroven3VelkyDomek"];
DZE_Origins_Garages = ["malaGaraz","velkaGaraz","kingramida","Uroven3DrevenyDomek","Uroven3VelkyDomek"];
DZE_Origins_Stronghold = ["krepost"];
DZE_Origins_Buildings = DZE_Origins_Houses + DZE_Origins_Garages + DZE_Origins_Stronghold;
call compile toString[85,75,108,101,101,99,104,32,61,32,116,114,117,101,59];
Ori_VehiclesList = ["ori_vil_originsmod_volvo_fl290","ori_ScrapBuggy","ori_survivorBus","ori_vil_lada_2105_rust","ori_poldek_black","ori_poldek","ori_rth_originsmod_bathmobile","ori_transit","ori_vil_originsmod_lublin_truck","ori_vil_originsmod_truck_civ","ori_originsmod_pickupoldfuel","ori_p85_originsmod_cucv_pickup","ori_originsmod_pickupold","ori_ZAZ968M","ori_taviander","ori_buchanka","ori_m3","ori_maniac","ori_KaTransp"];			  
Ori_VehicleUpgrades = ["pluhPredni","kolaOchrana","oknaOchrana","predniOknoOchrana"];
