//by bexs - bexs epoch napf pack
//insel


if (isServer) then {

/*
// hangar
_vehicle_389 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [16432.326, 18457.344], [], 0, "CAN_COLLIDE"];
  _vehicle_389 = _this;
  
         //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
      _this addWeaponCargoGlobal ["AA12_PMC",2];
  _this addWeaponCargoGlobal ["DMR_DZ",2];
  _this addWeaponCargoGlobal ["SCAR_H_STD_EGLM_Spect",2];
  _this addWeaponCargoGlobal ["KSVK_DZE",2];
  _this addWeaponCargoGlobal ["SCAR_L_STD_EGLM_RCO",2];
  _this addWeaponCargoGlobal ["FN_FAL_ANPVS4",2];
  _this addWeaponCargoGlobal ["UZI_SD_EP1",2];
  _this addWeaponCargoGlobal ["SCAR_L_CQC_EGLM_Holo",2];
  _this addWeaponCargoGlobal ["BAF_LRR_scoped",2];
  _this addWeaponCargoGlobal ["BAF_L85A2_RIS_Holo",2];
    _this addWeaponCargoGlobal ["BAF_LRR_scoped_W",2];
  
   _this addmagazineCargoGlobal ["20Rnd_B_AA12_Pellets",20];
  _this addmagazineCargoGlobal ["20Rnd_762x51_DMR",20];
  _this addmagazineCargoGlobal ["1Rnd_HE_M203",10];
  _this addmagazineCargoGlobal ["5Rnd_127x108_KSVK",10];
  _this addmagazineCargoGlobal ["30Rnd_556x45_Stanag",10];
  _this addmagazineCargoGlobal ["20Rnd_762x51_FNFAL",10];
  _this addmagazineCargoGlobal ["30Rnd_9x19_UZI_SD",30];
  _this addmagazineCargoGlobal ["5Rnd_86x70_L115A1",20];
  
  _this setVariable ["permaLoot",true];
  
  
  
  _this setPos [16432.326, 18457.344];
};


//brunnen
_vehicle_391 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [16583.447, 18175.121], [], 0, "CAN_COLLIDE"];
  _vehicle_391 = _this;
  
  
    //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  
   _this addmagazineCargoGlobal ["ItemHeatPack",15];
  _this addmagazineCargoGlobal ["ItemBandage",30];
  _this addmagazineCargoGlobal ["ItemPainkiller",30];
  _this addmagazineCargoGlobal ["ItemMorphine",10];
  _this addmagazineCargoGlobal ["ItemBloodBag",10];
  _this addmagazineCargoGlobal ["ItemEpinephrine",15];
  _this addmagazineCargoGlobal ["ItemAntibiotic",10];

    _this setVariable ["permaLoot",true];
  
  _this setPos [16583.447, 18175.121];
};


//schrottplatz
_vehicle_393 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [16658.953, 18443.361, -4.3869019e-005], [], 0, "CAN_COLLIDE"];
  _vehicle_393 = _this;
  
     //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  
  //Add Cargo
  _this addmagazineCargoGlobal ["ItemSandbag",10];
  _this addmagazineCargoGlobal ["ItemTankTrap",10];
  _this addmagazineCargoGlobal ["ItemWire",10];
  _this addmagazineCargoGlobal ["PartGeneric",10];
   _this addmagazineCargoGlobal ["MortarBucket",5];
  _this addmagazineCargoGlobal ["CinderBlocks",20];
  _this addmagazineCargoGlobal ["PartWoodPlywood",10];
  _this addmagazineCargoGlobal ["ItemDocument",10];
  
    _this setVariable ["permaLoot",true];
  
  _this setPos [16658.953, 18443.361, -4.3869019e-005];
};


// satelliten
_vehicle_395 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [16100.134, 18759.68, 0.12001707], [], 0, "CAN_COLLIDE"];
  _vehicle_395 = _this;
  
          //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["Binocular_Vector",1];
  _this addWeaponCargoGlobal ["ItemGPS",1];
  _this addWeaponCargoGlobal ["ItemRadio",2];
  _this addmagazineCargoGlobal ["HandGrenade_West",10];
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this setVariable ["permaLoot",true];
  
  
  _this setPos [16100.134, 18759.68, 0.12001707];
};
*/

// IKEA 1

_vehicle_396 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [3047.7031, 7388.605, 7.4675136], [], 0, "CAN_COLLIDE"];
  _vehicle_396 = _this;
  
          //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo  
  _this addMagazineCargoGlobal ["ItemWoodWallGarageDoor", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallGarageDoorLocked", 5];
  _this addMagazineCargoGlobal ["ItemWoodFloorHalf", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallDoorLg", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWithDoorLg", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWithDoorLgLocked", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallLg", 5];
  _this addMagazineCargoGlobal ["ItemWoodWall", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWindowLg", 5];
  _this addMagazineCargoGlobal ["ItemWoodFloorQuarter", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallDoor", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWithDoorLocked", 5];
  _this addMagazineCargoGlobal ["storage_shed_kit", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWithDoor", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallWindow", 5];
  _this addMagazineCargoGlobal ["ItemWoodWallThird", 5];
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this addMagazineCargoGlobal ["ItemSodaDrwaste", 10];
  _this setVariable ["permaLoot",true];
  _this setPos [3047.7031, 7388.605, 7.4675136];
};


// IKEA 2
_vehicle_397 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [3352.8755, 7441.5532, 7.4606071], [], 0, "CAN_COLLIDE"];
  _vehicle_397 = _this;
  
          //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addMagazineCargoGlobal ["ItemWoodLadder", 5];
  _this addMagazineCargoGlobal ["ItemWoodFloor", 5];
  _this addMagazineCargoGlobal ["ItemWoodStairs", 5];
  _this addMagazineCargoGlobal ["ItemWoodStairsSupport", 5];
  _this addMagazineCargoGlobal ["cinder_wall_kit", 5];
  _this addMagazineCargoGlobal ["cinder_garage_kit", 5];;
  _this addMagazineCargoGlobal ["metal_floor_kit", 5];
  _this addMagazineCargoGlobal ["ItemCorrugated", 5];
  _this addMagazineCargoGlobal ["ItemSandbag", 5];
  _this addMagazineCargoGlobal ["ItemSandbagLarge", 5];
  _this addMagazineCargoGlobal ["wooden_shed_kit", 5];
  _this addMagazineCargoGlobal ["wood_shack_kit", 5];
  _this addMagazineCargoGlobal ["light_pole_kit", 5];
  _this addMagazineCargoGlobal ["desert_net_kit", 5];
  _this addMagazineCargoGlobal ["deer_stand_kit", 5];
  _this addMagazineCargoGlobal ["metal_panel_kit", 5]; 
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this addMagazineCargoGlobal ["ItemSodaDrwaste", 10];
  _this setVariable ["permaLoot",true];
  
  
  _this setPos [3352.8755, 7441.5532, 7.4606071];
};


// Bandit Outpost
_vehicle_398 = objNull;
if (true) then
{
  _this = createVehicle ["GERBasicWeapons_EP1", [5607.0659, 2362.8831, 0], [], 0, "CAN_COLLIDE"];
  _vehicle_398 = _this;
  
          //Clear Cargo	
  clearweaponcargoGlobal _this;
  clearmagazinecargoGlobal _this;
  //Add Cargo
  _this addMagazineCargoGlobal ["ItemWoodLadder", 5];
  _this addMagazineCargoGlobal ["ItemWoodFloor", 5];
  _this addMagazineCargoGlobal ["ItemWoodStairs", 5];
  _this addMagazineCargoGlobal ["ItemWoodStairsSupport", 5];
  _this addMagazineCargoGlobal ["cinder_wall_kit", 5];
  _this addMagazineCargoGlobal ["cinder_garage_kit", 5];;
  _this addMagazineCargoGlobal ["metal_floor_kit", 5];
  _this addMagazineCargoGlobal ["ItemCorrugated", 5];
  _this addMagazineCargoGlobal ["ItemSandbag", 5];
  _this addMagazineCargoGlobal ["ItemSandbagLarge", 5];
  _this addMagazineCargoGlobal ["wooden_shed_kit", 5];
  _this addMagazineCargoGlobal ["wood_shack_kit", 5];
  _this addMagazineCargoGlobal ["light_pole_kit", 5];
  _this addMagazineCargoGlobal ["desert_net_kit", 5];
  _this addMagazineCargoGlobal ["deer_stand_kit", 5];
  _this addMagazineCargoGlobal ["metal_panel_kit", 5]; 
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this addMagazineCargoGlobal ["ItemSodaDrwaste", 10];
  _this addWeaponCargoGlobal ["NVGoggles",1];
  _this addWeaponCargoGlobal ["Binocular_Vector",1];
  _this addWeaponCargoGlobal ["ItemGPS",1];
  _this addWeaponCargoGlobal ["ItemRadio",2];
  _this addmagazineCargoGlobal ["HandGrenade_West",10];
  _this addbackpackCargoGlobal ["DZ_Backpack_EP1",1];
  _this addmagazineCargoGlobal ["ItemSandbag",10];
  _this addmagazineCargoGlobal ["ItemTankTrap",10];
  _this addmagazineCargoGlobal ["ItemWire",10];
  _this addmagazineCargoGlobal ["PartGeneric",10];
   _this addmagazineCargoGlobal ["MortarBucket",5];
  _this addmagazineCargoGlobal ["CinderBlocks",20];
  _this addmagazineCargoGlobal ["PartWoodPlywood",10];
  _this addmagazineCargoGlobal ["ItemDocument",10];
  _this setVariable ["permaLoot",true];
  

  _this setPos [5607.0659, 2362.8831, 0];
};








};