/*
	File: AH.sqf
	Author: Chris(tian) "infiSTAR" Lorenzen
	Contact: infiSTAR23@gmail.com
	
	Description:
	Arma AntiHack & AdminTools - infiSTAR.de
*/
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ********************************22-09-2015-v1426A********************************* */
/* ********************************************************************************* */
comment 'Antihack & AdminTools - Christian Lorenzen - www.infiSTAR.de - License: (CC)';
private['_dstring','_cconfig','_OpenMenuKey','_LAdmins','_NAdmins','_SAdmins','_BLOCKED','_TopOfESC','_LowerTop','_LowerBottom','_EscColor',
'_BottomDebug','_UPW','_ODK','_DMS','_DMW','_MEH','_VON','_BHF','_UVC','_UZC','_UVW','_VTC','_UIC','_UCL','_UIM','_UCC','_UFS',
'_UAT','_UCS','_UDC','_RAI','_CHB','_MCC','_CUD','_RCK','_CCM','_BCM','_CSA','_FTG','_ALLOWED_Dialogs','_ForbiddenItems','_ALLOWED_Vehicles',
'_FORBIDDEN_Vehicles','_cMenu','_dayzActions','_UDP','_URG','_UDN'];
#include "AHconfig.sqf"
if(!isNil "infiSTAR_LoadStatus1")exitWith {diag_log ("infiSTAR.de - infiSTAR_LoadStatus1: infiSTAR is already loaded!");};
infiSTAR_LoadStatus1 = true;
diag_log ("infiSTAR.de - Waiting for BIS_fnc_init...");
waitUntil {uiSleep 0.1;!isNil "BIS_fnc_init"};
if(!isNil "infiSTAR_LoadStatus2")exitWith {diag_log ("infiSTAR.de - infiSTAR_LoadStatus2: infiSTAR is already loaded!");};
infiSTAR_LoadStatus2 = true;
diag_log ("infiSTAR.de - BIS_fnc_init done - AntiHack STARTING...!");
_dstring = 'by infiSTAR.de';_cconfig = false;
if(isNil '_OpenMenuKey')then{_OpenMenuKey = 0x3C;_cconfig=true;};
if(isNil '_LAdmins')then{_LAdmins = [];_cconfig=true;};
if(isNil '_NAdmins')then{_NAdmins = [];_cconfig=true;};
if(isNil '_SAdmins')then{_SAdmins = [];_cconfig=true;};
if(isNil '_BLOCKED')then{_BLOCKED = [];_cconfig=true;};
if(isNil '_TopOfESC')then{_TopOfESC = _dstring;_cconfig=true;};
if(isNil '_LowerTop')then{_LowerTop = _dstring;_cconfig=true;};
if(isNil '_LowerBottom')then{_LowerBottom = _dstring;_cconfig=true;};
if(isNil '_EscColor')then{_EscColor = [0.6,0,0,1];_cconfig=true;};
if(isNil '_BottomDebug')then{_BottomDebug = _dstring;_cconfig=true;};
if(isNil '_UPW')then{_UPW = false;_cconfig=true;};
if(isNil '_ODK')then{_ODK = 0xCF;_cconfig=true;};
if(isNil '_DMS')then{_DMS = true;_cconfig=true;};
if(isNil '_DMW')then{_DMW = false;_cconfig=true;};
if(isNil '_MEH')then{_MEH = true;_cconfig=true;};
if(isNil '_VON')then{_VON = true;_cconfig=true;};
if(isNil '_BHF')then{_BHF = false;_cconfig=true;};
if(isNil '_UVC')then{_UVC = false;_cconfig=true;};
if(isNil '_UZC')then{_UZC = false;_cconfig=true;};
if(isNil '_UVW')then{_UVW = false;_cconfig=true;};
if(isNil '_VTC')then{_VTC = true;_cconfig=true;};
if(isNil '_UDP')then{_UDP = true;_cconfig=true;};
if(isNil '_URG')then{_URG = true;_cconfig=true;};
if(isNil '_UIC')then{_UIC = true;_cconfig=true;};
if(isNil '_UCL')then{_UCL = true;_cconfig=true;};
if(isNil '_UIM')then{_UIM = true;_cconfig=true;};
if(isNil '_UCC')then{_UCC = true;_cconfig=true;};
if(isNil '_UFS')then{_UFS = true;_cconfig=true;};
if(isNil '_UAT')then{_UAT = true;_cconfig=true;};
if(isNil '_UCS')then{_UCS = true;_cconfig=true;};
if(isNil '_UDC')then{_UDC = true;_cconfig=true;};
if(isNil '_RAI')then{_RAI = true;_cconfig=true;};
if(isNil '_CHB')then{_CHB = true;_cconfig=true;};
if(isNil '_MCC')then{_MCC = 650;_cconfig=true;};
if(isNil '_CUD')then{_CUD = true;_cconfig=true;};
if(isNil '_RCK')then{_RCK = true;_cconfig=true;};
if(isNil '_CCM')then{_CCM = false;_cconfig=true;};
if(isNil '_BCM')then{_BCM = false;_cconfig=true;};
if(isNil '_CSA')then{_CSA = false;_cconfig=true;};
if(isNil '_FTG')then{_FTG = 25;_cconfig=true;};
if(isNil '_UDN')then{_UDN = true;_cconfig=true;};
if(isNil '_ALLOWED_Dialogs')then{_ALLOWED_Dialogs = [-1,106,6900,6901,6902,6903,420420,41144];_cconfig=true;};
if(isNil '_ForbiddenItems')then{_ForbiddenItems = [''];_cconfig=true;};
if(isNil '_ALLOWED_Vehicles')then{_ALLOWED_Vehicles = [''];_cconfig=true;};
if(isNil '_FORBIDDEN_Vehicles')then{_FORBIDDEN_Vehicles = [''];_cconfig=true;};
if(isNil '_cMenu')then{_cMenu = [''];_cconfig=true;};
if(isNil '_dayzActions')then{_dayzActions = [];_cconfig=true;};
if(_cconfig)then{diag_log ("infiSTAR.de - Your AHconfig.sqf is missing Variables!");};
_PV_DevUlDs = ['0'];comment 'Those IDs (player) are hidden in the Admin-Log and Playerlist of the AdminMenu but have SuperAdmin access';
PV_ADMIN_DONT_LOG = ['0'];comment 'Those IDs (player) are hidden in the Admin-Log';


_BlackList =
[
	'',' ','0','NameIsTooShort',
	'infiSTAR','infiSTAR.de',' infiSTAR.de','  infiSTAR.de','infiSTAR.de ','infiSTAR.de  ','  infiSTAR.de  ',' infiSTAR.de ',
	'RussianGat','Dami','DamiCC','Russypoo','Alphadom','Radiix','Kill Me Baby','Miguel Self','George Smith','Arran',
	'Ewan Jones','QuickShotzKeyz','xCyberxx','HeroZero','EJRProdigy','Kermit','Zemaa','aFriendlyBandit','Altair','CMDie',
	'76561197984690630','76561197978913290','76561197979392398','76561198002094787','76561198148907901','76561198062276128',
	'76561198032309705','76561198137073763'
];
_BadSkins =
[
	'Survivor1_DZ','GoInvisible','InvisibleManW_EP1'
];
_watched =
[
	'PipeBomb','NVGoggles','Binocular_Vector','Binocular','Skin_Camo1_DZ','Skin_Sniper1_DZ',
	'ItemMap','ItemGPS','PartWoodPile','glock17_EP1','revolver_EP1','revolver_gold_EP1',
	'30Rnd_556x45_G36','30Rnd_556x45_Stanag','Sa61_EP1','UZI_EP1','UZI_SD_EP1','Colt1911','M9','M9SD',
	'Makarov','MakarovSD','ItemMatchbox','ItemEtool','ItemAntibiotic','ItemBandage','ItemBloodbag',
	'ItemEpinephrine','ItemHeatPack','ItemMorphine','ItemPainkiller','ItemWire',
	'ItemKeyKit','Sa58V_RCO_EP1','AK_107_pso','AK_107_GL_pso','SVD_CAMO','SVD','30Rnd_762x39_AK47',
	'30Rnd_545x39_AKSD','DMR','DMR_DZ','30Rnd_556x45_StanagSD','20Rnd_556x45_Stanag','30Rnd_556x45_G36SD',
	'10Rnd_762x54_SVD','ChainSaw','ChainSawB','ChainSawG','ChainSawP','ChainSawR','AKS_GOLD','Pecheneg_DZ',
	'AK_74','AKS_74_kobra','AKS_74_pso','bizon_silenced','G36_C_SD_eotech','G36a','M4A1_Aim_camo','M4A1_HWS_GL',
	'M4A1_RCO_GL','M4A1','Mk_48_DZ','M8_carbineGL','M8_compact','M16A2GL','M16A4','M16A4_ACG','M8_sharpshooter',
	'M24','ItemSodaCoke','17Rnd_9x19_glock17','ItemCompass','30Rnd_9x19_UZI_SD','M8_carbine',
	'FoodCanBakedBeans','FoodCanFrankBeans','ItemSodaPepsi','ItemSodaMdew',
	'BAF_AS50_scoped','BAF_AS50_TWS','PMC_AS50_scoped','PMC_AS50_TWS',
	'BAF_AS50_scoped_Large','BAF_AS50_TWS_Large','PMC_AS50_scoped_Large','PMC_AS50_TWS_Large',
	'SCAR_L_STD_EGLM_TWS','M110_TWS_EP1','ItemCore','M136','Javelin','Stinger',
	'RPG7V','Strela','Igla','RPG18','MetisLauncher','SMAW','BAF_NLAW_Launcher'
];



if(!isNil '_sUptime')then
{
	if(typeName _sUptime != 'SCALAR')then
	{
		_sUptime = parseNumber _sUptime;
	};
	if(typeName _sUptime == 'SCALAR')then
	{
		if(_sUptime > 0)then
		{
			infiSTAR_UPTIMER = _sUptime;
			publicVariable 'infiSTAR_UPTIMER';
		};
	};
};
if((preProcessFileLineNumbers ("low_admins.sqf")) != "")then{
	_tmpLA = call compile preProcessFileLineNumbers "low_admins.sqf";
	if(!isNil '_tmpLA')then
	{
		if(typeName _tmpLA == 'ARRAY')then
		{
			if(str _tmpLA != '[]')then
			{
				_LAdmins = _LAdmins + _tmpLA;
			};
		};
	};
};
if((preProcessFileLineNumbers ("normal_admins.sqf")) != "")then{
	_tmpNA = call compile preProcessFileLineNumbers "normal_admins.sqf";
	if(!isNil '_tmpNA')then
	{
		if(typeName _tmpNA == 'ARRAY')then
		{
			if(str _tmpNA != '[]')then
			{
				_NAdmins = _NAdmins + _tmpNA;
			};
		};
	};
};
if((preProcessFileLineNumbers ("super_admins.sqf")) != "")then{
	_tmpSA = call compile preProcessFileLineNumbers "super_admins.sqf";
	if(!isNil '_tmpSA')then
	{
		if(typeName _tmpSA == 'ARRAY')then
		{
			if(str _tmpSA != '[]')then
			{
				_SAdmins = _SAdmins + _tmpSA;
			};
		};
	};
};
if((preProcessFileLineNumbers ("blacklist.sqf")) != "")then{
	_tmpBL = call compile preProcessFileLineNumbers "blacklist.sqf";
	if(!isNil '_tmpBL')then
	{
		if(typeName _tmpBL == 'ARRAY')then
		{
			if(str _tmpBL != '[]')then
			{
				_BLOCKED = _BLOCKED + _tmpBL;
			};
		};
	};
};
iproductVersion = '22-09-2015-v1426A';
diag_log format['infiSTAR.de - iproductVersion: %1 | Server productVersion: %2 | worldName: %3 | dayz_instance: %4 | missionName: %5',iproductVersion,productVersion,worldName,dayz_instance,missionName];
_version = productVersion select 3;
if(_version < 103718)then
{
	diag_log format['infiSTAR.de - Server Arma2OA beta is outdated! (%1)',_version];
};
_CUF_REMOVE_THESE_ITEMS_ON_DEATH_TMP = _CUF_REMOVE_THESE_ITEMS_ON_DEATH;
_CUF_REMOVE_THESE_ITEMS_ON_DEATH = [];
{
	_CUF_REMOVE_THESE_ITEMS_ON_DEATH = _CUF_REMOVE_THESE_ITEMS_ON_DEATH + [toLower _x];
} forEach _CUF_REMOVE_THESE_ITEMS_ON_DEATH_TMP;
_fnc_RandomGen =
{
	_abc = ['z','y','x','w','v','u','t','s','r','q','p','o','n','m','l','k','j','i','h','g','f','e','d','c','b','a'];
	_gen = _abc select (random ((count _abc)-1));
	_arr = ['O','d','2','g','z','6','l','w','I','O','j','J','R','w','i','Z','k','Z','c','R','T','3','r','a','M','P','H','V','r','o'];
	for '_i' from 0 to (8+(round(random 3))) do {_gen = _gen + str(round(random 9)) + (_arr select (random ((count _arr)-1)));};
	_gen
};diag_log format['infiSTAR.de - _fnc_RandomGen: %1',_fnc_RandomGen];
_simple = call _fnc_RandomGen;diag_log format['infiSTAR.de - _simple: %1',_simple];
_simplee = call _fnc_RandomGen;diag_log format['infiSTAR.de - _simplee: %1',_simplee];
_dialogIds = call _fnc_RandomGen;diag_log format['infiSTAR.de - _dialogIds: %1',_dialogIds];
_badtxts = call _fnc_RandomGen;diag_log format['infiSTAR.de - _badtxts: %1',_badtxts];
_randvar1 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar1: %1',_randvar1];
_randvar2 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar2: %1',_randvar2];
_randvar0 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar0: %1',_randvar0];
_randvar3 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar3: %1',_randvar3];
_randvar4 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar4: %1',_randvar4];
_randvar5 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar5: %1',_randvar5];
_randvar6 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar6: %1',_randvar6];
_randvar8 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar8: %1',_randvar8];
_randvar11 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar11: %1',_randvar11];
_randvar12 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar12: %1',_randvar12];
_randvar13 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar13: %1',_randvar13];
_randvar19 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar19: %1',_randvar19];
_randvar20 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar20: %1',_randvar20];
_randvar21 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar21: %1',_randvar21];
_randvar27 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar27: %1',_randvar27];
_randvar26 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar26: %1',_randvar26];
_randvar25 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar25: %1',_randvar25];
_randvar28 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar28: %1',_randvar28];
_randvar29 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar29: %1',_randvar29];
_randvar30 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar30: %1',_randvar30];
_randvar31 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar31: %1',_randvar31];
_randvar32 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar32: %1',_randvar32];
_randvar33 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar33: %1',_randvar33];
_randvar34 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar34: %1',_randvar34];
_randvar35 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar35: %1',_randvar35];
_randvar36 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar36: %1',_randvar36];
_randvar242737 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar242737: %1',_randvar242737];
_randvar38 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar38: %1',_randvar38];
_randvar39 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar39: %1',_randvar39];
_randvar40 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar40: %1',_randvar40];
_randvar41 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _randvar41: %1',_randvar41];
_clickOnMapTimer = call _fnc_RandomGen;diag_log format['infiSTAR.de - _clickOnMapTimer: %1',_clickOnMapTimer];
_clickOnMapCaught = call _fnc_RandomGen;diag_log format['infiSTAR.de - _clickOnMapCaught: %1',_clickOnMapCaught];
_t1 = call _fnc_RandomGen;diag_log format['infiSTAR.de _t1: %1',_t1];
_t2 = call _fnc_RandomGen;diag_log format['infiSTAR.de _t2: %1',_t2];
_t3 = call _fnc_RandomGen;diag_log format['infiSTAR.de _t3: %1',_t3];
_t4 = call _fnc_RandomGen;diag_log format['infiSTAR.de _t4: %1',_t4];
_fnc_handlerandvar10 = call _fnc_RandomGen;diag_log format['infiSTAR.de - _fnc_handlerandvar10: %1',_fnc_handlerandvar10];
_remark = call _fnc_RandomGen;diag_log format['infiSTAR.de - _remark: %1',_remark];
_AHpos = call _fnc_RandomGen;diag_log format['infiSTAR.de - _AHpos: %1',_AHpos];
_loadedcheckpos = call _fnc_RandomGen;diag_log format['infiSTAR.de - _loadedcheckpos: %1',_loadedcheckpos];
_loadedchecktime = call _fnc_RandomGen;diag_log format['infiSTAR.de - _loadedchecktime: %1',_loadedchecktime];
_MenuChecksRunningx = call _fnc_RandomGen;diag_log format['infiSTAR.de - _MenuChecksRunningx: %1',_MenuChecksRunningx];
_oneachframe = call _fnc_RandomGen;diag_log format['infiSTAR.de - _oneachframe: %1',_oneachframe];
_anotherloop = call _fnc_RandomGen;diag_log format['infiSTAR.de - _anotherloop: %1',_anotherloop];
_clientoncetwo = call _fnc_RandomGen;diag_log format['infiSTAR.de - _clientoncetwo: %1',_clientoncetwo];
_lastUnlock = call _fnc_RandomGen;diag_log format['infiSTAR.de - _lastUnlock: %1',_lastUnlock];
_AdminReqCheck = call _fnc_RandomGen;diag_log format['infiSTAR.de - _AdminReqCheck: %1',_AdminReqCheck];
_antidupeCheckVar = call _fnc_RandomGen;diag_log format['infiSTAR.de - _antidupeCheckVar: %1',_antidupeCheckVar];
_antidupePVCheckVar = 'PVAHR_0_' + (call _fnc_RandomGen);diag_log format['infiSTAR.de - _antidupePVCheckVar: %1',_antidupePVCheckVar];
_antidupePVResVar = 'PVAHR_0_' + (call _fnc_RandomGen);diag_log format['infiSTAR.de - _antidupePVResVar: %1',_antidupePVResVar];
_antidupePVEH = format['_a=0;''%1'' addPublicVariableEventHandler { %2 = true; (owner (_this select 1)) publicVariableClient ''%2''; };', _antidupePVCheckVar, _antidupePVResVar];
call compile _antidupePVEH;
_randvar242710 = 'PVAHR_0_' + (call _fnc_RandomGen);diag_log format['infiSTAR.de - _randvar242710: %1',_randvar242710];
BattleFieldClearance = 'no';publicVariable 'BattleFieldClearance';
loadFile = 'no';publicVariable 'loadFile';
rcallVarcode = 'no';publicVariable 'rcallVarcode';
addTeamMember = 'no';publicVariable 'addTeamMember';
removeTeamMember = 'no';publicVariable 'removeTeamMember';
saveStatus = 'no';publicVariable 'saveStatus';
loadStatus = 'no';publicVariable 'loadStatus';
saveVar = 'no';publicVariable 'saveVar';
createTeam = 'no';publicVariable 'createTeam';
/*
BIS_MPF_logic = 'no';publicVariable 'BIS_MPF_logic';
BIS_MPF_dummygroup = 'no';publicVariable 'BIS_MPF_dummygroup';
sideLogic = 'no';publicVariable 'sideLogic';
*/
_SupportVault1Content = [_weapons1,_magazines1,_backpack1];
_SupportVault2Content = [_weapons2,_magazines2,_backpack2];
_SupportVault3Content = [_weapons3,_magazines3,_backpack3];
call compile ("
	fnc_getSupportVaultContent = {
		if(_this==1)exitWith{"+str _SupportVault1Content+"};
		if(_this==2)exitWith{"+str _SupportVault2Content+"};
		if(_this==3)exitWith{"+str _SupportVault3Content+"};
		nil
	};
	fnc_getSupportBoxContent = {
		if(_this==1)exitWith{"+str _SupportBox1Content+"};
		if(_this==2)exitWith{"+str _SupportBox2Content+"};
		if(_this==3)exitWith{"+str _SupportBox3Content+"};
		nil
	};
");
_mPos = getMarkerPos 'respawn_west';
_PV_DevUlDs = _PV_DevUlDs + ['76561198145620376','76561198152111329'];comment 'DEV ID';PV_DevUlDs = _PV_DevUlDs;_SAdmins= _PV_DevUlDs + _SAdmins;
_CE0 = toArray (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
_CE1 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
_CE2 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
_CE3 = toArray (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));
_CE4 = toArray (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'OnButtonClick'));
_CE5 = toArray (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'action'));
_CE6 = toArray(getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'OnButtonClick'));
_CE7 = toArray(getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'action'));
_CEA1 = [_CE0,_CE1,_CE2,_CE3,_CE4,_CE5,_CE6,_CE7];
if(isNil 'PV_hackerL0og')then{PV_hackerL0og = [[]];};if(isNil 'PV_SurveillanceLog')then{PV_SurveillanceLog = [[]];};
DAYZ_INSTANCE_LOGGING = format['   |Instance: %1 - %2%3%4 - %5',dayZ_instance,productVersion select 1,productVersion select 2,productVersion select 3,iproductVersion];
_allAdmins = _LAdmins + _NAdmins + _SAdmins;
_BIS_MPF_RES = {
	private ['_tmpRES','_array','_input','_perFnc','_perInput','_this'];
	_tmpRES = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
	if(typeName _this == 'ARRAY')then
	{
		if(count _this >= 2)then
		{
			_array = _this select 1;
			if(isNil '_array')exitWith {};
			if(count _array >= 3)then
			{
				_input = _array select 2;
				if(isNil '_input')exitWith {};
				if(_input in ['switchmove','playmove','say','jipexec','execVM','spawn','titleText','hint','globalChat','setObjectTexture'])then
				{
					_this call _tmpRES;
				}
				else
				{
					if(_input in ['loc','locper','perloc','per'])then
					{
						if(count _array >= 4)then
						{
							_perFnc = _array select 3;
							if(isNil '_perFnc')exitWith {};
							if(_perFnc == 'hideObject')exitWith {
								_obj = _array select 1;
								if(isNil '_obj')exitWith {};
								if(!isNull _obj)then
								{
									if !(isPlayer _obj)then
									{
										_this call _tmpRES;
									};
								};
							};
							if(_perFnc == 'titleText')exitWith {_this call _tmpRES;};
							if(count _array >= 5)then
							{
								_perInput = _array select 4;
								if(isNil '_perInput')exitWith {};
								if((_perFnc == 'JIPexec') && (typeName _perInput == 'ARRAY'))then{if(_perInput select 3 == 'execVM')then{_this call _tmpRES;};};
							};
						};
					};
				};
			};
		};
	};
};
_AHstring = "
if("+str _CUF+")then
{
	[] spawn {
		{
			if(typeOf _x == 'FunctionsManager')then
			{
				[_x] spawn {
					_fnmanager = _this select 0;
					waitUntil {isNull _fnmanager || isNull group _fnmanager || count units group _fnmanager > 1};
					_log = format['FunctionsManager Hacked! %1 %2',_fnmanager,group _fnmanager];
					['SERVER',['SERVER','-','HLOG',toArray (_log)]] call "+_fnc_handlerandvar10+";
					
					_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];
					_tmpu setVehicleInit 'findDisplay 46 closeDisplay 0';
					processInitCommands;
					clearVehicleInit _tmpu;
					deleteVehicle _tmpu;
				};
			}
			else
			{
				deleteVehicle _x;
			};
		} forEach (entities 'Logic');
		private['_cnt','_plr','_oid','_handleradded','_grps','_units','_localDetected','_obj','_grp','_oldgrp','_addhandlercode'];
		_addhandlercode = 'if(!isServer)then
		{
			"+_randvar40+"=nil;
			''"+_randvar40+"'' addPublicVariableEventHandler
			{
				"+_randvar40+" = nil;
				private[''_array'',''_units'',''_side'',''_grp''];
				_array = _this select 1;
				_units = _array select 0;
				_side = _array select 1;
				_grp = createGroup _side;
				{
					[_x] joinSilent _grp;
					if((getPlayerUID _x == '''')&&(_x isKindOf ''Man''))then
					{
						_x removeAllEventHandlers ''Fired'';
						_x addEventHandler [''Fired'', {
							(_this select 0) setVehicleAmmo 1;
							(_this select 0) setWeaponReloadingTime [(_this select 0),currentWeapon (_this select 0),0];
							(_this select 0) setUnitRecoilCoefficient 0;
						}];
						_x removeAllEventHandlers ''Killed'';
						_x addEventHandler [''Killed'', {
							private[''_unit'',''_killer'',''_humanity''];
							_unit = _this select 0;
							_killer = _this select 1;
							_unit removeWeapon ''Stinger'';
							_unit removeWeapon ''NVGoggles'';
							if("+str _CUF_REMOVE_ALL_ITEMS_ON_DEATH+")then
							{
								{_unit removeMagazine _x;} forEach (magazines _unit);
								{_unit removeWeapon _x;} forEach (weapons _unit);
							}
							else
							{
								_toRemove = "+str _CUF_REMOVE_THESE_ITEMS_ON_DEATH+";
								if(str _toRemove != ''[]'')then
								{
									[_unit,_current] spawn {(_this select 0) removeMagazines (_this select 1);};
									[_unit,_current] spawn {(_this select 0) removeWeapon (_this select 1);};
								};
							};
							if(!isNull _killer)then{
								_humanity = _killer getVariable[''humanity'',0];
								_humanity = _humanity + "+str _CUF_HUMANITY_REWARD+";
								_killer setVariable[''humanity'',_humanity,true];
							};
						}];
					};
				} forEach _units;
			};
		};';
		_obj = 'Rabbit' createVehicle [0,0,0];
		_obj setVehicleInit _addhandlercode;
		processInitCommands;
		while{true}do
		{
			_cnt = count playableUnits;
			if(_cnt > 0)then
			{
				_handleradded = false;
				{
					_units = units _x;
					_localDetected = false;
					{if((local _x)&&!(_x isKindOf 'LOGIC'))exitWith {_localDetected = true;};} forEach _units;
					if(_localDetected)then
					{
						if(!_handleradded)then
						{
							_handleradded = true;
							
							if(!isNull _obj)then
							{
								clearVehicleInit _obj;
								deleteVehicle _obj;
							};
							_obj = 'Rabbit' createVehicle [0,0,0];
							_obj setVehicleInit _addhandlercode;
							processInitCommands;
						};
						
						_unit = _units select 0;
						_side = side _unit;
						_unsorted = playableUnits;
						_sorted = [];
						{
							_closest = _unsorted select 0;
							{if((getPos _x distance _unit) < (getPos _closest distance _unit))then{_closest = _x}} forEach _unsorted;
							_sorted = _sorted + [_closest];
							_unsorted = _unsorted - [_closest]
						} forEach _unsorted;
						_sorted;
						
						_plr = objNull;
						{if(!isNull _x)exitWith {_plr = _x;};} forEach _sorted;
						if(!isNull _plr)then
						{
							"+_randvar40+" = [_units,_side];
							(owner _plr) publicVariableClient '"+_randvar40+"';
						};
					};
				} forEach allGroups;
			};
			uiSleep 3;
		};
	};
};
";
call compile _AHstring;
_AHstring = "
[] spawn {
	_list = [0,0,0] nearEntities 1000000000000000;
	_goodguys = "+str _allAdmins+";
	while{true}do
	{
		_doclients = ""
			_puid = getPlayerUID player;
			if(!isNil '_puid')then
			{
				if(_puid != '')then
				{
					if!(_puid in ""+str _goodguys+"")then
					{
						if(!isNil'"+_simple+"')then{terminate "+_simple+";};
						"+_simple+" = [] spawn {
							disableSerialization;
							if(isNil'"+_dialogIds+"')then{"+_dialogIds+" = [-1,0,8,12,18,24,46,53,55,63,70,106,129,49];};
							if(isNil'"+_badtxts+"')then{"+_badtxts+" = ['Craft Rusty Gate','Armbrust'];};
							_fnc_inString = {
								private ['_needle','_haystack','_needleLen','_hay','_found'];
								_needle = _this select 0;
								if(isNil'_needle')exitWith{};
								if(typeName _needle != 'STRING')exitWith{};
								if(_needle == '')exitWith{};
								_needle = toLower _needle;
								
								_haystack = _this select 1;
								if(isNil'_haystack')exitWith{};
								if(typeName _haystack != 'STRING')exitWith{};
								if(_haystack == '')exitWith{};
								_haystack = toLower _haystack;
								_haystack = toArray _haystack;
								
								
								_needleLen = count toArray _needle;
								_hay = +_haystack;
								_hay resize _needleLen;
								_found = false;
								for '_i' from _needleLen to count _haystack do {
									if(toString _hay == _needle)exitWith {_found = true};
									_hay set [_needleLen, _haystack select _i];
									_hay set [0, 'x'];
									_hay = _hay - ['x']
								};
								_found
							};
							_find = ['hippo','backdoor','rust','whippy'];
							while{true}do
							{
								_uiNamespace_dynamicText = uiNamespace getVariable 'BIS_dynamicText';
								if(!isNil '_uiNamespace_dynamicText')then
								{
									_display = _uiNamespace_dynamicText;
									if(str _display != 'No Display')then
									{
										_ctrl = _display displayCtrl 9999;
										_txt = ctrlText _ctrl;
										if(_txt != '')then
										{
											if!(_txt in "+_badtxts+")then
											{
												"+_badtxts+" = "+_badtxts+" + [_txt];
												{
													_found = [_x,_txt] call _fnc_inString;
													if(_found)then
													{
														_log = format['BadText 1: [%1] found in [%2]   (JUST LOGGING - NO KICK OR BAN)',_x,_txt];
														[name player,getPlayerUID player,'SLOG_EC',toArray(_log)] call "+_randvar242737+";
													};
												} forEach _find;
											};
										};
									};
								};
								if(dialog)then
								{
									call {
										for '_i' from -10 to 10000 do
										{
											_txt = ctrlText _i;
											if(_txt != '')then
											{
												if!(_txt in "+_badtxts+")then
												{
													"+_badtxts+" = "+_badtxts+" + [_txt];
													{
														_found = [_x,_txt] call _fnc_inString;
														if(_found)then
														{
															_log = format['BadText 2: [%1] found in [%2]   (JUST LOGGING - NO KICK OR BAN)',_x,_txt];
															[name player,getPlayerUID player,'SLOG_EC',toArray(_log)] call "+_randvar242737+";
														};
													} forEach _find;
												};
											};
										};
									};
									
									_added = false;
									for '_i' from -10 to 3031 do
									{
										if!(_i in "+_dialogIds+")then
										{
											if(!isNull (findDisplay _i))then
											{
												"+_dialogIds+" = "+_dialogIds+" + [_i];
												if(_i in [17,64,155,156,162,1001,2929,3030,125,69,19,71,45,132,32,165,157,2727,30,9899,0110,110])then
												{
													_log = format['HackMenu with ID %1 found! (by dialog id!)',_i];
													HACK_MENU_FOUND = format['%1(%2) - %3',name player,getPlayerUID player,_log];publicVariableServer 'HACK_MENU_FOUND';
													[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
												};
												_added = true;
											};
										};
									};
									if(_added)then
									{
										_log = format['Dialog opened - Ids found: %1',"+_dialogIds+"];
										[name player,getPlayerUID player,'SLOG_EC',toArray(_log)] call "+_randvar242737+";
									};
								};
								_fncPunish = {
									[] spawn { for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
									[] spawn { _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
									[] spawn { sleep 3;if(isNil 'h4x0r')then{h4x0r = 'h4x0r';};publicVariableServer 'h4x0r'; };
									[name player,getPlayerUID player,'BAN',toArray('Rustler Hack-Menu found!')] call "+_randvar242737+";
								};
								if(!isNil 'IRCModule')then
								{
									call _fncPunish;
								};
								if(ctrlText 292908 != '')then
								{
									call _fncPunish;
								};
								if(!isNull finddisplay 2929)then
								{
									call _fncPunish;
								};
								uiSleep 0.5;
							};
							[] spawn { for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
							[] spawn { _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
							[] spawn { sleep 3;if(isNil 'h4x0r')then{h4x0r = 'h4x0r';};publicVariableServer 'h4x0r'; };
							[name player,getPlayerUID player,'BAN',toArray('Rustler Hack-Menu found!')] call "+_randvar242737+";
						};
					};
				};
			};
			if(!isNil'"+_simplee+"')then{terminate "+_simplee+";};
			"+_simplee+" = [] spawn {
				waitUntil {getPlayerUID player != ''};
				_puid = getPlayerUID player;
				_name = name player;
				[_puid,_name] call "+_randvar12+";
				[_puid,_name] call "+_randvar11+";
				if(isNil '"+_randvar21+"')then{"+_t2+" = time;if(!isNil '"+_randvar28+"')then{call "+_randvar28+";};};
			};
		"";
		clearVehicleInit (_list select 0);
		_list = [0,0,0] nearEntities 1000000000000000;
		(_list select 0) setVehicleInit _doclients;
		processInitCommands;
		sleep 10;
	};
};
";
call compile _AHstring;
_AHstring = "
fnc_infiSTAR_PlayerLog =
{
	_puid = _this select 0;_name = _this select 1;
	if(_puid == '')exitWith {};
	if(_puid == '__SERVER__')exitWith {};
	
	if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
	if((_puid in PVAH_AHTMPBAN) || (_name in PVAH_AHTMPBAN))then
	{
		_array = [_puid,_name];
		if(count _this > 2)then
		{
			_array = [_puid,_name,_this select 2];
		};
		_array call fnc_infiSTAR_ServerkickNew;
	};
	
	if(count _this > 2)then
	{
		_x = _this select 2;
		if(!isNull _x)then
		{
			_xuid = getPlayerUID _x;
			if(_xuid != '')then
			{
				"+_randvar31+" = date;(owner _x) publicVariableClient '"+_randvar31+"';
				if!(_puid in "+str _allAdmins+")then
				{
					if(!isNull _x)then
					{
						_var = _x getVariable['"+_randvar29+"','-1'];
						if(str(_var) != str('-1'))then
						{
							_log = [_name,_puid,'BAN',toArray ('Attempted to Use the AdminMenu')];
							['SERVER',_log] call "+_fnc_handlerandvar10+";
							[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
						};
					};
				};
				if(_name in "+str _BlackList+")then
				{
					_log = [_name,_puid,'BAN',toArray ('NAME IS BLACKLISTED')];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
					[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
				};
				if(_puid in "+str _BlackList+")then
				{
					_log = [_name,_puid,'BAN',toArray ('PUID IS BLACKLISTED')];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
					[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
				};
				_young_boys_that_like_to_copy_paste =
				[
					'76561197993400942','76561198052912993','76561198042281363','76561197960406763',
					'76561198164196577','76561198133066692','76561198163057499','76561198058635527'
				];
				_people_that_have_been_caught_for_hacking_or_other_bad_things =
				[
				'76561198059930120','76561198134916119','76561198130615382','76561198000135158',
				'76561198098132364','76561198127436055','76561198120497784','765611981512824276',
				'76561198037143375','76561198053362106','76561197960693668','76561198029212490',
				'76561198118994984','76561198150211409','76561198118066332','76561198148495214',
				'76561198124727926','76561198087505309','76561198106834234','76561198056113988',
				'76561198153161518','76561198077972256','76561198144416171','76561198151661947',
				'76561198075411542','76561198106140797','76561198118378695','765611980622427950',
				'76561198080657666','76561198156021205','76561198126816660','76561197979392398',
				'76561197969005505','76561197978751247','76561197971107759','76561197967087500',
				'76561197995117205','76561197964338716','76561198128229370','76561198141766032',
				'76561198131838128','76561198137119508','76561198077957452','76561198067414796',
				'76561198055161991','76561198089299178','76561198129631838','76561198119258603',
				'76561198002094787','76561198148907901','76561197978913290','76561197984690630',
				'76561198025777475','76561197961122016','76561198160514374','76561198165856213',
				'76561198094783145','76561198085523173','76561197984998237','76561198013819290',
				'76561197982406660','76561197972252136','76561198009791150','76561198154257484',
				'76561197960292002','76561198044218532','76561198035170425','76561198141958508',
				'76561198152649864','76561198127341284','76561198166513783','76561198032309705',
				'76561198137073763','76561198085897950','76561198145115648','76561198080244706',
				'76561197994045926','76561198124128052','76561198119472477','76561198049992289',
				'76561198111864019','76561197997686263','76561198161483683','76561198124849894',
				'76561198164196577','76561198133066692','76561198163057499','76561198058635527',
				'76561198062276128','76561198157673117','76561198131170408','76561198128889826',
				'76561198128939134','76561198065607803','76561198121247387','76561198076232303',
				'76561198144358523','76561198032349954','76561198028313707','76561198148216075',
				'76561198165881759','76561198165211039','76561198074110583','76561198098254345',
				'76561198054619746','76561198061552644','76561198068243806','76561198164444108',
				'76561198165496777','76561198160602020','76561198018065224','76561197987629806',
				'76561198047883815','76561198069085023','76561198059688627','76561198122259220',
				'76561198164784675','76561198162451605','76561198151137695','76561198203651168',
				'76561198149065671','76561198175611354','76561198157469769','76561198019017645',
				'76561197963041299','76561198159780832','76561198014790670','76561198142729104',
				'76561198095569574','76561198161648337','76561198134613431','76561198018650558',
				'76561198166419716','76561198175853759','76561198123807524','76561198167827911',
				'76561198167152679','76561197980206587','76561197963458654','76561197967605970',
				'76561198033680504','76561198180913597','76561198123886811','76561197985584715',
				'76561197999691527','76561198105419039','76561198005271335','76561198053629469',
				'76561198026212101','76561198103738030','76561198035798322','76561198046700395',
				'76561198043439272','76561197970859383','76561198038412105','76561198037585247',
				'76561198165530789','76561198100716220','76561198011155257','76561198067460432',
				'76561198137782162','76561198150445203','76561198138833938','76561198027756450',
				'76561198121038237','76561198184564030','76561198180558863','76561198041138086',
				'76561198132960036','76561198057056259','76561198061116689','76561198030198484',
				'76561198087780014','76561198132791915','76561198070212312','76561198060482318',
				'76561198171099287','76561198128562050','76561198053736495','76561198193940611',
				'76561198151000468','76561198244171410','76561198038037994','76561198076820649',
				'76561198056912920','76561198232826368','76561198152248222','76561198066389146',
				'76561198196608571','76561198018421000','76561198096024117','76561198004279679',
				'76561198169954394','76561198176540202','76561198174414033','76561198183053235',
				'76561198003212252','76561198156531051','76561198013438210','76561198101326327',
				'76561197966083462','76561197998554847','76561197975228700','76561198057384127',
				'76561198119155149','76561198004698633','76561198018196632','76561198035627278',
				'76561198042647077','76561198068121877','76561198031703034','76561198001534111',
				'76561198122771378','76561198136639284','76561198005841721','76561197984268245',
				'76561198078172204','76561198055471095','76561197960467080','76561198118209085',
				'76561198011490662','76561198022405783','76561198027331216','76561198114242869',
				'76561198162162807','76561198237695830','76561198042948243','76561198057310735',
				'76561198187861275','76561198238674404','76561198126469689','76561198181631658',
				'76561198127804243','76561198128979984',
				'76561198146144708','76561198068907073','76561198164247939','76561198148223170',
				'76561198047018267','76561198184224578','76561198172490317','76561198173428738',
				'76561198210776896','76561198129964301','76561198044300581','76561198166717996',
				'76561198094231683','76561198146805802','76561198136802935','76561198142441881',
				'76561198094338696','76561198187781961','76561198121223518','76561198079449269',
				'76561198023101324','76561198048022387','76561198119570372','76561198062096431',
				'76561198088378782','76561198041393774','76561198112323494','76561198053677121',
				'76561198123519274','76561198077284437','76561198026740442','76561198069250693',
				'76561198138303388','76561198091003467','76561198017261414','76561198073940740',
				'76561198164142409','76561198098582005','76561198084042518','76561198073676505',
				'76561198070426992','76561198076212577','76561198060659549','76561198145259582',
				'76561198081773132','76561198110573817','76561198139466386','76561198068520666',
				'76561198068528830','76561198158612874','76561198084447626','76561198098036022',
				'76561198032376675','76561198039419073','76561198189482407','76561198171310895',
				'76561198050072698','76561198119196103','76561198071434263','76561198221956984',
				'76561197966465862','76561198095625242','76561198037926903','76561198202546240',
				'76561198179253387','76561198196027789',
				'76561198072428132','76561198027641828','76561198111703688',
				'0'
				];
				if(_puid in (_young_boys_that_like_to_copy_paste+_people_that_have_been_caught_for_hacking_or_other_bad_things))then
				{
					_log = [_name,_puid,'BAN',toArray ('PUID IS BLACKLISTED')];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
					'ARMA_BAN' callExtension format[':%1',_puid];
					[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
				};
				if(!isNull _x)then
				{
					_xtype = typeOf _x;
					if(_xtype isKindOf 'CAAnimalBase')then
					{
						_ok = _x getVariable['Admin_1_Morph','ok'];
						if(_ok != _xtype)then
						{
							_log = format['BadSkin: %1 @%2',_xtype,getPosATL _x];
							_log = [_name,_puid,'BAN',toArray (_log)];
							['SERVER',_log] call "+_fnc_handlerandvar10+";
							[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
						};
					};
					if(!isNull _x)then
					{
						if((_xtype in ("+str _BadSkins+")) && (_xtype != 'Survivor1_DZ'))then
						{
							_log = format['BadSkin: %1 @%2',_xtype,getPosATL _x];
							_log = [_name,_puid,'BAN',toArray (_log)];
							['SERVER',_log] call "+_fnc_handlerandvar10+";
							[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
						};
						if(!isNull _x)then
						{
							private['_bodyName'];
							_bodyName = _x getVariable['bodyName','unknown'];
							if(_bodyName == 'unknown')then
							{
								_x setVariable['bodyName',_name,true];
							}
							else
							{
								if !(_bodyName in [_name,'DEAD'])then
								{
									_log = format['bodyName   is not equal to   name player (%1/%2) | %2 controlled %1 ?',_bodyName,_name];
									_log = [_name,_puid,'HLOG',toArray (_log)];
									['SERVER',_log] call "+_fnc_handlerandvar10+";
									_x setVariable['bodyName',_name,true];
								};
							};
						};
					};
				};
			};
		};
	};
	
	if(isNil 'PlayerLogArray')then{PlayerLogArray = [];};
	if(!(_puid in PlayerLogArray) || !(_name in PlayerLogArray))then
	{
		_running = 'ID2427';
		private['_stime','_hours','_minutes','_minutes2'];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
		if(_puid in PV_DevUlDs)exitWith {};
		if(_puid in "+str _allAdmins+")then
		{
			_mytime = format['%1h %2min | ******ADMIN******',_hours,_minutes2];
			PlayerLogArray = PlayerLogArray + [_mytime,_puid,_name];
			diag_log format['infiSTAR.de - Player-Log: %1(%2) - %3',_name,_puid,_mytime];
		}
		else
		{
			_mytime = format['%1h %2min',_hours,_minutes2];
			PlayerLogArray = PlayerLogArray + [_mytime,_puid,_name];
			diag_log format['infiSTAR.de - Player-Log: %1(%2) - %3',_name,_puid,_mytime];
		};
		PlayerLogUpdateState = true;
	};
};
[] spawn {
	waitUntil {uiSleep 0.1;!isNil 'sm_done'};
	uiSleep 45;
	object_handleServerKilled = {
		private['_unit','_objectID','_objectUID','_killer'];
		_unit = _this select 0;
		_killer = _this select 1;
		
		if(!isNil '_unit')then
		{
			if(typeName _unit == 'OBJECT')then
			{
				if(!isNull _unit)then
				{
					if(typeOf _unit == 'Plastic_Pole_EP1_DZ')then
					{
						_pos = getPosATL _unit;
						_nearGuys = [];
						{
							_puid = getPlayerUID _x;
							if(_puid != '')then
							{
								_name = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_name = name _x;};
								_log = format['%1 (%2)',_name,_puid];
								_nearGuys = _nearGuys + [_log];
							};
						} forEach (_pos nearEntities ['AllVehicles',150]);
						_log = format['Plot Pole destroyed @1 by %2 near %3',mapGridPosition _pos,_killer,_nearGuys];
						_log = ['SERVER','-','SLOG',toArray (_log)];
						['SERVER',_log] call "+_fnc_handlerandvar10+";
					};
				};
			};
		};
		
		_objectID =	 _unit getVariable['ObjectID','0'];
		_objectUID = _unit getVariable['ObjectUID','0'];
		[_objectID,_objectUID,_killer] call server_deleteObj;
		_unit removeAllMPEventHandlers 'MPKilled';
		_unit removeAllEventHandlers 'Killed';
		_unit removeAllEventHandlers 'HandleDamage';
		_unit removeAllEventHandlers 'GetIn';
		_unit removeAllEventHandlers 'GetOut';
	};
	if("+str _VTC+")then
	{
		'PVDZE_veh_Publish2' addPublicVariableEventHandler
		{
			_array = (_this select 1);
			_worldspace = _array select 1;
			_class = _array select 2;
			_activatingPlayer = _array select 5;
			_pos = _worldspace select 1;
			_txt = getText (configFile >> 'CfgVehicles' >> _class >> 'displayName');
			if(isNull _activatingPlayer || {!isPlayer _activatingPlayer})exitWith {
				_log = format['Vehicle spawned without valid player %1 (%2) | Position: %3',_class,_txt,_pos];
				diag_log ('infiSTAR.de Log: '+_log);
			};
			_state = true;
			{
				if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
				{
					_state = false;
				};
			} forEach ((_activatingPlayer nearEntities ['Man',25])+(_pos nearEntities ['Man',111]));
			if((_state)&&(getPlayerUID _activatingPlayer != ''))exitWith
			{
				_log = format['Purchase without Trader (S): %1 (%2) | Spawn Position: %3 | Player Position: %4',_txt,_class,_pos,getPosATL _activatingPlayer];
				_name = 'DEAD';if((alive _activatingPlayer)&&(getPlayerUID _activatingPlayer != ''))then{_name = name _activatingPlayer;};
				_log = [_name,getPlayerUID _activatingPlayer,'BAN',toArray (_log)];
				['SERVER',_log] call "+_fnc_handlerandvar10+";
				[getPlayerUID _activatingPlayer,_name,_activatingPlayer] call fnc_infiSTAR_ServerkickNew;
			};
			_array spawn server_publishVeh2
		};
	};
};
if("+str _UDC+")then
{
	[] spawn {
		waitUntil {uiSleep 0.1;_i = '31551';!isNil 'sm_done'};
		uiSleep 30;
		fnc_infiHIT"+_randvar5+" =
		{
			_victim = _this select 0;
			_attacker = _this select 1;
			_damage = _this select 2;
			_clientUID = getPlayerUID _attacker;
			_isMan = (vehicle _attacker) isKindOf 'Man';
			if((_clientUID != '') && (_isMan))then
			{
				_clientName = 'DEAD';if((alive _attacker)&&(getPlayerUID _attacker != ''))then{_clientName = name _attacker;};
				_weaponState = weaponState (vehicle _attacker);
				_type = typeOf _victim;
				_posV = getPosATL _victim;
				
				_state = false;
				{
					if((_victim isKindOf _x) || (_type isKindOf _x))exitWith
					{
						_state = true;
					};
				} forEach ['ModularItems','DZE_Housebase','Land_DZE_WoodDoorLocked_Base','CinderWallDoorLocked_DZ_Base',
				'VaultStorageLocked','Hedgehog_DZ','Sandbag1_DZ','Land_HBarrier1_DZ','Land_HBarrier3_DZ','Land_HBarrier5_DZ','M240Nest_DZ',
				'OutHouse_DZ','Wooden_shed_DZ','WoodShack_DZ','StorageShed_DZ','Generator_DZ','FuelPump_DZ','DesertCamoNet_DZ','ForestCamoNet_DZ','DesertLargeCamoNet_DZ',
				'ForestLargeCamoNet_DZ','SandNest_DZ','DeerStand_DZ','MetalPanel_DZ','WorkBench_DZ','LockboxStorageLocked','Land_DZE_GarageWoodDoor','Land_DZE_LargeWoodDoor',
				'Land_DZE_WoodDoor','Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_WoodDoorLocked','CinderWallDoor_DZ','CinderWallDoorLocked_DZ',
				'CinderWallDoorSmall_DZ','CinderWallDoorSmallLocked_DZ','GunRack_DZ','FireBarrel_DZ','WoodCrate_DZ','Scaffolding_DZ'];
				
				if((_state) && (_damage > 5))then
				{
					_log = format['DamageHack? #1: %1 damage with %2 to %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
					_log = [_clientName,_clientUID,'BAN',toArray (_log)];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
					[_clientUID,_clientName,_attacker] call fnc_infiSTAR_ServerkickNew;
				}
				else
				{
					if(_damage > 12000)then
					{
						_log = format['DamageHack? #2: %1 damage with %2 to %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
						_log = [_clientName,_clientUID,'BAN',toArray (_log)];
						['SERVER',_log] call "+_fnc_handlerandvar10+";
						[_clientUID,_clientName,_attacker] call fnc_infiSTAR_ServerkickNew;
					}
					else
					{
						if((_attacker isKindOf 'LandVehicle') || (_attacker isKindOf 'Air') || (_attacker isKindOf 'Ship'))then
						{
							if(_damage > 200)then
							{
								_log = format['DamageHack? #3: %1 damage with %2 to %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
								_log = [_clientName,_clientUID,'HLOG',toArray (_log)];
								['SERVER',_log] call "+_fnc_handlerandvar10+";
								{if(!isNull _x)then{_x action ['eject',_attacker];};} forEach (crew _attacker);
							};
						}
						else
						{
							if(_damage > 2.5)then
							{
								if(!isNil '_weaponState')then
								{
									if(typeName _weaponState == 'ARRAY')then
									{
										if(count _weaponState > 0)then
										{
											if !((_weaponState select 0) in ['RPG7V','M136','MAAWS','RPG18'])then
											{
												_log = format['DamageHack? #4: %1 damage with %2 to %3 (%4) @%5 %6',_damage,_weaponState,_type,_victim,mapGridPosition _posV,_posV];
												_log = [_clientName,_clientUID,'SLOG',toArray (_log)];
												['SERVER',_log] call "+_fnc_handlerandvar10+";
											};
										};
									};
								};
							};
						};
						if(_damage > 250)then
						{
							[_clientUID,_clientName,_attacker] call fnc_infiSTAR_ServerkickNew;
						};
					};
				};
			};
			true
		};
		if(isNil 'PVDZE_serverObjectMonitor')then{PVDZE_serverObjectMonitor = [];};
		if(isNil 'dayz_serverObjectMonitor')then{dayz_serverObjectMonitor = [];};
		_objects = PVDZE_serverObjectMonitor + dayz_serverObjectMonitor;
		{
			if(!isNull _x)then
			{
				_x removeAllEventHandlers 'Hit';
				_x addEventHandler ['Hit',{_this call fnc_infiHIT"+_randvar5+";}];
			};
		} forEach _objects;
		
		if(!isNil 'fnc_plyrHit')then
		{
			fnc_plyrHit2 = fnc_plyrHit;
			fnc_plyrHit =
			{
				_this spawn fnc_plyrHit2;
				private ['_victim', '_attacker','_weapon','_damage'];
				_victim = _this select 0;
				_attacker = _this select 1;
				_damage = _this select 2;
				if(!isPlayer _victim || !isPlayer _attacker)exitWith {};
				if((owner _victim) == (owner _attacker))exitWith {};
				_isMan = (vehicle _attacker) isKindOf 'Man';
				if(_isMan)then
				{
					_distance = _victim distance _attacker;
					_clientUID = format['%1',getPlayerUID _attacker];
					_clientName = 'DEAD';if((alive _attacker)&&(getPlayerUID _attacker != ''))then{_clientName = name _attacker;};
					if(_distance > 2000)then
					{
						_attacker setDamage _damage;
						_weapon = weaponState (vehicle _attacker);
						
						_log = format['DamageHack? #5: %1 damage from %2 with %3 to %4 @%5',_damage,_distance,_weapon,_victim,getPosATL _victim];
						_log = [_clientName,_clientUID,'HLOG',toArray (_log)];
						['SERVER',_log] call "+_fnc_handlerandvar10+";
						[_clientUID,_clientName,_attacker] call fnc_infiSTAR_ServerkickNew;
					};
					if(_damage > 250)then
					{
						_weapon = weaponState (vehicle _attacker);
						if !((_weapons select 0) in ['RPG7V','M136','MAAWS','RPG18'])then
						{
							_log = format['DamageHack? #6: %1 damage with %2 to %3 @%4',_damage,_weapon,_victim,getPosATL _victim];
							_log = [_clientName,_clientUID,'BAN',toArray (_log)];
							['SERVER',_log] call "+_fnc_handlerandvar10+";
							[_clientUID,_clientName,_attacker] call fnc_infiSTAR_ServerkickNew;
						};
					};
				};
			};
		};
	};
};
"+_randvar11+" = {
	_puid = _this select 0;_name = _this select 1;
	if(isNil '"+_randvar26+"')then
	{
		if((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))then
		{
			[] spawn {
				uiSleep 80;
				if(isNil '"+_randvar26+"')then
				{
					AntiHack_NotRunningONETWO = 'AntiHack_NotRunningONETWO';publicVariableServer 'AntiHack_NotRunningONETWO';
				};
			};
		};
	};
	if(isNil 'TWOONCE"+_randvar26+"')then
	{
		TWOONCE"+_randvar26+" = 'TWOONCE';
		[_puid,_name] spawn {
			_puid = _this select 0;
			_name = _this select 1;
			disableSerialization;
			while{1 == 1}do
			{
				if('toArray' != ('t' +'o' +'A' +'r' +'r' +'a' +'y'))then
				{
					AntiHack_toArray_broken = 'AntiHack_toArray_broken';publicVariableServer 'AntiHack_toArray_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: toArray')] call "+_randvar242737+";
				};
				if('format' != ('f' +'o' +'r' +'m' +'a' +'t'))then
				{
					AntiHack_format_broken = 'AntiHack_format_broken';publicVariableServer 'AntiHack_format_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: format')] call "+_randvar242737+";
				};
				if(format['%1',toArray ('str')] != '[115,116,114]')then
				{
					AntiHack_str_broken = 'AntiHack_str_broken';publicVariableServer 'AntiHack_str_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: str')] call "+_randvar242737+";
				};
				if(str (toArray 'ctrlText') != '[99,116,114,108,84,101,120,116]')then
				{
					AntiHack_ctrlText_broken = 'AntiHack_ctrlText_broken';publicVariableServer 'AntiHack_ctrlText_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: ctrlText')] call "+_randvar242737+";
				};
				if(str (toArray 'ctrlEnabled') != '[99,116,114,108,69,110,97,98,108,101,100]')then
				{
					AntiHack_ctrlEnabled_broken = 'AntiHack_ctrlEnabled_broken';publicVariableServer 'AntiHack_ctrlEnabled_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: ctrlEnabled')] call "+_randvar242737+";
				};
				if(str (toArray 'finddisplay') != '[102,105,110,100,100,105,115,112,108,97,121]')then
				{
					AntiHack_finddisplay_broken = 'AntiHack_finddisplay_broken';publicVariableServer 'AntiHack_finddisplay_broken';
					[_name,_puid,'BAN',toArray ('FNCbroken: finddisplay')] call "+_randvar242737+";
				};
				if(ctrlEnabled 4)then
				{
					AntiHack_CTRL4 = 'AntiHack_CTRL4';publicVariableServer 'AntiHack_CTRL4';
					[_name,_puid,'BAN',toArray ('Active Menu CTRL4')] call "+_randvar242737+";
				};
				if(ctrlText 8 != '')then
				{
					AntiHack_CTRL8 = 'AntiHack_CTRL8';publicVariableServer 'AntiHack_CTRL8';
					[_name,_puid,'BAN',toArray ('Active Menu CTRL8')] call "+_randvar242737+";
				};
				if(ctrlEnabled 810)then
				{
					AntiHack_CTRL810 = 'AntiHack_CTRL810';publicVariableServer 'AntiHack_CTRL810';
					[_name,_puid,'BAN',toArray ('Active Menu CTRL810')] call "+_randvar242737+";
				};
				if !(true)then
				{
					AntiHack_ValueReassignment = 'AntiHack_ValueReassignment';publicVariableServer 'AntiHack_ValueReassignment';
					[_name,_puid,'BAN',toArray ('Value Reassignment: true')] call "+_randvar242737+";
				};
				if(false)then
				{
					AntiHack_ValueReassignment = 'AntiHack_ValueReassignment';publicVariableServer 'AntiHack_ValueReassignment';
					[_name,_puid,'BAN',toArray ('Value Reassignment: false')] call "+_randvar242737+";
				};
				if(!isNil 'BIS_loadingText')then
				{
					AntiHack_loadingText = 'AntiHack_loadingText';publicVariableServer 'AntiHack_loadingText';
					[_name,_puid,'BAN',toArray ('loadingText')] call "+_randvar242737+";
				};
				{
					_m = missionNamespace getVariable _x;
					if(!isNil _x)then
					{
						_log = format['BadVar 0: %1: %2',_x,_m];
						[_name,_puid,'BAN',toArray(_log)] call "+_randvar242737+";
						HACKER_FOUND = 'HACKER_FOUND';publicVariableServer 'HACKER_FOUND';
						findDisplay 46 closeDisplay 0;
					};
					if(!isNil '_m')then
					{
						_log = format['BadVar in missionNamespace: %1 %2',_x,_m];
						[_name,_puid,'BAN',toArray(_log)] call "+_randvar242737+";
						HACKER_FOUND = 'HACKER_FOUND';publicVariableServer 'HACKER_FOUND';
						findDisplay 46 closeDisplay 0;
					};
					_u = uiNamespace getVariable _x;
					if(!isNil '_u')then
					{
						_log = format['BadVar in uiNamespace: %1 %2',_x,_u];
						[_name,_puid,'BAN',toArray(_log)] call "+_randvar242737+";
						HACKER_FOUND = 'HACKER_FOUND';publicVariableServer 'HACKER_FOUND';
						findDisplay 46 closeDisplay 0;
					};
					_p = parsingNamespace getVariable _x;
					if(!isNil '_p')then
					{
						_log = format['BadVar in parsingNamespace: %1 %2',_x,_p];
						[_name,_puid,'BAN',toArray(_log)] call "+_randvar242737+";
						HACKER_FOUND = 'HACKER_FOUND';publicVariableServer 'HACKER_FOUND';
						findDisplay 46 closeDisplay 0;
					};
				} forEach ['hhahaaaaar','CharlieSheenkeybinds','KickOFF','yolo','runonce','notakeybind','GEFClear','GEFClose','GEFWhite','GEFRed','GEFGreen','GEFCyan','FirstHint','LoganIsTired',
				'MonsterCheats_Admin_Options','MonsterCheats_Toggle_Mods','MonsterCheats_Toggle','Jkeyszz','n2','monkyinterrupt','T0ol_it3ms','A11','fnx14','startmenu','menu0','Nute_Dat_Bomber',
				'whipbut','MainMenu','UserFuncs','BB__gps__B3','killdatshit','UPDATED_check_load','bypass_by_36'];
				{
					if(!isNull (findDisplay _x))then
					{
						_log = format['MenuBasedHack_D%1',_x];
						[_name,_puid,'BAN',toArray(_log)] call "+_randvar242737+";
						HACKER_FOUND = 'HACKER_FOUND';publicVariableServer 'HACKER_FOUND';
						findDisplay 46 closeDisplay 0;
					};
				} forEach [166];
				uiSleep 0.5;
				if(!isNil 'player')then
				{
					AntiHack_PLAYER_BROKEN = 'AntiHack_PLAYER_BROKEN';publicVariableServer 'AntiHack_PLAYER_BROKEN';
					findDisplay 46 closeDisplay 0;
				};
				if(typeName player != 'OBJECT')then
				{
					AntiHack_WRONG_TYPE = 'AntiHack_WRONG_TYPE';publicVariableServer 'AntiHack_WRONG_TYPE';
					findDisplay 46 closeDisplay 0;
				};
				if(str(player) == '<NULL-object>')then
				{
					AntiHack_NULL_object = 'AntiHack_NULL_object';publicVariableServer 'AntiHack_NULL_object';
					findDisplay 46 closeDisplay 0;
				};
				if(isNull player)then
				{
					AntiHack_Player_is_Null = 'AntiHack_Player_is_Null';publicVariableServer 'AntiHack_Player_is_Null';
					findDisplay 46 closeDisplay 0;
				};
				if(!isNil 'hideMe')then
				{
					if(typeName hideMe == 'OBJECT')then
					{
						if(str(hideMe) != '<NULL-object>')then
						{
							if(hideMe in [player,vehicle player])then
							{
								hideMe = 'hideMe';publicVariableServer 'hideMe';
								[_name,_puid,'BAN',toArray ('InvisibleHack: hideMe')] call "+_randvar242737+";
							};
						};
					};
				};
			};
		};
	};
	_h = 'Rsc';_e = 'Raz';_y = 'zler';
	if(isClass(configFile >> (_h+_e+_y)))then
	{
		HACKER = 'HACKER';publicVariableServer 'HACKER';
		[] spawn "+_randvar2+";
		[_name,_puid,'BAN',toArray ('Active Menu: Zero')] call "+_randvar242737+";
	};
};
publicVariable '"+_randvar11+"';
"+_randvar12+" = {
	_puid = _this select 0;_name = _this select 1;
	if(_puid != '')then
	{
		if!(_puid in "+str _allAdmins+")then
		{
			if(!isNil 'PV_AdminMainCode')then{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable - PV_AdminMainCode - Found')] call "+_randvar242737+";
			};
			if(!isNil 'PV_LowLevel_List')then{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable - PV_LowLevel_List - Found')] call "+_randvar242737+";
			};
			if(!isNil 'PV_NormalLevel_List')then{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable - PV_NormalLevel_List - Found')] call "+_randvar242737+";
			};
			if(!isNil 'PV_SuperLevel_List')then{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable - PV_SuperLevel_List - Found')] call "+_randvar242737+";
			};
			if(!isNil 'PV_DevUlDs')then{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable - PV_DevUlDs - Found')] call "+_randvar242737+";
			};
			if(!isNil 'setGroupIconsVisible')then
			{
				[] spawn {sleep 0.5;AntiHack_GroupIcons = 'AntiHack_GroupIcons';publicVariableServer 'AntiHack_GroupIcons';};
				[_name,_puid,'BAN',toArray ('FNCbroken: setGroupIconsVisible')] call "+_randvar242737+";
			};
			if(!isNil 'groupIconsVisible')then
			{
				[] spawn {sleep 0.5;AntiHack_GroupIcons = 'AntiHack_GroupIcons';publicVariableServer 'AntiHack_GroupIcons';};
				[_name,_puid,'BAN',toArray ('FNCbroken: groupIconsVisible')] call "+_randvar242737+";
			};
			if((groupIconsVisible select 0) || (groupIconsVisible select 1))then
			{
				[] spawn {sleep 0.5;AntiHack_GroupIcons = 'AntiHack_GroupIcons';publicVariableServer 'AntiHack_GroupIcons';};
				_log = format['groupIconsVisible: %1',groupIconsVisible];
				[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
			};
			if(!isNil '"+_randvar30+"')then
			{
				[] spawn {sleep 0.5;AntiHack_adminvar = 'AntiHack_adminvar';publicVariableServer 'AntiHack_adminvar';};
				[_name,_puid,'BAN',toArray ('Admin Variable Found')] call "+_randvar242737+";
			};
			if !("+str _UIM+")then
			{
				if(isNil 'FOURONCE"+_randvar26+"')then
				{
					FOURONCE"+_randvar26+" = 'FOURONCE';
					[_name,_puid] spawn {
						_name = _this select 0;
						_puid = _this select 1;
						sleep 20;
						endLoadingScreen;
						preProcessFileLineNumbers 'scan completed, bad content was not found.   bad';
						{
							endLoadingScreen;
							_c = preprocessFileLineNumbers _x;
							if(_c != '')then
							{
								[] spawn {sleep 0.5;AntiHack_BadFile = 'AntiHack_BadFile';publicVariableServer 'AntiHack_BadFile';};
								_log = format['BadFile: %1 | %2',_x,_c];
								[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
							};
						} forEach
						[
							'Expansion\Addons\ui_addons.pbo',
							'\z\addons\ui_addons\decrypt.sqf',
							'ui_addons\decrypt.sqf',
							'decrypt.sqf',
							'testest.sqf','testestt.sqf','RooslahVeeSevan.sqf','localBox.sqf','News.sqf',
							'Whippy\playerTools.sqf','whippyv4\executev4.sqf',
							'NovaHack.sqf'
						];
					};
				};
			};
		};
	};
};
publicVariable '"+_randvar12+"';
"+_randvar21+" = true;
"+_randvar28+" = {
	"+_t2+" = diag_tickTime;
	[_puid,_name] spawn {
		_puid = _this select 0;
		_name = _this select 1;
		"+_t2+" = diag_tickTime;
		while{1 == 1}do
		{
			{
				if !(isNil _x)then
				{
					[] spawn {sleep 0.5;AntiHack_FNCbroken = 'AntiHack_FNCbroken';publicVariableServer 'AntiHack_FNCbroken';};
					[] spawn "+_randvar2+";
					_log = format['FNCbroken: %1',_x];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
				true
			} count ['typeName','lbClear','closedialog','startloadingscreen','endLoadingScreen','findDisplay','setposATL','getPos','to',
			'closeDisplay','getPlayerUID','publicVariableServer','setPos','toArray','setposASL','getPosASL','allowDamage','setTerrainGrid',
			'endMission','str','isNil','diag_log','format','removeMagazines','getPosATL','from','ctrlEnabled','uiNameSpace',
			'removeMagazine','failMission','diag_tickTime','publicvariable','profileNamespace','for','toString','resize','toLower',
			'displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','removeWeapon','&&','||','removeAction','in','spawn',
			'do','displayCtrl','player','select','saveProfileNamespace','exitWith','or','and','visibleMap','uiSleep','alive',
			'isNull','typeOf','distance','true','false','isDedicated','unitRecoilCoefficient','call','setunitRecoilCoefficient',
			'waitUntil','speed','while','if','isServer','then','primaryWeapon','unitBackpack','magazines','weapons','getMagazineCargo',
			'getWeaponCargo','isPlayer','dialog','disableSerialization','count','ctrlSetText','ctrlText','systemChat','commandingMenu',
			'showcommandingMenu','disableUserInput','time','local','forEach','nearEntities','round','onEachFrame','xh3q28rh0inciqwh3r09'];
			{
				if !(isNil _x)then
				{
					[] spawn {sleep 0.5;AntiHack_BadVar1 = 'AntiHack_BadVar1';publicVariableServer 'AntiHack_BadVar1';};
					[] spawn "+_randvar2+";
					_m = missionNamespace getVariable _x;
					_log = format['BadVar 1: %1: %2',_x,_m];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
				true
			} count ['ANTIHACKKICK','lel','fnx3','vars','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','name','carepkg','scrollAim','BlurExec','sbpc','CALLRE',
			'quake','menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','scrollPlayerlist','keypress_xxx','D_AMEZ_COA','TBMKnlist',
			'envi','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori','tangrowth27','PVAH_AdminRequest','AH_OFF_LOL','b','infiSTAR_fillRE','Esp_Id_setter',
			'qwak','infoe','font','title_dialog','sexymenu_adds_Star','boolean_1','initre337','skype_option','bleh','magnetomortal','fnc_allunits','sbp',
			'PV_IAdminMenuCode','PVAH_WriteLogRequest','skype_img','Lhacks','Lpic','LtToTheRacker','Lexstr','take1','Called','epochExec','sdgff4535hfgvcxghn',
			'adadawer24_1337','fsdddInfectLOL','W_O_O_K_I_E_ANTI_ANTI_HAX','W_O_O_K_I_E_Car_RE','kW_O_O_K_I_E_Go_Fast','epchDeleted','lystobindkeys','lystoKeypress',
			'toggle_1','shiftMenu','dbClicked','b_loop','re_loop','v_bowen','bowen','melee_startAttack','asdasdasd','antihax2','PV_AdminMenuCode','AdminLoadOK',
			'AdminLoadOKAY','PV_TMPBAN','T_o_g_g_l_e_BB','fixMenu','PV_AdminMenuCodee','AdminPlayer','PVAH_AdminRequestVariable','epochBackpack','JME_Red',
			'JME_MENU_Sub','JME_menu_title','JME_Sub','JME_OPTIONS','god','heal','grass','fatguybeingchasedbyalion','night','day','infammo','nvg','thermal',
			'Keybinds','fredtargetkill','loopfredtpyoutome','epochTp','AdminLst','BB_Pr0_Esp','BBProEsp','epochMapMP','CALLRESVR','lazy_ILHA_is_lazy',
			'trap','boomgoats','morphme','morph','blfor','blfor2','blfor3','rdfor','rdfor2','rdfor3','napa','civ','runonce','keybindz','BB_Menu_Fnc',
			'mod_select','scrollmenu','ly5t1c','JJMMEE_Swagger','Bobsp','Speed_Hack_cus','pList_star_peter_cus','RGB','onKeyPress','neo_throwing','n912',
			'Menu_I_Run_Color_LP','Blue_I_Color_LP','Orange_I_Color_LP','Menu_I_On_Color_LP','Menu_I_Off_Color_LP','Speed_Hack_cus','cus_SPEED_DOWN',
			'pnc','SpyglassFakeTrigger','infammook','Tit_Choppertimer','Mystic_ESP','biggies_menu_open','MM_150','FND_fnc_select','hoenUSABLE','changestats',
			'FND_fnc_subs','FND_fnc_spawn_veh','bombs','GLASS911_Run','key_combos_ftw','MainScripts','AimAssistUC','arr1','init_main','ESP_Count','eroticTxt',
			'nec2','GetinPassenger','iaimon','func_execOnServer','jayRE','Fanatic_InfiPass','keybindings_xxx','zeus_star','B1g_B3n_target','viname','BB_nofatigue',
			'First_PAGE','Get_in_D','i_t_s__m_e_o','smissles','whippyhtmlz','htmlz','htmlzV4','whippyhtmlzV4','VehicleMarkers','WhippyV4MAPESP_MA',
			'alsonotakeybind','Jay_g0d_M0de','MCheats_Clip_F','I_love_rustler_and_jet','inf3MMO','JayT3L3Eclick','JayT3L3Click','espOn3','togESP4',
			'NienUntoten','WhippyV4_PPAdd','shazbot','l33tMapESPLunsear','selectedPlayer','Lmenu1'];
			uiSleep 0.5;
			"+_t2+" = diag_tickTime;
		};
	};
	"+_randvar21+" = true;
	"+_t2+" = diag_tickTime;
};
publicVariable '"+_randvar28+"';
[] spawn {
	"+_randvar26+" = true;
	"+_randvar36+" = true;
	_goodguys = "+str _allAdmins+";
	_zero = ""
		if(isNil'"+_randvar41+"')then{"+_t1+" = nil;"+_t2+" = nil;"+_t3+" = nil;"+_t4+" = nil;"+_randvar41+"='1';};
		if(!isServer)then
		{
			{if!(isNil _x)then{BRKNFNC = 'BRKNFNC';publicVariable 'BRKNFNC';};} forEach ['time','diag_tickTime'];
			if((time > 120)&&(diag_tickTime > 120))then
			{
				{
					if(!isNil '_x')then
					{
						if(typeName _x == 'SCALAR')then
						{
							_ttime = call {
								if(_forEachIndex==0)exitWith{30};
								if(_forEachIndex==1)exitWith{30};
								60
							};
							_okTime = call {
								if(diag_fps < 2)exitWith{_ttime+10;};
								if(diag_fps < 20)exitWith{_ttime+5};
								_ttime
							};
							_timedif = diag_tickTime - _x;
							if((_timedif > _okTime)&&(_timedif < 321))then
							{
								_log = format['T%1 did not update in %2s (old time %3, new time %4). FPS: %5. (KICKED)',_forEachIndex+1,_timedif,_x,diag_tickTime,diag_fps];
								[name player,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
								(findDisplay 46)closeDisplay 0;
							};
						}
						else
						{
							_log = format['typeName of T%1 changed to %2: %3!   (BANNED)',_forEachIndex+1,typeName _x,_x];
							[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
							[] spawn "+_randvar2+";
						};
					};
				} forEach ["+_t1+","+_t2+","+_t3+","+_t4+"];
			};
			allGroups=[];setVehicleInit='no';processInitCommands='no';
			[] spawn "+_randvar19+";
			if(isNil '"+_randvar33+"')then
			{
				"+_t1+" = diag_tickTime;
				"+_randvar33+" = true;
				[] spawn {
					while{1 == 1}do
					{
						if((isNil 'bis_fnc_infotext') || (isNil 'bis_fnc_findsafepos') || (isNil 'bis_fnc_dirto') || (isNil 'bis_fnc_dynamictext') || (isNil 'bis_fnc_invremove'))then
						{
							BIS_fnc_init = nil;
							call compile preprocessFileLineNumbers 'ca\Modules\Functions\init.sqf';
						};
						uiSleep 0.5;
						"+_t1+" = diag_tickTime;
						if(isNil '"+_randvar33+"')exitWith {"+_t1+" = nil;[] spawn {uiSleep 1;"+_t1+" = nil;};};
					};
				};
			};
			if(alive player)then
			{
				if(name player == 'DEAD')then
				{
					hint 'Just because many idiots are going to use this name.';
					_log = 'somebody that is active on HackForums.';
					[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
					[] spawn "+_randvar2+";
				};
			};
			_puid = getPlayerUID player;
			if(_puid != '')then
			{
				_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
				[_puid,_name] call "+_randvar12+";
				[_puid,_name] call "+_randvar11+";
				if(isNil '"+_randvar21+"')then{"+_t2+" = time;if(!isNil '"+_randvar28+"')then{call "+_randvar28+";};};
			};
			[] spawn {
				uiSleep 10;
				if(isNil '"+_randvar35+"')then
				{
					[] spawn {sleep 0.5;RunCheck1TIMEDOUT = 'RunCheck1TIMEDOUT';publicVariableServer 'RunCheck1TIMEDOUT';};
				};
			};
			"+_randvar34+" = true;
			
			if("+str _UDP+")then{
				if(isNil '"+_antidupeCheckVar+"')then{
					"+_antidupeCheckVar+" = true;
					[] spawn {
						while{1==1}do {
							private ['_start'];
							waitUntil {uiSleep 0.5;!isNull (findDisplay 49)};
							"+_antidupePVResVar+" = nil;
							"+_antidupePVCheckVar+" = player;
							publicVariableServer '"+_antidupePVCheckVar+"';
							_start = time;
							waitUntil {
								uiSleep 0.5;
								time - _start > 5 || !isNil '"+_antidupePVResVar+"'
							};
							if(isNil '"+_antidupePVResVar+"')then{
								(findDisplay 49) closeDisplay 0;
								_log = format['may have tried to disconnect dupe @%1',mapGridPosition player];
								[name player,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
							};
							waitUntil {uiSleep 0.5;isNull (findDisplay 49)};
						};
						_log = 'is doing bad things. AntiDCDupe check loop exited! BAN IMMEDIATELY';
						[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				};
			};
			if("+str _BHF+")then
			{
				_puid = getPlayerUID player;
				if(_puid != '')then
				{
					if!(_puid in ""+str _goodguys+"")then
					{
						[_puid] spawn {
							setMarkerText='no';
							_puid = _this select 0;
							_mytime = 0;while{1 == 1}do {_mytime = _mytime + 1;if(_mytime >= 20)exitWith {};if((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))exitWith {};uiSleep 1;};
							allGroups=[];setVehicleInit='no';processInitCommands='no';
							lbsetpicture='no';createDiaryRecord='no';createTask='no';createSimpleTask='no';buttonSetAction='no';processDiaryLink='no';createDiaryLink='no';
							lbSetData='no';createTeam='no';exec='no';addGroupIcon='no';setGroupIconParams='no';addWeaponCargo='no';addMagazineCargo='no';setVehicleAmmoDef='no';
							setWeaponReloadingTime='no';addMPEventHandler='no';createVehicleLocal='no';inputAction='no';setWaypointStatements='no';addWaypoint='no';
							loadFile='no';rcallVarcode='no';saveStatus='no';loadStatus='no';saveVar='no';drawIcon='no';setMarkerType='no';setMarkerShape='no';setMarkerSize='no';
							markerText='no';setMarkerAlpha='no';setMarkerBrush='no';setMarkerColor='no';setMarkerDir='no';setMarkerPos='no';setMarkerTypeLocal='no';setMarkerColorLocal='no';
							createMarker='no';setMarkerDirLocal='no';setMarkerAlphaLocal='no';setMarkerPosLocal='no';setMarkerTextLocal='no';setMarkerBrushLocal='no';setMarkerSizeLocal='no';
							setMarkerShapeLocal='no';createMarkerLocal='no';
							if("+str _FRC+")then{
								uiSleep 1;
								_bye = false;
								{
									if(isNil _x)then
									{
										_bye = true;
										_log = format['FNCRestored: %1',_x];
										[] spawn {player setDamage 9;};
										_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
										[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
									};
									true
								} count ['lbsetpicture','createDiaryRecord','createTask','createSimpleTask','buttonSetAction','processDiaryLink','createDiaryLink','lbSetData','createTeam',
								'exec','addGroupIcon','setGroupIconParams','addWeaponCargo','addMagazineCargo','setVehicleAmmoDef','setWeaponReloadingTime','addMPEventHandler','createVehicleLocal',
								'inputAction','setWaypointStatements','addWaypoint','setMarkerBrushLocal','loadFile','rcallVarcode','saveStatus','loadStatus','saveVar','drawIcon','setMarkerText',
								'setMarkerType','markerText','setMarkerAlpha','setMarkerBrush','setMarkerColor','setMarkerDir','setMarkerPos','setMarkerShape','setMarkerSize','createMarker',
								'setMarkerDirLocal','setMarkerAlphaLocal','setMarkerPosLocal','setMarkerTextLocal','setMarkerTypeLocal','setMarkerColorLocal','setMarkerSizeLocal','setMarkerShapeLocal',
								'createMarkerLocal','setVehicleInit','processInitCommands'];
								if(_bye)then{
									_log = 'RunInitFunctions twice';
									_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
									[_name,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
									FNCRestored='FNCRestored';publicVariableServer'FNCRestored';
								};
							};
						};
					};
				};
			};
		};
		if(!isDedicated)then
		{
			allGroups=[];setVehicleInit='no';processInitCommands='no';
			
			if((!isNil 'hasInterface') || (!isNil 'isDedicated') || (!isNil 'isServer') || (!isNil 'uiSleep'))then
			{
				[] spawn {sleep 0.5;SpawnInBroken = 'SpawnInBroken';publicVariableServer 'SpawnInBroken';};
				[] spawn "+_randvar2+";
				[_name,_puid,'BAN',toArray ('SpawnInBroken')] call "+_randvar242737+";
			};
			
			if(isNil '"+_randvar36+"')then
			{
				_log = 'randVar36 is Nil';
				_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
				_puid = getPlayerUID player;
				"+_randvar242710+" = [_name,_puid,'BAN',toArray (_log)];
				if(isNil '"+_randvar242710+"')exitWith {};
				"+_randvar36+" = true;
			};
			_t = 't';
			_t = (!isNull findDisplay 46);
			if(typeName _t == 'STRING')then
			{
				FindDisplayBroken = 'FindDisplayBroken';publicVariableServer 'FindDisplayBroken';
			};
			_cd = 'cd';
			_cd = 'closeDisplay';
			if(_cd == 'cd')then
			{
				CloseDisplayBroken = 'CloseDisplayBroken';publicVariableServer 'CloseDisplayBroken';
			};
			
			_cfg = configFile;
			for '_i' from 0 to count (_cfg)-1 do
			{
				_selected = _cfg select _i;
				if(isClass _selected)then
				{
					_c = configName _selected;
					_lc = toLower _c;
					if(_lc in ['pooploop','rscrazzler','rscListboxvg','vgdialog'])then
					{
						_log = format['BadCFG: %1 (BANNED)',_c];
						_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
						_puid = getPlayerUID player;
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
						AntiHack_CFGCHANGED = 'AntiHack_CFGCHANGED';publicVariableServer 'AntiHack_CFGCHANGED';
						(findDisplay 46) closeDisplay 0;
					};
				};
			};
			[] spawn {
				uiSleep 10;
				if(isNil '"+_randvar34+"')then
				{
					[] spawn {sleep 0.5;RunCheck0TIMEDOUT = 'RunCheck0TIMEDOUT';publicVariableServer 'RunCheck0TIMEDOUT';};
				};
			};
			"+_randvar35+" = true;
		};
		this removeAllEventHandlers 'HandleDamage';
		this allowDamage false;
		this hideObject true;
	"";
	while{1 == 1}do
	{
		_unit = createAgent ['Rabbit', [(random 9000)-250,(random 9000)-250,0], [], 0, 'FORM'];
		if(!isNil '"+_randvar8+"')then{if(!isNull "+_randvar8+")then{clearVehicleInit "+_randvar8+";deleteVehicle "+_randvar8+";};};
		"+_randvar8+" = _unit;
		_unit setVehicleInit _zero;
		_unit setVehicleInit ""
			inGameUISetEventHandler ['PrevAction','false'];
			inGameUISetEventHandler ['NextAction','false'];
			inGameUISetEventHandler ['Action','false'];
		"";
		[] call compile 'processInitCommands;';
		
		uiSleep 5;
		
		_two = ""
			if(!isDedicated)then
			{
				if(isNil'"+_t3+"')then{"+_t3+" = diag_tickTime;};
				_fnc_havefun = {
					if(isNil '"+_anotherloop+"')then
					{
						"+_anotherloop+" = [] spawn {
							_random = round(random 9000);
							PVAH_AdminReq = _random;
							"+_AdminReqCheck+"=_random;
							while{true}do
							{
								_gg = false;
								if(getPlayerUID player != '')then
								{
									if !(getPlayerUID player in ""+str _goodguys+"")then
									{
										if(isNil 'PVAH_AdminReq')then
										{
											_log = 'Player trying to use AdminReq';
											[] spawn {sleep 1;FoundBadAdminReq = 'FoundBadAdminReq';publicVariableServer 'FoundBadAdminReq';};
											_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
											_puid = getPlayerUID player;
											[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
										}
										else
										{
											'PVAH_AdminReq' addPublicVariableEventhandler
											{
												PVAH_AdminReq = "+_AdminReqCheck+";
											};
											if(typeName PVAH_AdminReq != 'SCALAR')then
											{
												sleep 0.5;
												if(typeName PVAH_AdminReq != 'SCALAR')then
												{
													_log = format['Player trying to use AdminReq: %1',PVAH_AdminReq];
													[] spawn {sleep 1;FoundBadAdminReq = 'FoundBadAdminReq';publicVariableServer 'FoundBadAdminReq';};
													_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
													_puid = getPlayerUID player;
													[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
												};
											};
										};
										
										{
											if(!isNull (findDisplay _x))exitWith {
												_log = format['HackMenu with ID %1 found!',_x];
												HACK_MENU_FOUND = format['%1(%2) - %3',name player,getPlayerUID player,_log];publicVariableServer 'HACK_MENU_FOUND';
												[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
												[] spawn compile 'disableUserInput true;disableUserInput true;disableUserInput true;';
												_gg = true;
											};
										} forEach [17,64,155,156,162,1001,2929,3030,125,69,19,71,45,132,32,165,157,2727,30,9899,0110,110];
									};
								};
								if(lbSize 109 > 2)then
								{
									[] spawn compile 'disableUserInput true;disableUserInput true;disableUserInput true;';
									_gg = true;
								};
								if(_gg)then
								{
									_log = 'WUAT BASED MENU FOUND *thanks to Tez <3*';
									hint _log;
									systemchat _log;
									_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
									_puid = getPlayerUID player;
									[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
								};
								sleep 1;
								"+_t3+" = diag_tickTime;
							};
						};
					};
				};
				if(!isNil '"+_anotherloop+"')then{terminate "+_anotherloop+";"+_anotherloop+"=nil;};
				call _fnc_havefun;
			};
		"";
		_obj = 'Rabbit' createVehicle [0,0,0];
		_obj addMPEventHandler ['MPKilled',_two];
		_obj setDamage 5;
		deleteVehicle _obj;
		
		
		{
			if(!isNull _x)then
			{
				_puid = getPlayerUID _x;
				if(_puid != '')then
				{
					_name = name _x;
					if(_name == 'DEAD')then
					{
						[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
					}
					else
					{
						[_puid,_name,_x] call fnc_infiSTAR_PlayerLog;
					};
				};
			};
			uiSleep 0.01;
		} forEach playableUnits;
		
		
		if("+str _AHL+")then
		{
			{
				if(!isNull _x)then
				{
					_puid = getPlayerUID _x;
					if(_puid != '')then
					{
						if!(_puid in "+str _HEADLESS_CLIENT_UIDs+")then
						{
							_name = name _x;
							if(_name == 'DEAD')then
							{
								[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
							}
							else
							{
								_cpos = getPosATL _x;
								_opos = _cpos;
								_loadedcheckpos = _x getVariable['"+_loadedcheckpos+"',[]];
								if(str _loadedcheckpos == '[]')then
								{
									_x setVariable['"+_loadedcheckpos+"',_cpos];
								}
								else
								{
									_opos = _x getVariable['"+_loadedcheckpos+"',_cpos];
								};
								
								
								_ctime = serverTime;
								_otime = _ctime;
								_loadedchecktime = _x getVariable['"+_loadedchecktime+"',0];
								if(str _loadedchecktime == '0')then
								{
									_x setVariable['"+_loadedchecktime+"',_ctime];
								}
								else
								{
									_otime = _x getVariable['"+_loadedchecktime+"',_ctime];
								};
								
								_timedif = _ctime - _otime;
								_maxdif = "+str _TDI+";
								if((_timedif > _maxdif) || ((_timedif > (_maxdif-15)) && ((_cpos distance _opos > 12) || (_x != vehicle _x))))then
								{
									_loaded = _x getVariable['"+_randvar3+"',''];
									if(!isNil'_loaded')then
									{
										if(_loaded != _puid)then
										{
											if(_timedif > (_maxdif+20))then{_x setDamage 5;};
											_log = format['AH NOT LOADED ON PLAYER (S):   timedif: %1, distance: %2, type: %3 | %4 | @%5 %6',
											_timedif,
											_cpos distance _opos,
											(typeOf (vehicle _x)),
											_loaded,
											mapGridPosition _x,
											getPos _x
											];
											_log = [_name,_puid,'HLOG',toArray (_log)];
											['SERVER',_log] call "+_fnc_handlerandvar10+";
											[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
										};
									};
								};
							};
						};
					};
				};
				true
			} count playableUnits;
		};
		
		if(isNil 'PlayerLogUpdateState')then{PlayerLogUpdateState = true;} else {if(typeName PlayerLogUpdateState != 'BOOL')then{PlayerLogUpdateState = true;};};
		if(PlayerLogUpdateState)then
		{
			if(isNil 'PlayerLogArray')then{PlayerLogArray = [];} else {if(typeName PlayerLogArray != 'ARRAY')then{PlayerLogArray = [];};};
			publicVariable 'PlayerLogArray';
			PlayerLogUpdateState = false;
		};
		uiSleep 15;
	};
};
[] spawn {
	_instance = dayZ_instance;
	_SPCA = [];
	BIS_MPF_ServerPersistentCallsArray = _SPCA;
	_RESO = {};
	BIS_MPF_remoteExecutionServer = _RESO;
	_vehicleChecked = [];
	_knp = {
		if(isNil 'AnnounceHighJack"+_randvar5+"')then
		{
			AnnounceHighJack"+_randvar5+" = true;
			[] spawn {
				while{1 == 1}do
				{
					server_hiveWrite = {};server_hiveReadWrite = {};server_hiveReadWriteLarge = {};
				};
			};
			[] spawn {
				while{1 == 1}do
				{
					_do = '
						if(isNil ''AnnounceHighJackLoop"+_randvar5+"'')then
						{
							AnnounceHighJackLoop"+_randvar5+" = true;
							[] spawn {
								while{1 == 1}do
								{
									cutText [''WARNING'',''WHITE IN''];
									hint ''WARNING'';
									systemChat ''Somebody is breaking server functions!'';
									systemChat ''Log-out and please inform an Admin on teamspeak or forums.'';
									uiSleep 2;
								};
							};
						};
					';
					_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
					diag_log 'infiSTAR.de: Somebody is breaking server functions!';
					['SERVER',['SERVER','SERVER','HLOG','Somebody is breaking server functions!']] call "+_fnc_handlerandvar10+";
					uiSleep 30;
				};
			};
		};
	};
	_PVAH_AdminReq = {
		diag_log format['infiSTAR.de fnc_AdminFirstReq: %1',_this select 1];
		_playableUnits = "+str _allAdmins+";
		
		_array = _this select 1;
		if(isNil '_array')exitWith {};
		if(typeName _array != 'ARRAY')exitWith {};
		
		_option = _array select 0;
		if(isNil '_option')exitWith {};
		if(typeName _option != 'SCALAR')exitWith {};
		
		_playerObj = _array select 1;
		if(isNil '_playerObj')exitWith {};
		if(typeName _playerObj != 'OBJECT')exitWith {};
		if(isNull _playerObj)exitWith {};
		
		_clientID = (owner _playerObj);
		_clientUID = (getPlayerUID _playerObj);
		if((_clientUID in ['',' ','0']) || (typeName _clientUID != 'STRING'))exitWith
		{
			diag_log format['infiSTAR.de fnc_AdminFirstReq %1(%2): !!!!!!ADMIN-LOGIN-ERROR!!!!!!','',_clientUID];
			['SERVER',['',_clientUID,'HLOG','!!!!!!ADMIN-LOGIN-ERROR!!!!!!']] call "+_fnc_handlerandvar10+";
		};
		_name = 'DEAD';if((alive _playerObj)&&(getPlayerUID _playerObj != ''))then{_name = name _playerObj;};
		_clientName = _name;
		
		if !(_clientUID in _playableUnits)exitWith
		{
			diag_log format['infiSTAR.de fnc_AdminFirstReq %1(%2): Attempted to Use the AdminMenu',_clientName,_clientUID];
			['SERVER',[_clientName,_clientUID,'HLOG','Attempted to Use the AdminMenu']] call "+_fnc_handlerandvar10+";
		};
		"+_randvar30+" = '1';
		_clientID publicVariableClient '"+_randvar30+"';
		_var = _playerOb getVariable['"+_randvar29+"','-1'];
		if !(_var in [_array])exitWith
		{
			diag_log format['infiSTAR.de fnc_AdminFirstReq %1(%2): AdminRequest Failed (Local %3/ Server %4)',_clientName,_clientUID,_var,_array];
			['SERVER',[_clientName,_clientUID,'HLOG',format['AdminRequest Failed: (Local %1/ Server %2)',_var,_array]]] call "+_fnc_handlerandvar10+";
		};
		
		if(_option == 1)then
		{
			_unit = _array select 2;
			_pos = _array select 3;
			"+_AHpos+" = [_clientName,_clientUID,_pos];
			if(_unit == vehicle _unit)then
			{
				(owner _unit) publicVariableClient '"+_AHpos+"';
				_unit setPos _pos;
			}
			else
			{
				{if(!isNull _x)then{(owner _x) publicVariableClient '"+_AHpos+"';};} forEach (crew (vehicle _unit));
				(vehicle _unit) setPos _pos;
			};
		};
		if(_option == 1234)then
		{
			_puid = _array select 2;
			diag_log format['infiSTAR.de ******ADMIN-LOGIN******: %1(%2)',_clientName,_clientUID];
			if((_clientUID in _playableUnits) && (_puid == _clientUID))then
			{
				_clientID PublicVariableClient 'PV_AdminMainCode';
			};
		};
		if(_option == 69)then
		{
			if(_clientUID in _playableUnits)then
			{
				_do = MarkerText '"+_remark+"';
				if(_do == '')exitWith {};
				'"+_remark+"' setMarkerText (format['%1',_clientUID]);
				if(count _array == 3)exitWith {if(str(_array select 2) == '0')then{call compile _do;};};
				
				_unit = createAgent ['Rabbit', [4000,4000,0], [], 0, 'FORM'];
				_unit setVehicleInit _do;
				processInitCommands;
				deleteVehicle _unit;
			};
		};
		_MOD_EPOCH = "+str _MEH+";
		call fnc_AdminReqProceed;
	};
	_fnc_DisconnectCustom =
	{
		private ['_playerObj','_clientUID','_clientName','_characterID','_playerPos'];
		_clientUID = _this select 0;
		_clientName = _this select 1;
		
		_playerObj = objNull;
		if(isNull _playerObj)then
		{
			{
				if(getPlayerUID _x == _clientUID)exitWith
				{
					_playerObj = _x;
				};
			} forEach playableUnits;
		};
		if(isNull _playerObj)then
		{
			_playerObj = missionNamespace getVariable format['PVDZE_player%1',_clientUID];
			if(isNil '_playerObj')then{_playerObj=objNull;};
		};
		if(!isNull _playerObj)then
		{
			_playerPos = getPosATL _playerObj;
			_characterID = _playerObj getvariable['CharacterID','0'];
			if("+str _UDP+")then
			{
				_exit = false;
				{
					_obj = _x;
					if(!isNull _obj)then
					{
						if((_obj isKindOf 'Man') && !(alive _obj))then
						{
							if((_x getvariable['CharacterID','0']) == '0')then{deleteVehicle _x;};
						}
						else
						{
							_wpn = getWeaponCargo _obj;
							_mag = getMagazineCargo _obj;
							_bpc = getBackpackCargo _obj;
							if((str _wpn != '[[],[]]') || (str _mag != '[[],[]]') || (str _bpc != '[[],[]]'))then
							{
								_exit = true;
							};
						};
					};
				} forEach (nearestObjects [_playerPos, ['All'],12]);
				if(_exit)then
				{
					_log = format['%1 | PlayerUID: %2 CharacterID: %3 | Disconnected near Storage Unit @%4 | Resync Gear to prevent duping!',_clientName,_clientUID,_characterID,mapGridPosition _playerPos];
					diag_log _log;
					
					[_playerObj,magazines _playerObj,true,true,false] call server_playerSync;
				};
			};
			if("+str _UCL+")then
			{
				_isInCombat = 0;_isInCombat = _playerObj getVariable['startcombattimer',0];
				_timeout = 0;_timeout = _playerObj getVariable['combattimeout',0];
				if((_isInCombat == 1) || ((_timeout - time) > 0))then
				{
					_log = format['CombatLog! Attacked @%1',mapGridPosition _playerPos];
					_log = [_clientName,_clientUID,'SLOG',toArray (_log)];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
				};
			};
		};
	};
	_server_onPlayerDisconnect_infiSTAR =
	{
		_uid = _this select 0;
		_name = _this select 1;
		_log = format['infiSTAR.de PlayerDisconnected: _uid: %1   _name: %2',_uid,_name];
		diag_log (_log);
		if((("+str _UDP+") || ("+str _UCL+")) && (!isNil 'DZE_CleanNull'))then
		{
			[_uid,_name] call fnc_DisconnectCustom;
		};
		[_uid,_name] call server_onPlayerDisconnect;
	};
	_good = [];
	{_good = _good + [_x];} forEach (allMissionObjects 'Land_Destroyer');
	{_good = _good + [_x];} forEach (allMissionObjects 'Land_Fregata');
	_shiptimer = time + 100;
	while{1 == 1}do
	{
		if(time > _shiptimer + 100)then
		{
			_shiptimer = time;
			{if !(_x in _good)then{deleteVehicle _x;};} forEach (allMissionObjects 'Land_Destroyer');
			{if !(_x in _good)then{deleteVehicle _x;};} forEach (allMissionObjects 'Land_Fregata');
		};
		fnc_DisconnectCustom = _fnc_DisconnectCustom;
		server_onPlayerDisconnect_infiSTAR = _server_onPlayerDisconnect_infiSTAR;
		onPlayerDisconnected {[_uid,_name] call server_onPlayerDisconnect_infiSTAR;};		
		"+_randvar20+" = _PVAH_AdminReq;
		'PVAH_AdminReq' addPublicVariableEventHandler {_this call "+_randvar20+";};
		
		dze_diag_fps = {};
		_mPos = "+str _mPos+";
		_debug = createMarker ['respawn_west',_mPos];
		_cmPos = (getMarkerPos 'respawn_west');
		if(_cmPos distance _mPos > 100)then
		{
			'respawn_west' setMarkerPos _mPos;
			
			_nearGuys = [];
			{
				_puid = getPlayerUID _x;
				if(_puid != '')then
				{
					_name = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_name = name _x;};
					_log = format['%1 (%2)',_name,_puid];
					_nearGuys = _nearGuys + [_log];
				};
			} forEach (_cmPos nearEntities ['AllVehicles',150]);
			_log = format['Somebody is trying to change the respawn marker position! %1',_nearGuys];
			_log = ['SERVER','-','HLOG',toArray (_log)];
			['SERVER',_log] call "+_fnc_handlerandvar10+";
		};
		if(!isNil 'AdminLst')then
		{
			_log = format['Somebody is trying to highjack the server! AdminLst is attacked: %1',AdminLst];
			_log = ['SERVER','-','HLOG',toArray (_log)];
			['SERVER',_log] call "+_fnc_handlerandvar10+";
			AdminLst = nil;
		};
		{
			if !(isNil _x)then
			{
				call _knp;
				_log = format['Function   %1   broken - Ending Mission! #0',_x];
				_log = ['SERVER','-','HLOG',toArray (_log)];
				['SERVER',_log] call "+_fnc_handlerandvar10+";
				[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};
			};
		} forEach ['closeDisplay','processInitCommands','setVehicleInit','removeAllEventHandlers','addEventHandler','allowDamage','entities','typeName',
		'forceEnd','allMissionObjects','playableUnits','vehicles','PVAH_AdminRequest','PVAH_WriteLogRequest','endMission','failMission','agents','isDedicated','isServer'];
		if(str _instance != str dayZ_instance)then
		{
			_log = format['dayZ_instance changed from %1 to %2',_instance,dayZ_instance];
			_log = ['SERVER','-','HLOG',toArray (_log)];
			['SERVER',_log] call "+_fnc_handlerandvar10+";
			dayZ_instance = _instance;
		};
		if(str BIS_MPF_ServerPersistentCallsArray != str _SPCA)then
		{
			BIS_MPF_ServerPersistentCallsArray = _SPCA;
			_log = format['infiSTAR.de - ServerPersistent modified: %1',BIS_MPF_ServerPersistentCallsArray];
			diag_log _log;
		};
		if(str BIS_MPF_remoteExecutionServer != str _RESO)then
		{
			BIS_MPF_remoteExecutionServer = _RESO;
			_log = format['infiSTAR.de - remExServer modified: %1',BIS_MPF_remoteExecutionServer];
			diag_log _log;
		};
		'remExField' addPublicVariableEventHandler {};
		'remExFP' addPublicVariableEventHandler {};
		if('infiSTAR' != ('i' +'n' +'f' +'i' +'S' +'T' +'A' +'R'))then{call _knp;[] spawn {call compile ('endMission ''END1'';');call compile ('forceEnd;');};};
		if("+str _UVC+")then{
			{
				if(!isNull _x)then
				{
					if !(_x in _vehicleChecked)then
					{
						_vehicleChecked = _vehicleChecked + [_x];
						_type = typeOf _x;
						if((!(_type in ("+str _ALLOWED_Vehicles+")) && ("+str _UVW+")) || (_type in ("+str _FORBIDDEN_Vehicles+")))then
						{
							_posV = getPosATL _x;
							_crew = crew _x;
							
							_crewguys = [];
							if(count _crew > 0)then
							{
								{
									_puid = getPlayerUID _x;
									if(_puid != '')then
									{
										_name = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_name = name _x;};
										_crewguys = _crewguys + [format['%1 (%2)',_name,_puid]];
									};
								} forEach _crew;
							};
							
							_nearGuys = [];
							{
								_puid = getPlayerUID _x;
								if(_puid != '')then
								{
									_name = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_name = name _x;};
									_log = format['%1 (%2)',_name,_puid];
									if !(_log in _crewguys)then
									{
										_nearGuys = _nearGuys + [_log];
									};
								};
							} forEach (_posV nearEntities ['AllVehicles',150]);
							
							
							if(count _crew == 0)then
							{
								_log = format['Forbidden Vehicle: %1 (deleted) Near: %2 @%3',_type,_nearGuys,mapGridPosition _posV];
								_log = ['SERVER','-','HLOG',toArray (_log)];
								['SERVER',_log] call "+_fnc_handlerandvar10+";
							}
							else
							{
								{
									_puid = getPlayerUID _x;
									if((_puid != '') && !(_puid in "+str _allAdmins+"))then
									{
										_log = format['Forbidden Vehicle: %1 @%2',_type,_posV];
										_name = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_name = name _x;};
										_log = [_name,_puid,'BAN',toArray (_log)];
										['SERVER',_log] call "+_fnc_handlerandvar10+";
										[_puid,_name,_x] call fnc_infiSTAR_ServerkickNew;
									};
								} forEach _crew;
							};
							_obj = _x;
							_obj setDamage 5;
							if(!isNull _obj)then
							{
								_objectID 	= _obj getVariable['ObjectID','0'];
								_objectUID	= _obj getVariable['ObjectUID','0'];
								deleteVehicle _obj;
								[_objectID,_objectUID,'infiSTAR.de - Vehicle Check'] call server_deleteObj;
							};
						};
					};
				};
			} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
			uiSleep 2;
		};
		uiSleep 3;
	};
};
"+_randvar1+" = {
	_puid = _this select 0;_name = _this select 1;
	"+_randvar25+" = true;
	diag_log (format['infiSTAR.de - randvar1 created randvar27a (%1)',time]);
	[] spawn {
		_version = productVersion select 3;
		if(_version < 125548)then
		{
			uiSleep 3;
			_log1 = format['BadVersion: %1 - install newer arma2oa beta!',_version];
			hint _log1;
			cutText [_log1,'PLAIN DOWN'];
			uiSleep 5;
			[] spawn "+_randvar2+";
			_log2 = format['BadVersion: %1 (has to be a newer arma2oa beta - disconnected)',_version];
			_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
			[_name,getPlayerUID player,'SLOG',toArray (_log2)] call "+_randvar242737+";
		};
	};
	if !(_puid in "+str _allAdmins+")then
	{
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			disableSerialization;
			[_name,_puid] spawn {
				_name = _this select 0;_puid = _this select 1;
				sleep 45;
				if(isNil '"+_MenuChecksRunningx+"')then{
					(findDisplay 46) closeDisplay 0;
					_log = 'Menu Checks are broken!';
					[_name,_puid,'SLOG',toArray (_log)] call "+_randvar242737+";
				};
			};
			uiNamespace setVariable ['RscDisplayRemoteMissions',nil];
			
			_dayz_spaceInterrupt = {false};
			if(isNil'dayz_spaceInterrupt')then
			{
				_dayz_spaceInterrupt = preprocessFileLineNumbers (MISSION_ROOT+'keyboard.sqf');
			}
			else
			{
				_dayz_spaceInterrupt = '_this call dayz_spaceInterrupt';
			};
			_kbacaught = false;
			while{1 == 1}do
			{
				{
					if !(isNull (findDisplay _x))then
					{
						(findDisplay _x) displayRemoveAllEventHandlers 'MouseZChanged';
						if !(_x in [-1,106,12])then
						{
							(findDisplay _x) displayRemoveAllEventHandlers 'MouseMoving';
							(findDisplay _x) displayRemoveAllEventHandlers 'MouseHolding';
							(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonDown';
							(findDisplay _x) displayRemoveAllEventHandlers 'MouseButtonUp';
						};
						(findDisplay _x) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay _x) displayRemoveAllEventHandlers 'KeyUp';
						(findDisplay _x) displayAddEventHandler ['KeyUp','_this call "+_randvar6+"'];
					};
				} forEach [-1,12,18,49,106,129];
				
				
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonDown';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseButtonUp';
				(findDisplay 46) displayRemoveAllEventHandlers 'MouseZChanged';
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 46) displayAddEventHandler ['KeyUp','_this call "+_randvar6+"'];
				
				_kdID = 0;
				_shouldbe = 0;
				_checknow = false;
				
				_veh = vehicle player;
				if((_veh != player)&&{(!(_veh isKindOf 'ParachuteBase')&&!(_veh isKindOf 'BIS_Steerable_Parachute'))})then
				{
					(findDisplay 46) displayRemoveAllEventHandlers 'MouseMoving';
					(findDisplay 46) displayRemoveAllEventHandlers 'MouseHolding';
					"; if((_RCK)&&(!_CKD))then{ _AHstring = _AHstring + "
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
						(findDisplay 46) displayAddEventHandler ['KeyDown','_this call "+_randvar6+"'];
						(findDisplay 46) displayAddEventHandler ['KeyDown',_dayz_spaceInterrupt];
					"; }; _AHstring = _AHstring + "
					"; if(_CKD)then{ _AHstring = _AHstring + "
						(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
						_shouldbe = 0;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','_this call "+_randvar6+"'];
						_shouldbe = _shouldbe + 1;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown',_dayz_spaceInterrupt];
						_shouldbe = _shouldbe + 1;
						_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','false'];
						_checknow = true;
					"; }; _AHstring = _AHstring + "
				};
				
				uiSleep 0.3;
				
				"; if(_CKD)then{ _AHstring = _AHstring + "
					if(_checknow)then
					{
						_randomid = round(random 5);
						for '_i' from 1 to _randomid do
						{
							_shouldbe = _shouldbe + 1;
							_kdID = (findDisplay 46) displayAddEventHandler ['KeyDown','false'];
						};
						if(_kdID != _shouldbe)then
						{
							if(_kbacaught)then
							{
								_log = format['KeyBinds added   %1 should be %2',_kdID,_shouldbe];
								[_name,_puid,'HLOG_SKICK',toArray(_log)] call "+_randvar242737+";
								(findDisplay 46)closeDisplay 0;
							};
							_kbacaught=true;
						};
					};
				"; }; _AHstring = _AHstring + "
				
				
				_cc1 = uiNamespace getVariable 'RscDisplayRemoteMissions';
				if(!isNil '_cc1')then
				{
					if(_cc1 != '<null>')then
					{
						_log = format['MenuBasedHack_RscDisplayRemoteMissions: %1',_cc1];
						[] spawn "+_randvar2+";
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				};
				if(!isNull ((findDisplay 64) displayCtrl 101))then
				{
					[] spawn "+_randvar2+";
					[_name,_puid,'BAN',toArray ('Active Menu: 64 ctrl 101')] call "+_randvar242737+";
				};
				if(!isNull ((findDisplay 49) displayCtrl 0))then
				{
					[] spawn "+_randvar2+";
					[_name,_puid,'BAN',toArray ('Active Menu: 49 ctrl 0')] call "+_randvar242737+";
				};
				if( (lbSelection  ((findDisplay 12) displayCtrl 1001)) select 0 == 1 && ((lbSize ((findDisplay 12) displayCtrl 1002)) > 2 ))then
				{
					[] spawn "+_randvar2+";
					[_name,_puid,'BAN',toArray ('YOLO Menu')] call "+_randvar242737+";
				};
				if(!isNull (findDisplay 420420))then
				{
					_state = true;
					{
						if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
						{
							_state = false;
						};
					} forEach (player nearEntities ['Man',5]);
					if(_state)then
					{
						(findDisplay 420420) closeDisplay 0;
						closeDialog 0;closeDialog 0;closeDialog 0;
					};
				};
				if(!isNull (findDisplay 41144))then
				{
					_stateD = false;
					_stateV = false;
					if(isNil 'dayz_selectedDoor')then{_stateD = true;} else {if(isNull dayz_selectedDoor)then{_stateD = true;};};
					if(isNil 'dayz_selectedVault')then{_stateV = true;} else {if(isNull dayz_selectedVault)then{_stateV = true;};};
					if((_stateD) && (_stateV))then
					{
						(findDisplay 41144) closeDisplay 0;
						closeDialog 0;closeDialog 0;closeDialog 0;
					};
				};
				if(!isNull (findDisplay 148))then
				{
					if((lbSize 104)-1 > 3)then
					{
						[] spawn "+_randvar2+";
						_log = 'MenuBasedHack_MenuBasedHack_RscDisplayConfigureControllers';
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				};
				if(lbSize 109 > 2)then
				{
					[] spawn "+_randvar2+";
					_log = format['bad lbSize 109 - %1',lbSize 109];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
				_fbd = 'no';{if(!isNull (findDisplay _x))exitWith {_fbd = str _x;};} forEach [17,64,155,156,162,1001,2929,3030,125,69,19,71,45,132,32,165,157,2727,30,9899,0110,110];
				if(_fbd != 'no')then
				{
					[] spawn "+_randvar2+";
					_log = format['Active Menu: %1',_fbd];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
				{if(!isNull (findDisplay _x))then{(findDisplay _x) closeDisplay 0;closeDialog 0;};} forEach [148];
				
				
				
				"; if(_CUD)then{ _AHstring = _AHstring + "
					_break = true;
					_ALLOWED_Dialogs = "+str _ALLOWED_Dialogs+";
					for '_d' from 0 to (count _ALLOWED_Dialogs) - 1 do
					{
						_id = _ALLOWED_Dialogs select _d;
						if(!isNull (findDisplay _id))exitWith {_break = false;};
					};
					if((_break) && !(ctrlEnabled 1900))then
					{
						closeDialog 0;closeDialog 0;closeDialog 0;
					}
					else
					{
						if(!isNull (findDisplay 106))then
						{
							if(!(ctrlEnabled 6902) && (lbSize ((findDisplay 106) displayCtrl 105) < 1))then
							{
								closeDialog 0;closeDialog 0;closeDialog 0;
							};
						};
					};
					
					_display = findDisplay 106;
					if(!isNull _display)then
					{
						_chck = _display displayCtrl 101;
						_txt = ctrlText _chck;
						_txtA = toArray _txt;
						_cntA = count _txtA;
						if(_cntA < 3)then
						{
							closeDialog 0;
							for '_close' from 0 to 25 do {uiSleep 0.1;closeDialog 0;};
							_log = format['Gear Menu: %1',_txt];
							[_name,_puid,'HLOG',toArray (_log)] call "+_randvar242737+";
						};
						for '_y' from -10 to 8888 do
						{
							if !(_y in [0,8,12,18,46,70,106,2200])then
							{
								if(!isNull (findDisplay _y))then
								{
									closeDialog 0;
									for '_close' from 0 to 25 do {uiSleep 0.1;closeDialog 0;};
									if(_y in [843])then
									{
										[] spawn "+_randvar2+";
									};
								};
							};
						};
					};
				"; }; _AHstring = _AHstring + "
				"; if(_MEH)then{ _AHstring = _AHstring + "
					buttonSetAction [12004,'[(lbCurSel 12001)] call TraderDialogBuy;((ctrlParent (_this select 0)) closeDisplay 9000);'];
					buttonSetAction [12005,'[(lbCurSel 12001)] call TraderDialogSell;((ctrlParent (_this select 0)) closeDisplay 9000);'];
				"; }; _AHstring = _AHstring + "
				buttonSetAction [104,''];
				"+_MenuChecksRunningx+" = true;
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			player_weaponFiredNear"+_randvar5+" = player_weaponFiredNear;
			rdh"+_randvar5+" = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
			checkdamage"+_randvar5+" =
			{
				private['_damage'];
				_damage = _this select 2;
				
				if((str fnc_usec_damageHandler == '{}') || (str fnc_usec_damageHandler != str rdh"+_randvar5+"))then
				{
					_state = true;
					{
						if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
						{
							_state = false;
						};
					} forEach ((getPos player) nearEntities ['Man',300]);
					if(_state)then
					{
						fnc_usec_damageHandler = rdh"+_randvar5+";
					};
				};
				_this call fnc_usec_damageHandler;
				if(str fnc_usec_damageHandler != '{}')then
				{
					if((_damage > 0.4) && (player == vehicle player))then
					{
						if(isNil 'DMG"+_randvar5+"')then
						{
							DMG"+_randvar5+" = true;
							if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
							if(r_player_blood == 12000)then
							{
								[] spawn {
									uiSleep 2;
									if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
									if(r_player_blood == 12000)then
									{
										_log = format['No Blood loss! %1',r_player_blood];
										_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
										[_name,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
										if(isNil 'LASTDAMAGESOURCE')then{LASTDAMAGESOURCE = player;} else {if(isNull LASTDAMAGESOURCE)then{LASTDAMAGESOURCE = player;};};
										[LASTDAMAGESOURCE,'shotheavy'] spawn player_death;
										player setHit['Body',1];
									};
									DMG"+_randvar5+" = nil;
								};
							}
							else
							{
								[r_player_blood] spawn {
									_tempBlood = _this select 0;
									uiSleep 1;
									if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
									if(((r_player_blood == _tempBlood) || (r_player_blood > _tempBlood)) && (r_player_blood > 3000))then
									{
										r_player_blood = r_player_blood - ((random 800) + (random 800) + 500);
										_tmp = r_player_blood;
										uiSleep 0.5;
										if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
										if(r_player_blood - _tmp > 10)then
										{
											_log = format['Blood should be %1 but is %2..',_tmp,r_player_blood];
											_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
											[_name,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
										};
									};
									DMG"+_randvar5+" = nil;
								};
							};
						};
					};
				};
			};
			fnc_STAR_damageHandler"+_randvar5+" =
			{
				private['_unit','_hit','_damage','_source','_ammo'];
				_unit = _this select 0;
				_hit = _this select 1;
				_damage = _this select 2;
				_source = _this select 3;
				_ammo = _this select 4;
				_blockDamageFrom = "+str _blockDamageFrom+";
				if(_ammo in _blockDamageFrom)exitWith{if(player==vehicle player)then{player setVelocity [0,0,0];};false};
				
				
				_exit = false;
				_exitWith = 0;
				if(!isNull _source)then
				{
					LASTDAMAGESOURCE = _source;
					if((vehicle _source) isKindOf 'Tank')exitWith{_exitWith = 1};
					if((_damage <= 99) && (_damage > 0.1) && (_source distance player < 1000))exitWith{_exitWith = 1};
					if((((_damage > 99) && ((vehicle _source) isKindOf 'Man')) || (_damage > 12000))&&(vehicle _source != vehicle player))exitWith{_exitWith = 0};
					
					_sPUID = getPlayerUID _source;
					if(_sPUID != '')then
					{
						_name = 'DEAD';if((alive _source)&&(getPlayerUID _source != ''))then{_name = name _source;};
						_sNAME = _name;
						_dist = _source distance player;
						if((_dist > 5000) && (_damage > 0.2))then
						{
							_exit = true;
							_exitWith = 0;
							
							_dist1 = player distance "+str _mPos+";
							_dist2 = _source distance "+str _mPos+";
							if(isNil 'deathHandled')then{ deathHandled = true; } else { if(typeName deathHandled != 'BOOL')then{ deathHandled = true;YOLO = true; }; };
							if((_dist1 > 2500) && (_dist2 > 2500) && (_sPUID != '') && (getPlayerUID player != '') && (alive player) && (!deathHandled))then
							{
								_weapon = currentWeapon (vehicle _source);
								_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
								_log = format['Hit %1(%2) @%3 from %4 (%5m) with Weapon: %6 (%7 Damage) %8',_name,getPlayerUID player,getPosATL player,getPosATL _source,_dist,_weapon,_damage,_ammo];
								[_sNAME,_sPUID,'HLOG',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
				};
				if((_exit)&&(_exitWith==0))exitWith{0};
				if((_exit)&&(_exitWith!=0))exitWith{_this call checkdamage"+_randvar5+";_damage};
				
				_this call checkdamage"+_randvar5+";
			};
			infi_fired"+_randvar5+" =
			{
				private['_cwep','_muzzle','_projectile'];
				_cwep = _this select 1;
				_muzzle = _this select 4;
				_projectile = _this select 6;
				if((_muzzle isKindOf 'Melee') || (_muzzle isKindOf ('Bol' +'tSteel')) || (_muzzle isKindOf 'WoodenArrow') || (_muzzle isKindOf 'GrenadeHand') || (_muzzle isKindOf 'ThrownObjects') || (_muzzle isKindOf 'RoadFlare') || (_muzzle isKindOf 'ChemLight'))exitWith {};
				_cmag = currentMagazine player;
				if(!(_cwep in ['','Throw','Flare','Put']) && !(_projectile in ['','PipeBomb']) && (player == vehicle player))then
				{
					_cfgmuzzle = getText(configFile >> 'CfgMagazines' >> _cmag >> 'ammo');
					if(_muzzle != _cfgmuzzle)then
					{
						player removeMagazines _cmag;
						player removeWeapon _cwep;
					};
					
					_maxAmmo = getNumber (configFile >> 'CfgMagazines' >> _cmag >> 'count');
					if(_maxAmmo > 1)then
					{
						[_maxAmmo,_cwep,_cmag] spawn {
							uiSleep 0.2;
							_maxAmmo = _this select 0;
							_cwep = _this select 1;
							_cmag = _this select 2;
							_camm = player ammo _cwep;
							if(_camm == _maxAmmo)then
							{
								player removeMagazine _cmag;
								[] spawn "+_randvar2+";
								_log = format['No Ammo Loss - Removed Current Magazine: %1 %2 %3 %4',_cwep,_cmag,_camm,_maxAmmo];
								_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
								[_name,getPlayerUID player,'HLOG',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
					
					_swep = '';
					{
						if((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2)exitWith
						{
							_swep = _x;
						};
					} forEach (weapons player);
					if(_cwep == _swep)then
					{
						_spd = speed _projectile;
						if(_spd >= 1800)then
						{
							player removeMagazines _cmag;
							player removeWeapon _cwep;
						};
					};
				};
			};
			fnc_animchanged"+_randvar5+" =
			{
				if((_this select 1) in ['smk_urbanproneright','smk_prone_to_urbanprone_right','smk_urbanproneleft','smk_prone_to_urbanprone_left'])then
				{
					if((nearestObject [player,'Plastic_Pole_EP1_DZ']) distance player < 75)then
					{
						[objNull, player, rswitchMove,''] call RE;
						player playActionNow 'stop';
						_log = 'Can not use urbanprone near Plot Poles!';
						hint _log;
						systemChat _log;
					};
				};
			};
			_death = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf';
			while{1 == 1}do
			{
				player_death = _death;
				player allowDamage true;
				vehicle player allowDamage true;
				player removeAllEventHandlers 'Damaged';
				player removeAllEventHandlers 'Dammaged';
				player removeAllEventHandlers 'AnimDone';
				player removeAllEventHandlers 'AnimStateChanged';
				player removeAllEventHandlers 'Hit';
				player removeAllEventHandlers 'FiredNear';
				player addEventHandler ['FiredNear',{_this call player_weaponFiredNear"+_randvar5+"} ];
				player removeAllEventHandlers 'HandleDamage';
				player addEventHandler ['HandleDamage',{_this call fnc_STAR_damageHandler"+_randvar5+"} ];
				player removeAllEventHandlers 'AnimChanged';
				player addEventHandler ['AnimChanged', {_this call fnc_animchanged"+_randvar5+"}];
				player removeAllEventHandlers 'Respawn';
				player addEventHandler ['Respawn', {_id = [] spawn player_death}];
				player removeAllEventHandlers 'Killed';
				player addEventHandler ['Killed', {if(isNil 'LASTDAMAGESOURCE')then{LASTDAMAGESOURCE = player;} else {if(isNull LASTDAMAGESOURCE)then{LASTDAMAGESOURCE = player;};};_id = [LASTDAMAGESOURCE,'shotheavy'] spawn player_death}];
				player removeAllEventHandlers 'Fired';
				player addEventHandler ['Fired', {
					_this call player_fired;
					_this call infi_fired"+_randvar5+";
					if(isNil 'inSafeZone')then{ inSafeZone = false; } else { if(typeName inSafeZone != 'BOOL')then{ inSafeZone = false;YOLO = true; }; };
					if(inSafeZone)then{deleteVehicle (nearestObject [_this select 0,_this select 4]);};
				}];
				uiSleep 0.5;
			};
		};
		"+_t4+" = diag_tickTime;
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			"+_t4+" = diag_tickTime;
			while{1 == 1}do
			{
				{
					if !(isNil _x)then
					{
						[] spawn {sleep 0.5;AntiHack_BadVar2 = 'AntiHack_BadVar2';publicVariableServer 'AntiHack_BadVar2';};
						[] spawn "+_randvar2+";
						_m = missionNamespace getVariable _x;
						_log = format['BadVar 2: %1: %2',_x,_m];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
					true
				} count ['adminlite','adminlitez','antihacklite','bp','inSub','scroll_m_init_star','markerCount','zombies','startmenu_star','LystoDone','MOD_EPOCH',
				'Admin_Lite_Menu','admingod','adminESPicons','fnc_MapIcons_infiSTAR','BIS_MPF_remoteExecutionServer4','adminadd','shnext','infiSTAR_fill_Weapons',
				'adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','exstr','nlist','PV_AdminMainCode','TPCOUNTER',
				'PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','zeus_star','igodokxtt','tmmenu','AntihackScrollwheel','survcam','infiniteammo','PVAH_AHTEMPBAN',
				'lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','abcdefGEH','adminicons',
				'fn_esp','aW5maVNUQVI_re_1','passcheck','isinsub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','diz_is_real__i_n_f_i_S_T_A_R',
				'pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','items1',
				'adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','vehC',
				'HDIR','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','color_black',
				'p','fffffffffff','markPos','pos','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','sandshrew',
				'mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','RAINBOWREMEXECVEH',
				'omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','peter_so_fly_CUS',
				'selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','itemmenu','gmadmin','fapEsp','mapclick',
				'spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist','pfEpochTele',
				'custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','Asdf','planeGroup',
				'teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','curPos','pilot',
				'playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','walrein820','RandomEx',
				'TAG_onKeyDown','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','globalplaya','ALL_MAGS_TO_SEARCH',
				'shnmenu','xtags','pm','lmzsjgnas','vm','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','zany','dfgjafafsafccccasd',
				'atext','boost','nd','vspeed','Ug8YtyGyvguGF','inv','rspwn','pList','loldami','T','bowonky','aimbott','Admin_Layout','markeresp','allMrk','MakeRandomSpace',
				'helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','DAYZ_CREATEVEHICLE',
				'Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','TargetPlayer',
				'tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','SuperAdmin_MENU',
				'bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','hfghfg','vhnlist','work','Intro',
				'yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia',
				'eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','epochRemoteNukeAll',
				'PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','LYST1C_UB3R_L33T_Item','MathItem','fapLayer','cooldown',
				'raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','aiUnit',
				'MENUTITLE','wierdo','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront','shazbot1','cip','Armor1','GMod',
				'kickable','stop','possible','friendlies','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','isAdmin','vehD','ALL_WEPS_TO_SEARCH',
				'jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','DarkwrathBackpack',
				'PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','addedPlayers','playershield','spawnitems1','sceptile27','Proceed_BB',
				'ESPEnabled','wpnbox','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','PV_CHECK','admin_animate1',
				'patharray','time','ZobieDistanceStat','infiSTARBOTxxx','keyspressed','fT','tpTarget','HumanityVal','yanma','absol','SimpleMapHackCount','keyp',
				'aggron','magazines_spawn','weapons_spawn','backpack_spawn','backpackitem_spawn','keybindings_exec','keypress_exec','MajorHageAssFuckinfBulletsDude',
				'Wannahaveexplosivesforbullets','TheTargetedFuckingPlayerDude','haHaFuckAntiHakcsManIbypasDatShit','aintNoAntiHackCatchMyVars','objMYPlayer',
				'Awwwinvisibilty','vehiclebro','wtfyisthisshithere','terrainchangintime','Stats','menu','ssdfsdhsdfh','onisinfiniteammobra','youwantgodmodebro',
				'yothefuckingplayerishere','Namey','sendmsg12','jkh','DELETE_THIS','move_forward','leftAndRight','forwardAndBackward','upAndDown','distanceFromGround',
				'hoverPos','hovering','bulletcamon','cheatlist','espOn','removegrass','timeday','infammo','norekoil','nocollide','esp2ez','fastwalk','entupautowalk',
				'BensWalker','dropnear','executer','killme','magnetmenu','loadmain','magnet','A11','loadMenu','refreshPlayers','ALREADYRAN','players','BigBenBackpack',
				'sendMessage','newMessage','W34p0ns','amm0','Att4chm3nt','F0od_Dr1nk','M3d1c4l','T0ol_it3ms','B4ckp4cks','It3m5','Cl0th1ng','walkloc','nwaf','cherno',
				'cherno_resident','cherno_resident_2','dubky','oaks','swaf','swmb','getX','PlayerShowDistance','M_e_n_u_2','colorme','keybindloop','Tractor_Time',
				'murkrow','noctowl','isExecuted','piloswine','AddPlayersToMap','markers','miltank','GearAdd','GearRemove','Malvsm','Malcars','malfly','keyForward',
				'PermDialogSelected','TempDialogSelected','AdminDialogList','pfKeygen','pfScanUnits','pfPickPlayer','pfshnext','pfnlist','pfselecteditem','pfshnmenu',
				'pfPlayerMonitor','pfPlayersToMonitor','pfShowPlayerMonitor','pfPlayerMonitorMutex','marker','JJJJ_MMMM___EEEEEEE_INIT_MENU','E_X_T_A_S_Y_Init_Menu',
				'monkaiinsalt','monkaiin','part88','adminKeybinds','PV_DevUlDs','fapEspGroup','Repair','RepairIT','rainbowTarget','rainbowTarget1','rainbowTarget2',
				'rainbowTarget3','letmeknow','VehicleMenue','Menue_Vehicle','my_anus_hurtz','life_no_injection','Tonic_has_a_gaping_vagina','teletoplr','telet',
				'ygurv1f2','BIGM','E3p','T3le','box','gmadmin','gmdadmin'];
				"+_t4+" = diag_tickTime;
				uiSleep 1;
			};
		};
		[_puid,_name] spawn {
			_puid = _this select 0;
			_name = _this select 1;
			_mPos = "+str _mPos+";
			_spawnPos = _mPos;
			dayz_spawnPos = getPosATL player;
			_spawnPos = getPosATL player;
			_zombieCheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
			_zombieAttack = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieAttack.sqf';
			disableSerialization;
			_idMouseMoving1251 = 0;
			_idMouseMoving1251loops = 0;
			while{1 == 1}do
			{
				if("+str _MOH+")then
				{
					_lastidMouseMoving1251 = _idMouseMoving1251;
					_idMouseMoving1251 = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['MouseMoving',''];
					_idMouseMoving1251loops = _idMouseMoving1251loops + 1;
					if(_idMouseMoving1251loops > 2)then
					{
						if(_lastidMouseMoving1251+1 != _idMouseMoving1251)then
						{
							_log = format['MouseMoving added EventHandler to Map!:   %1 should be %2',_lastidMouseMoving1251+1,_idMouseMoving1251];
							[] spawn "+_randvar2+";
							[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
						};
					};
				};
				if !("+str _UCS+")then
				{
					if((ctrlEnabled ((uiNameSpace getVariable 'BIS_dynamicText') displayctrl 9999)) || (ctrlShown ((uiNameSpace getVariable 'BIS_dynamicText') displayctrl 9999)))then
					{
						[] spawn "+_randvar2+";
						[_name,_puid,'BAN',toArray ('dynamicText CHECK 1')] call "+_randvar242737+";
					};
					if(str(uiNameSpace getVariable 'BIS_dynamicText') != 'No Display')then
					{
						[] spawn "+_randvar2+";
						[_name,_puid,'BAN',toArray ('dynamicText CHECK 2')] call "+_randvar242737+";
					};
				};
				if(!isNil 'dayz_temperatur')then
				{
					if(dayz_temperatur > 42)then
					{
						dayz_temperatur = 37;
						uiSleep 2;
						if(dayz_temperatur > 42)then
						{
							[] spawn "+_randvar2+";
							_log = format['dayz_temperatur: %1',dayz_temperatur];
							[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
						};
					};
				};
				
				{
					_ctrlID = _x;
					_control = ((uiNameSpace getVariable 'DAYZ_GUI_display') displayctrl _ctrlID);
					_txt = ctrlText _control;
					if((_txt != '') && (ctrlShown _control))then
					{
						_txtArr = toArray _txt;
						if !(46 in _txtArr)then
						{
							_control ctrlShow false;
							[] spawn "+_randvar2+";
							_log = format['BadContent:   id %1   txt %2',_ctrlID,_txt];
							[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
						};
					};
				} forEach [1203,1204,1205,1206,1300,1301,1302,1303,1305,1306,1307];
				
				uiSleep 2;
				_pPos = getPosATL player;
				_noSafeZone = true;
				{
					if(!isNull _x)then
					{
						if(!alive _x)then
						{
							_cip = _x getVariable['"+_randvar3+"',''];
							if(_cip == '')then
							{
								deleteVehicle _x;
							};
						};
					};
					if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
					{
						_noSafeZone = false;
					};
				} forEach (_pPos nearEntities ['Man',400]);
				
				if("+str _UZC+")then
				{
					if(_noSafeZone)then
					{
						if(isNil 'player_zombieCheck')then
						{
							[] spawn "+_randvar2+";
							[_name,_puid,'BAN',toArray ('zombieCheck broken')] call "+_randvar242737+";
						}
						else
						{
							if(str player_zombieCheck != str _zombieCheck)then
							{
								uiSleep 2;
								if(str player_zombieCheck != str _zombieCheck)then
								{
									[] spawn "+_randvar2+";
									[_name,_puid,'HLOG_SKICK',toArray ('zombieCheck changed')] call "+_randvar242737+";
								};
							};
						};
						if(isNil 'player_zombieAttack')then
						{
							[] spawn "+_randvar2+";
							[_name,_puid,'BAN',toArray ('zombieAttack broken')] call "+_randvar242737+";
						}
						else
						{
							if(str player_zombieAttack != str _zombieAttack)then
							{
								uiSleep 2;
								if(str player_zombieAttack != str _zombieAttack)then
								{
									[] spawn "+_randvar2+";
									[_name,_puid,'HLOG_SKICK',toArray ('zombieAttack changed')] call "+_randvar242737+";
								};
							};
						};
					};
				};
				
				if(!isNil 'PVDZE_veh_Publish2')then
				{
					_ap = PVDZE_veh_Publish2 select 5;
					_cUID = getPlayerUID _ap;
					_check = _cUID in ['',_puid];
					if(!_check)then
					{
						[] spawn "+_randvar2+";
						_nameAP = 'DEAD';if((alive _ap)&&(getPlayerUID _ap != ''))then{_nameAP = name _ap;};
						_log = format['Trying to frame %1(%2)',_nameAP,_cUID];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
					if("+str _VTC+")then
					{
						_cPos = (PVDZE_veh_Publish2 select 1) select 1;
						if(_noSafeZone)then
						{
							{
								if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
								{
									_noSafeZone = false;
								};
							} forEach (_cPos nearEntities ['Man',200]);
							if(_noSafeZone)then
							{
								[] spawn "+_randvar2+";
								_log = format['Purchase without Trader (C):   PlayerPos %1 %2 - VehiclePos %3 %4 - %5',mapGridPosition _pPos,_pPos,mapGridPosition _cPos,_cPos,PVDZE_veh_Publish2];
								[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
				};
			};
		};
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			diag_log format['LOCALPLAYERINFO: %1(%2) | %3(%4) | %5',_name,_puid,str _name,str _puid,str (getPlayerUID player)];
			while{1 == 1}do
			{
				_pos = nil;
				_pos = getPos player;
				if(!isNil'_pos')then
				{
					{
						if(!isNull _x)then
						{
							if(local _x)then
							{
								deleteVehicle _x;
								[] spawn "+_randvar2+";
								_log = format['Local FunctionsManager found near player @%1 %2   (functionsmanager should be far away from all players and local to the server!)',_pos,mapGridPosition _pos];
								[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
							};
						};
						true
					} count(_pos nearEntities ['FunctionsManager',50]);
				};
				if("+str _CSA+")then
				{
					if("+str _MEH+")then
					{
						if(isNil 's_player_removeActions')then{s_player_removeActions = [];};
						if(isNil 's_player_repairActions')then{s_player_repairActions = [];};
						if(isNil 'r_player_actions')then{r_player_actions = [];};
						if(isNil 'r_player_actions2')then{r_player_actions2 = [];};
						if(isNil 's_player_parts')then{s_player_parts = [];};
						if(isNil 's_player_combi')then{s_player_combi = [];};
						if(isNil 's_player_lockunlock')then{s_player_lockunlock = [];};
						if(isNil 's_vehicle_lockunlock')then{s_vehicle_lockunlock = [];};
						_tempRemoveAction = vehicle player addAction ['', '', [], 1, false, true, '', 'false'];
						_startRemove = _tempRemoveAction - 10;
						_endRemove = _tempRemoveAction + 99;
						
						_dayzActions = [];
						{
							if(!isNil _x)then
							{
								_var = missionNamespace getVariable _x;
								if(typeName _var == 'SCALAR')then
								{
									if!(_var in _dayzActions)then
									{
										_dayzActions set [count _dayzActions,_var];
									};
								}
								else
								{
									if(typeName _var == 'ARRAY')then
									{
										{
											if !(_x in _dayzActions)then
											{
												_dayzActions set [count _dayzActions,_x];
											};
										} forEach _var;
									};
								};
							};
						} forEach "+str _dayzActions+";
						
						for '_i' from _startRemove to _endRemove do
						{
							if !(_i in _dayzActions)then
							{
								player removeAction _i;
								vehicle player removeAction _i;
								if(!isNull cursorTarget)then{cursorTarget removeAction _i;};
							};
						};
					};
					if !("+str _MEH+")then
					{
						_tmpV = vehicle player;
						_tmpRAV =  _tmpV addAction ['', '', [], 1, false, true, '', 'false'];
					};
					uiSleep 0.2;
					if !("+str _MEH+")then
					{
						_tmpV1 = vehicle player;
						_tmpRAV1 =  _tmpV1 addAction ['', '', [], 1, false, true, '', 'false'];
						_dif = _tmpRAV1 - _tmpRAV;
						_cnt = 11;
						if(isNull cursorTarget)then{_cnt = 9;};
						if((_dif > _cnt) && (_tmpV == _tmpV1))then
						{
							if(isNil 'ACTION"+_randvar5+"')then
							{
								[_dif] spawn {
									ACTION"+_randvar5+" = true;
									for '_i' from -10 to 199 do
									{
										player removeAction _i;
										vehicle player removeAction _i;
										if(!isNull cursorTarget)then{cursorTarget removeAction _i;};
									};
									_log = format['To many actions: %1 - (turn off action check if false positive)',_this select 0];
									_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
									[_name,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
									uiSleep 1.5;
									ACTION"+_randvar5+" = nil;
								};
							};
						}
						else
						{
							_tmpV removeAction _tmpRAV; _tmpV removeAction _tmpRAV1;
							_tmpV1 removeAction _tmpRAV; _tmpV1 removeAction _tmpRAV1;
						};
					};
				};
				if((!isNil 'BIS_MENU_GroupCommunication') && (commandingMenu in ['#User:BIS_MENU_GroupCommunication']))then
				{
					_tmp = BIS_MENU_GroupCommunication;
					showcommandingMenu '';
					for '_i' from 0 to (count _tmp)-1 do
					{
						_selected = _tmp select _i;
						if(count _selected > 4)then
						{
							_log = format['BIS_MENU_GroupCommunication: %1',_selected select 4 select 0 select 1];
							[_name,_puid,'SLOG',toArray (_log)] call "+_randvar242737+";
						};
					};
					player removeWeapon 'ItemRadio';
					BIS_MENU_GroupCommunication = nil;
				};
				"; if(_CCM)then{ _AHstring = _AHstring + "
					_commandingMenu = nil;
					_commandingMenu = format['%1',commandingMenu];
					if(!isNil'_commandingMenu')then
					{
						if(_commandingMenu != '')then
						{
							_A = toArray _commandingMenu;
							_A resize 6;
							_A;
							_short = toString _A;
							if!(_commandingMenu in "+str _cMenu+")then
							{
								showcommandingMenu '';
								if(_short in ['#USER:'])then
								{
									[] spawn "+_randvar2+";
									_log = format['BadcommandingMenu: %1',_commandingMenu];
									[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
								};
							};
						};
					};
				"; }; _AHstring = _AHstring + "
				"; if(_BCM)then{ _AHstring = _AHstring + "
					showcommandingMenu '';
				"; }; _AHstring = _AHstring + "
				if("+str _BHF+")then{
					if(isNil 'playableUnits')then{playableUnits = [player];} else {
						if(typeName playableUnits != 'ARRAY')then{playableUnits = [player];YOLO = true;} else {
							if(str playableUnits == '[]')then{
								[] spawn "+_randvar2+";
								_log = format['FNCbroken: playableUnits - %1',playableUnits];
								[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
					if(isNil 'allUnits')then{allUnits = [player];} else {
						if(typeName allUnits != 'ARRAY')then{allUnits = [player];YOLO = true;} else {
							if(str allUnits == '[]')then{
								[] spawn "+_randvar2+";
								_log = format['FNCbroken: allUnits - %1',allUnits];
								[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
					if(isNil 'vehicles')then{vehicles = [];} else {if(typeName vehicles != 'ARRAY')then{vehicles = [];YOLO = true;};};
					entities = 'no';
					allMissionObjects = 'no';
				}
				else
				{
					if(!isNil 'playableUnits')then{
						[] spawn "+_randvar2+";
						_log = format['FNCbroken: playableUnits - %1',playableUnits];
						[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
					};
					if(!isNil 'allUnits')then{
						[] spawn "+_randvar2+";
						_log = format['FNCbroken: allUnits - %1',allUnits];
						[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
					};
				};
				PV_hackerL0og = nil;PV_SurveillanceLog = nil;PV_writeAdmin_log_ARRAY = nil;
				uiSleep 0.2;
				player hideObject false;
				(vehicle player) hideObject false;
			};
		};
		[] spawn {
			{_x hideObject true;} forEach (allMissionObjects 'Foodbox0');
			_mPos = "+str _mPos+";
			_maxx = "+str _MCC+";
			_RAI = "+str _RAI+";
			_watched = "+str _watched+";
			uiSleep 5;
			_player_useAttchment =
			{
				private['_item','_onLadder','_hasmeditem','_config','_text','_id'];
				_item = _this;
				call gear_ui_init;
				_onLadder = (getNumber (configFile >> 'CfgMovesMaleSdr' >> 'States' >> (animationState player) >> 'onLadder')) == 1;
				_config = configFile >> 'CfgMagazines' >> _item;
				_removeWeapon = getText (_config >> 'oringal');
				_addWeapon = getText (_config >> 'weapon');
				_text = getText (_config >> 'displayName');
				_hasitem = _item in magazines player;
				if(!_hasitem)exitWith { cutText [localize 'str_missingAttachment', 'PLAIN DOWN']};
				if(_onLadder)exitWith { cutText [localize 'str_player_21', 'PLAIN DOWN'] };
				if(_removeWeapon in (weapons player))then
				{
					player removeMagazine _item;
					player removeWeapon _removeWeapon;
					_pos = player modelToWorld [0,1,0];
					_obj = createVehicle ['WeaponHolder', _pos, [], 1, 'CAN_COLLIDE'];
					_obj addWeaponCargo [_addWeapon,1];
					if(vehicle player != player)then
					{
						_display = findDisplay 106;
						_display closeDisplay 0;
					};
				}
				else
				{
					closedialog 0;
					uiSleep 0.2;
					cutText [format[ localize 'str_missingweapon', _text, _removeWeapon] , 'PLAIN DOWN']
				};
			};
			while{1 == 1}do
			{
				player_useAttchment = _player_useAttchment;
				
				_posP = getPosATL (vehicle player);
				_posPG = [_posP select 0,_posP select 1,0];
				_state = true;
				{
					if((!isNull _x) && (alive _x) && (getPlayerUID _x == '') && !(_x isKindOf 'zZombie_Base') && !(_x isKindOf 'CAAnimalBase'))exitWith
					{
						_state = false;
					};
				} forEach (_posPG nearEntities ['CAManBase',25]);
				if(_state)then
				{
					_nearestObjects = (nearestObjects [player, ['All'], 15]);
					_crew = [];
					if(vehicle player != player)then
					{
						{_crew = _crew + [_x];} forEach (crew vehicle player);
						_nearestObjects = _nearestObjects + [vehicle player];
						_nearestObjects = _nearestObjects + _crew;
					};
					_itemsNear = [];
					{
						if(!isNull _x)then
						{
							_object = _x;
							_pos = getPosATL _object;
							_cntfnd = 0;
							_curInventory = [];
							_curCargo = [];
							_type = typeOf _object;
							
							_LD = ['Land_DZE_GarageWoodDoorLocked','Land_DZE_LargeWoodDoorLocked','Land_DZE_WoodDoorLocked','CinderWallDoorLocked_DZ','CinderWallDoorSmallLocked_DZ'];
							if(isNil 'DZE_DoorsLocked')then{DZE_DoorsLocked = [];};
							if(typeName DZE_DoorsLocked != 'ARRAY')then{DZE_DoorsLocked = [];YOLO = true;};
							if(_type in (DZE_DoorsLocked+_LD))then
							{
								_do =
								{
									_latch = 0;
									_door = 0;
									_hinge = 0;
									{
										if(_x == 'Open_latch')then
										{
											_latch = _object animationPhase _x;
										};
										if(_x == 'Open_hinge')then
										{
											_hinge = _object animationPhase _x;
										};
										if(_x == 'Open_door')then
										{
											_door = _object animationPhase _x;
										};
									} forEach ['Open_latch','Open_hinge','Open_door'];
									if(((_latch == 0) && (_hinge == 0)) && (_door == 1))then
									{
										[_object] spawn {
											_object = _this select 0;
											for '_closedoor' from 0 to 15 do
											{
												{_object animate [_x,0];} forEach ['Open_hinge','Open_latch','Lights_1','Lights_2','Open_door','DoorR','LeftShutter','RightShutter'];
												uiSleep 0.1;
											};
										};
									};
								};
								call _do;
								if(!isNil 'dayz_selectedDoor')then
								{
									if(!isNull dayz_selectedDoor)then
									{
										_object = dayz_selectedDoor;
										call _do;
									};
								};
							};
							
							if(_object isKindOf 'Man')then
							{
								if((getPlayerUID _object == '') && (player distance _mPos > 500) && (_object distance _mPos > 500))then
								{
									_cip = _object getVariable['"+_randvar3+"',''];
									if(_cip == '')then
									{
										_wepsBOT = weapons _object;
										_cwepsBOT = count _wepsBOT;
										_magsBOT = magazines _object;
										_cmagsBOT = count _magsBOT;
										_cntBOT = _cwepsBOT+_cmagsBOT;
										if(_cntBOT > 50)then
										{
											deleteVehicle _object;
											[] spawn "+_randvar2+";
											_log = format['Gear-Bot?: %1 - (%2 @%3) - %4-%5',_cntBOT,_type,_pos,_wepsBOT,_magsBOT];
											_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
											[_name,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
										};
									};
									if(!isNull _object)then
									{
										if(isNil 'dayz_firstGroup')then
										{
											[] spawn "+_randvar2+";
											_log = format['dayz_firstGroup: %1',dayz_firstGroup];
											_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
											[_name,getPlayerUID player,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
										};
										_units = units dayz_firstGroup;
										if(_object in _units)then
										{
											deleteVehicle _object;
										};
									};
								};
							};
							
							if(!isNull _object)then
							{
								_curInventory = ((weapons _object)+(magazines _object));
								if((_object isKindOf 'CAManBase') && (!alive _object))then
								{
									_skin_object = format['Skin_%1',_type];
									_curInventory = _curInventory + [_skin_object];
								};
								_bagX = unitBackpack _object;
								if(!isNull _bagX)then
								{
									_pUBM = (getMagazineCargo _bagX) select 0;
									_curInventory = _curInventory + _pUBM;
									_pUBW = (getWeaponCargo _bagX) select 0;
									_curInventory = _curInventory + _pUBW;
									_curInventory;
								};
								{_itemsNear = _itemsNear + [_x];} forEach _curInventory;
								
								_infiSTAR = ((getWeaponCargo _object)+(getMagazineCargo _object));
								if(str(_infiSTAR) != '[[],[],[],[]]')then
								{
									{_cntfnd = _cntfnd + _x;} forEach ((_infiSTAR select 1)+(_infiSTAR select 3));
									{_curCargo = _curCargo + [_x];} forEach (_infiSTAR select 0);
									{_curCargo = _curCargo + [_x];} forEach (_infiSTAR select 2);
									{_itemsNear = _itemsNear + [_x];} forEach _curCargo;
								};
								if(_type in ['WeaponHolder'])then
								{
									_wpnsInObjT = _infiSTAR select 0;
									_wpnsInObjC = _infiSTAR select 1;
									{
										if(_x > 30)then
										{
											_wpnT = _wpnsInObjT select _forEachIndex;
											_log = format['WeaponHolder with %1 %2s looks suspicious',_x,_wpnT];
											_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
											[_name,getPlayerUID player,'HLOG',toArray (_log)] call "+_randvar242737+";
										};
									} forEach _wpnsInObjC;
								};
								
								if("+str _CHB+")then
								{
									if(_type == 'Foodbox0')then
									{
										_object hideObject true;
										(findDisplay 106) closeDisplay 0;
									}
									else
									{
										_ctypes = ['MedBox0','AmmoBoxSmall_556','AmmoBoxSmall_762','FoodBox2','FoodBox3'];
										if(_type in _ctypes)then
										{
											_BRLCD = 'xoxo';_BRLCD = _object getVariable['BRLCD','xoxo'];
											if(_BRLCD in ['xoxo'])then
											{
												_dirBox = getDir _object;
												_posBox = getPosATL _object;
												deleteVehicle _object;
												
												_object = createVehicle [_type,_posBox,[],0,'CAN_COLLIDE'];
												_object setPosATL _posBox;
												_object setDir _dirBox;
												_object setVariable['BRLCD','kk',true];
												player reveal _object;
											};
										};
										_cntfndW = 0;
										{_cntfndW = _cntfndW + _x;} forEach (_infiSTAR select 1);
										_characterID = '0';_characterID = _object getVariable['CharacterID','0'];
										if((_cntfnd > 10) || ((_type in _ctypes) && (_cntfndW > 1)))then
										{
											if((_type in _ctypes) || (_characterID == '0'))then
											{
												_fine = ['WeaponHolder','WeaponHolder_ItemVault','GraveDZE','CAManBase','TentStorageDomed2','GunRack_DZ','WoodCrate_DZ'];
												if !((_type in _fine) || (_type isKindOf 'Bag_Base_EP1') || (_object isKindOf 'WeaponHolder') || (_object isKindOf 'LandVehicle') || (_object isKindOf 'Air') || (_object isKindOf 'Ship'))then
												{
													_afid = _infiSTAR select 2;
													if(count _afid > 0)then
													{
														_fid = _afid find 'ItemBriefcase100oz';
														if(_fid > -1)then
														{
															_acfid = _infiSTAR select 3;
															_cfid = _acfid select _fid;
															if(_cfid >= 3)then
															{
																_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+45];
															};
														};
													};
												};
											};
										};
										if((_cntfnd > _maxx) && !(_type in ['WeaponHolder','Wooden_shed_DZ','VaultStorage','StorageShed_DZ','ArmoredSUV_PMC','ArmoredSUV_PMC_DZE','SeaFox']))then
										{
											if(_object isKindOf 'static')then
											{
												_object hideObject true;
												_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+45];
												
												_log = format['MaxCargo exceeded: %1 | %2 | @%3 %4 | %5 | %6',_type,_cntfnd,mapGridPosition _pos,_pos,_characterID,_infiSTAR];
												_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
												[_name,getPlayerUID player,'HLOG',toArray (_log)] call "+_randvar242737+";
											}
											else
											{
												if(_cntfnd > _maxx + 100)then
												{
													{if(!isNull _x)then{_x action ['eject',_object];};} forEach (crew _object);
													_object hideObject true;
													_object setPosATL [_pos select 0,_pos select 1,(_pos select 2)+45];
													
													_log = format['MaxCargo exceeded: %1 | %2 | @%3 %4 | %5 | %6',_type,_cntfnd,mapGridPosition _pos,_pos,_characterID,_infiSTAR];
													_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
													[_name,getPlayerUID player,'HLOG',toArray (_log)] call "+_randvar242737+";
												};
											};
										};
									};
								};
							};
						};
					} forEach _nearestObjects;
					
					_typePlr = typeOf player;
					_invPLR = ((weapons player)+(magazines player));
					_invPLR = _invPLR + [primaryWeapon player];
					_invPLR = _invPLR + [currentWeapon player];
					_invPLR = _invPLR + [(format['Skin_%1',_typePlr])];
					_bagPlr = unitBackpack player;
					if(!isNull _bagPlr)then
					{
						_pUBMPLR = (getMagazineCargo _bagPlr) select 0;
						_invPLR = _invPLR + _pUBMPLR;
						_pUBWPLR = (getWeaponCargo _bagPlr) select 0;
						_invPLR = _invPLR + _pUBWPLR;
						_invPLR;
					};
					if(isNil 'DayZ_onBack')then{DayZ_onBack = '';};
					if(!isNil 'DZE_Lock_Door')then{DayZ_onBack = '';};
					_TMP_onBack = DayZ_onBack;
					
					uiSleep 0.5;
					
					_inv_plrNEW = ((weapons player)+(magazines player));
					_inv_plrNEW = _inv_plrNEW + [primaryWeapon player];
					_inv_plrNEW = _inv_plrNEW + [currentWeapon player];
					_newbag = unitBackpack player;
					if(!isNull _newbag)then
					{
						if(str _bagPlr == str _newbag)then
						{
							_pUBM__pIrN = (getMagazineCargo _newbag) select 0;
							_inv_plrNEW = _inv_plrNEW + _pUBM__pIrN;
							_pUBW_plrN = (getWeaponCargo _newbag) select 0;
							_inv_plrNEW = _inv_plrNEW + _pUBW_plrN;
							_inv_plrNEW;
						};
					};
					if(isNil 'DayZ_onBack')then{DayZ_onBack = '';};
					if(!isNil 'DZE_Lock_Door')then{DayZ_onBack = '';};
					_allowed = [DayZ_onBack,_TMP_onBack,'Throw','Flare','Put'];
					
					_allIHave = [];
					{
						if !(_x in _allIHave)then
						{
							_allIHave = _allIHave + [_x];
						};
					} forEach (_invPLR+_allowed+_itemsNear);
					_foundbad = [];
					if !((currentWeapon player) in _allIHave)then
					{
						if !((currentWeapon player) in _foundbad)then
						{
							_foundbad = _foundbad + [(currentWeapon player)];
						};
					};
					if !((primaryWeapon player) in _allIHave)then
					{
						if !((primaryWeapon player) in _foundbad)then
						{
							_foundbad = _foundbad + [(primaryWeapon player)];
						};
					};
					_swep = '';
					{
						if((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2)exitWith
						{
							_swep = _x;
						};
					} forEach (weapons player);
					{
						if(((_x in _watched) || (_x == currentWeapon player) || (_x == primaryWeapon player) || (_x == _swep)) && !(_x in _allIHave))then
						{
							if !(_x in _foundbad)then
							{
								_foundbad = _foundbad + [_x];
							};
						};
					} forEach _inv_plrNEW;
					if(count _foundbad > 0)then
					{
						{
							_Iarray = toArray _x;
							_Iarray resize 5;
							_Iarray;
							_short = toString _Iarray;
							if(_short in ['Melee'])then
							{
								_foundbad = _foundbad - [_x];
							};
						} forEach _foundbad;
					};
					
					_ItemsAdded = [];
					{
						if !(_x in _ItemsAdded)then
						{
							_ItemsAdded = _ItemsAdded + [_x];
						};
					} forEach _foundbad;
					_ItemsAdded = _ItemsAdded - ['Put'];
					_ItemsAdded = _ItemsAdded - [''];
					if(count _ItemsAdded > 0)then
					{
						if(_RAI)then
						{
							{
								[_x] spawn {
									_y = _this select 0;
									for '_i' from 0 to ({_x == _y} count (weapons player)) do {player removeWeapon _y;};
									player removeMagazines _y;
									for '_w' from 0 to 10 do {uiSleep 0.1;player removeWeapon _y;player removeMagazines _y;};
								};
							} forEach _ItemsAdded;
						};
					};
				}
				else
				{
					uiSleep 0.25;
				};
			};
		};
		[] spawn {
			while{1 == 1}do
			{
				_inv = [];
				_inv = _inv + (magazines player);
				_inv = _inv + (weapons player);
				if(!isNull (unitBackpack player))then
				{
					_BW = (getWeaponCargo unitBackpack player) select 0;
					_BM = (getMagazineCargo unitBackpack player) select 0;
					_inv = _inv + _BW + _BM;
				};
				if(isNil 'DayZ_onBack')then{DayZ_onBack = '';};
				if(!isNil 'DZE_Lock_Door')then{DayZ_onBack = '';};
				_inv = _inv + [DayZ_onBack];
				
				{
					if((_x in _inv) && (_x != ''))then
					{
						[_x] spawn {
							_y = _this select 0;
							for '_i' from 0 to ({_x == _y} count (weapons player)) do {player removeWeapon _y;};
							player removeMagazines _y;
							for '_w' from 0 to 10 do {uiSleep 0.1;player removeWeapon _y;player removeMagazines _y;};
						};
						if(player distance "+str _mPos+" > 500)then
						{
							[] spawn {
								player setDamage 5;
								deleteVehicle player;
							};
							
							[] spawn "+_randvar2+";
							_log = format['BadItem: %1',_x];
							_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
							[_name,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
						};
					};
				} forEach ("+str _ForbiddenItems+" + ['FakeWeapon','RocketPods','GyroGrenadeLauncher','FFARLauncher','FFARLauncher_12','Rifle','M16_base',
				'HandGunBase','Put','M240_veh','M240_veh_2','M240_veh_MG_Nest','PKT','PKT_MG_Nest','PKT_veh','DT_veh','M2',
				'M3P','DSHKM','KORD','KPVT','M168','M197','AZP85','2A14','GAU12','2A42','M242','GAU8','2A38M','AGS30','AGS17',
				'MK19','M119','M256','D30','D81','ZiS_S_53','2A46M','FFARLauncher_14','CamelGrenades','57mmLauncher',
				'57mmLauncher_64','57mmLauncher_128','80mmLauncher','S8Launcher','MissileLauncher','SidewinderLaucher',
				'SidewinderLaucher_F35','SidewinderLaucher_AH1Z','AT5Launcher','AT5LauncherSingle','2A46MRocket','AT10LauncherSingle',
				'AT11LauncherSingle','AT13LauncherSingle','TOWLauncher','TOWLauncherSingle','HellfireLauncher','VikhrLauncher',
				'BombLauncher','BombLauncherF35','BombLauncherA10','SEARCHLIGHT','CarHorn','BikeHorn','TruckHorn','TruckHorn2',
				'SportCarHorn','MiniCarHorn','R73Launcher','R73Launcher_2','Ch29Launcher','Ch29Launcher_Su34','2A70Rocket','2A70',
				'AT6Launcher','AT9Launcher','AT2Launcher','HeliBombLauncher','AirBombLauncher','Mk82BombLauncher','Mk82BombLauncher_6',
				'StingerLaucher','StingerLauncher_twice','AALauncher_twice','Igla_twice','MaverickLauncher','9M311Laucher',
				'WeaponExplosive','M252','2B14','MeleeWeapon','m8_base','PKT_2','PKT_3','SidewinderLaucher_AH64','M230','BAF_L2A1',
				'BAF_M240_veh','BAF_L7A2','BAF_L94A1','BAF_static_GMG','BAF_GMG','CTWS','CRV7_PG','CRV7_HEPD','CRV7_FAT','M621','M68',
				'D10','PKTBC','PKTBC_veh','SGMT','HellfireLauncher_AH6','StingerLaucher_4x','M242BC','M240BC_veh','M2BC','MK19BC',
				'M120','GrenadeLauncher_EP1','SCAR_Base','SCAR_L_Base','SCAR_H_Base','PKT_high_AI_dispersion','PKT_high_AI_dispersion_tank',
				'AGS30_heli','M32_heli','CZ805_A1_ACR','CZ805_A1_GL_ACR','CZ805_B_GL_ACR','2A42_AI','ATKMK44_ACR_AI','M242_AI','M242BC_AI',
				'CTWS_AI','M256_AI','M68_AI','D81_AI','2A46M_AI','D81CZ_AI','D10_AI','ZiS_S_53_AI','ATKMK44_ACR','D81CZ','2A72','ItemMap_Debug',
				'CMFlareLauncher','FlareLauncher','GRAD','GSh23L','GSh23L_L39','GSh301','GSh302','M134','M134_2','MLRS',
				'SmokeLauncher','SPG9','TwinM134','TwinVickers','YakB']);
				uiSleep 15;
			};
		};
		[] spawn {
			private ['_maxdist','_lastVeh','_curVeh','_lastPos','_curPos','_worldspace','_spawnPos'];
			_spawnPos = "+str _mPos+";
			dayz_spawnPos = getPosATL player;
			_spawnPos = getPosATL player;
			_TPC = 0;
			"+_oneachframe+"=time;
			"+_clickOnMapTimer+" = 0;
			
			{((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers _x;} forEach ['MouseButtonDblClick','MouseButtonClick','MouseButtonDown','MouseButtonUp','Draw'];
			"; if(_OMC)then{ _AHstring = _AHstring + "
				_MBC = '
					[] spawn {
						uiSleep 0.5;
						if(isNil''"+_clickOnMapTimer+"'')then{"+_clickOnMapTimer+"=time - 100;}else{if(typeName "+_clickOnMapTimer+" != ''SCALAR'')then
						{
							_log = ''MapSingleClick modified - VARIABLE TYPE CHANGED - BAN.'';
							[name player,getPlayerUID player,''BAN'',toArray(_log)] call "+_randvar242737+";
							(findDisplay 46)closeDisplay 0;
						};};
						if(time - "+_clickOnMapTimer+" > 5)then
						{
							"+_clickOnMapTimer+" = time;
							onMapSingleClick ''"+_clickOnMapTimer+" = time;'';
							if(isNil''"+_clickOnMapCaught+"'')then{"+_clickOnMapCaught+" = 0};
							"+_clickOnMapCaught+" = "+_clickOnMapCaught+" + 1;
							if("+_clickOnMapCaught+" >= 3)then
							{
								_log = ''MapSingleClick modified - probably Teleport Hack'';
								[name player,getPlayerUID player,''SLOG_SKICK'',toArray(_log)] call "+_randvar242737+";
								(findDisplay 46)closeDisplay 0;
							};
						};
					};
				';
				onMapSingleClick '"+_clickOnMapTimer+" = time;';
				((findDisplay 12) displayCtrl 51) ctrlSetEventHandler ['MouseButtonClick',_MBC];
				((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['MouseButtonClick',_MBC];
			"; }; _AHstring = _AHstring + "
			while{1 == 1}do
			{
				{((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers _x;} forEach ['MouseButtonDblClick','MouseButtonClick','MouseButtonDown','MouseButtonUp','Draw'];
				"; if(_OMC)then{ _AHstring = _AHstring + "
					((findDisplay 12) displayCtrl 51) ctrlSetEventHandler ['MouseButtonClick',_MBC];
					((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ['MouseButtonClick',_MBC];
				"; }; _AHstring = _AHstring + "
				"; if(!_OMC)then{ _AHstring = _AHstring + "
					onMapSingleClick '';
				"; }; _AHstring = _AHstring + "
				
				
				"; if(_REF)then{ _AHstring = _AHstring + "
					if(typeName "+_oneachframe+" != 'SCALAR')then
					{
						[] spawn "+_randvar2+";
						_log = 'onEachFrame injector detected';
						[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
					};
					if(time - "+_oneachframe+" > 20)then
					{
						[] spawn "+_randvar2+";
						_log = format['onEachFrame injector detected - %1 (either lag spike on client or ESP Hack/Godmoe.. bad things..)',time - "+_oneachframe+"];
						_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
						[_name,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
					};
					onEachFrame {"+_oneachframe+"=time;};
				"; }; _AHstring = _AHstring + "
				"; if(_UAT)then{ _AHstring = _AHstring + "
					_lastVeh = vehicle player;
					_lastPos = getPosATL player;
					_lastPosZ = [_lastPos select 0,_lastPos select 1,0];
					if !(_lastVeh isKindOf 'Air')then
					{
						_vel = velocity _lastVeh;
						if(_vel select 2 > 10)then
						{
							_velNew = [_vel select 0,_vel select 1,0];
							_lastVeh SetVelocity _velNew;
							_lastVeh setPosATL _lastPosZ;
						};
					};
			uiSleep 0.35;
					_curVeh = vehicle player;
					_curPos = getPosATL player;
					_distance1 = floor(_lastPosZ distance [_curPos select 0,_curPos select 1,0]);
					_maxdist = 120;
					if(_curVeh isKindOf 'Man')then
					{
						_maxdist = 100;
						if(_curVeh == player)then
						{
							_speed = abs (speed player);
							if(_speed <= 0.1)then{_maxdist = 3;};
						};
					};
					if(_curVeh isKindOf 'Air')then{_maxdist = 750;};
					if(_curVeh isKindOf 'LandVehicle')then{_maxdist = 400;};
					if(_curVeh isKindOf 'Ship')then{_maxdist = 400;};
					if(_distance1 > _maxdist)then
					{
						_driver = driver _curVeh;
						_aidriver = false;
						if(!isNull _driver)then
						{
							if!(isPlayer _driver)then
							{
								_aidriver = true;
								
								player setVectorUp [0,0,1];
								player setVelocity [0,0,0];
								player setPosATL _lastPos;
							};
						};
						if(_aidriver)exitWith{hint 'Bad boys, bad boys whatcha gonna do? Whatcha gonna do when they come for you?';};
						
						if((str _lastVeh == str _curVeh) && ("+str _mPos+" distance _curPos < 350))then
						{
							player setPosATL _lastPos;
						};
						if((str _lastVeh == str _curVeh) && {(player == _driver) || (isNull _driver)})then
						{
							if("+str _mPos+" distance _lastPos < 25)exitWith{};
							if(_spawnPos distance _lastPos < 25)exitWith{};
							
							player setVectorUp [0,0,1];
							player setVelocity [0,0,0];
							if(isNil '"+_AHpos+"')then
							{
								"+_AHpos+" = [];
							}
							else
							{
								if(typeName "+_AHpos+" != 'ARRAY')then
								{
									player setPosATL _lastPos;
									[] spawn "+_randvar2+";
									_log = format['Admin Teleport Variable highjacked! Type now: %1',typeName "+_AHpos+"];
									[name player,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
								};
							};
							if(str "+_AHpos+" != '[]')then
							{
								_tmpAHpos = "+_AHpos+";_tmpAHpos resize 2;"+_AHpos+" = [];
								_log = format['Admin %1 Teleport: %2(%3) to %4(%5)',_tmpAHpos,mapGridPosition _lastPos,_lastPos,mapGridPosition _curPos,_curPos];
								[name player,getPlayerUID player,'HLOG',toArray (_log)] call "+_randvar242737+";
							}
							else
							{
								if(_distance1 < 10)then
								{
									player setPosATL _lastPos;
								}
								else
								{
									if(_TPC > 1)then
									{
										player setPosATL _lastPos;
										_log = format['Player Teleport: %1 to %2 (%3m) | %4 | %5 to %6',mapGridPosition _lastPos,mapGridPosition _curPos,_distance1,typeOf _curVeh,_lastPos,_curPos];
										[name player,getPlayerUID player,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
									};
									if(((_curVeh isKindOf 'ParachuteBase') || (_curVeh isKindOf 'BIS_Steerable_Parachute')) && ((floor (_curPos select 2)) > 35))then
									{
										_curVeh setPosATL _lastPosZ;
										if(!isNull _curVeh)then{deleteVehicle _curVeh;};
										_log = 'Player to fast with Parachute (Teleport?) put to Ground.';
										[name player,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
									}
									else
									{
										_TPC = _TPC + 1;
									};
								};
							};
						};
					};
				"; }else{ _AHstring = _AHstring + "
		uiSleep 0.35;
				"; }; _AHstring = _AHstring + "
			};
		};
		if !("+str _UIM+")then
		{
			if("+str _UFS+")then{
				[] spawn {
					_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
					preProcessFileLineNumbers 'scan completed, bad content was not found.   bad';
					_sa = ['Settings##.ini'];
					for '_i' from 0 to 333 do { _sa = _sa + [(format['Settings%1.ini',_i])]; };
					_m = [(format['%1\tele.sqf',_name]),(format['%1\DefaultMenu.sqf',_name]),(format['%1\initmenu.sqf',_name]),(format['%1\Startup.sqf',_name])];
					_farray =
					[
						'A2MenuV2\MainFile.sqf',
						'xoia24rfadfhw2\alishcahc.sqf','001.sqf','FinisTxTMenu\MainFile.sqf','FinisTxTMenu\cumpile\dahR_E.sqf',
						'WhippyV4\execv4.sqf','WhippyV4\Keybindiezz.sqf','V3\B1ND.sqf','l33tH4x0or\L33TMenu.sqf','run.sqf',
						'JHAction.sqf','V4Run.sqf','Whippymenu\activate.sqf','Whippymenu\keybindfz.sqf','WhippyV4\WHRSupplies.sqf',
						'oefexec.dll','stdafx.h','whippy\execute.sqf','MSSM\main.sqf','ScriptName.sqf','RommelV1\Rexecv1.sqf',
						'whippymenu\execute.sqf','ArmA2OAHackUCReleasebyCriibyy_[www.unknowncheats.me]_.dll','ArmA2OAHackUCReleasebyCriibyy.dll',
						'Mystic.sqf','debug_console','Xenos.exe','Xenos64.exe','hoen\sttart.sqf','hoen\compile\re.sqf',
						'freddiesexternalmenu\freddies_active.sqf','freddiesexternalmenuv8\freddies_active.sqf','Menu_Scripts\menu\menu_generate.sqf',
						'infiSTAR_[www.unknowncheats.me]_.dll','Missions\infiSTAR_[www.unknowncheats.me]_.dll','Deluxe_97\Deluxe.sqf',
						'Expansion\infiSTAR_[www.unknowncheats.me]_.dll','dll\infiSTAR_[www.unknowncheats.me]_.dll',
						'infiSTAR.dll','Missions\infiSTAR.dll','Expansion\infiSTAR.dll','dll\infiSTAR.dll',
						'VGLoader.exe','Missions\VGLoader.exe','Expansion\VGLoader.exe','dll\VGLoader.exe',
						'vgupdater.exe','Missions\vgupdater.exe','Expansion\vgupdater.exe','dll\vgupdater.exe',
						'0100100110\start.sqf','Missions\0100100110\start.sqf','Expansion\0100100110\start.sqf','dll\0100100110\start.sqf',
						'0100100110\Starts.sqf','Missions\0100100110\Starts.sqf','Expansion\0100100110\Starts.sqf','dll\0100100110\Starts.sqf',
						'epoch\epochMain.sqf','Missions\epoch\epochMain.sqf','Expansion\epoch\epochMain.sqf','dll\epoch\epochMain.sqf',
						'Hack-Dayz.exe','Missions\Hack-Dayz.exe','Expansion\Hack-Dayz.exe','dll\Hack-Dayz.exe','TM\keymenu.sqf',
						'DayZZ.exe','Missions\DayZZ.exe','Expansion\DayZZ.exe','dll\DayZZ.exe','OTHER\scripts\fly.sqf','TM\clearvar.sqf',
						'scrFuckOffInfistar1\start.sqf','epoch\targetall\fuckserver.sqf','boooooooobies.sqf','infiSTAR_GOLD\Startup.sqf',
						'settings26\init.sqf','settings26\start.sqf','settings26\load.sqf','settings26\go.sqf','Arma 2 OA Battleye Bypass.exe',
						'scroll\startmain.sqf','Exta_files\scrollMain.sqf','players\egeg.sqf','DCv3\dc.sqf','Supplys\giveloadout.sqf',
						'runme.dll','Missions\runme.dll','Expansion\runme.dll','dll\runme.dll','Scripts\runme.dll',
						'NR.exe','Missions\NR.exe','Expansion\NR.exe','dll\NR.exe','Scripts\NR.exe','wuat\start3.sqf',
						'activator_NR.exe','Missions\activator_NR.exe','Expansion\activator_NR.exe','dll\activator_NR.exe','Scripts\activator_NR.exe',
						'MedMen.exe','Missions\MedMen.exe','Expansion\MedMen.exe','dll\MedMen.exe','Scripts\MedMen.exe',
						'SpawnTool.exe','Missions\SpawnTool.exe','Expansion\SpawnTool.exe','dll\SpawnTool.exe','Scripts\SpawnTool.exe',
						'HVMRuntm.dll','Missions\HVMRuntm.dll','Expansion\HVMRuntm.dll','dll\HVMRuntm.dll','Scripts\HVMRuntm.dll',
						'D-DayZ.dll','Missions\D-DayZ.dll','Expansion\D-DayZ.dll','dll\D-DayZ.dll','Scripts\D-DayZ.dll',
						'ss3.dll','Missions\ss3.dll','Expansion\ss3.dll','dll\ss3.dll','Scripts\ss3.dll','epoch.sqf','epoch2.sqf','fixed.exe',
						'Scripts\darky.sqf','Scripts\explo.sqf','Scripts\explode_all.sqf','Scripts\explode.sqf','@Dayz_Namalsk\menu.sqf','@Dayz_Namalsk\HP.sqf',
						'Dayz_Namalsk\menu.sqf','Dayz_Namalsk\HP.sqf','youtube.dll','vg\Run.sqf','rus\mission_settings\create.sqf',
						'vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','vg\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf',
						'uhx_menu_first_ed\menu\logoblue.paa','Expansion\beta\dll\RayHook.dll','RayHook.dll','scr\Startup.sqf','scr\ahbypass.sqf',
						'cset.sqf','crawdaunt\crawdaunt.sqf','hangender\start.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf',
						'Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf',
						'wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf',
						'infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf',
						'Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf',
						'yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf',
						'Missions\Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf',
						'TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf',
						'battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf',
						'Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf',
						'YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','run.sqf','tm\starthack.sqf',
						'ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','sigdumper.dll','sigdumper.exe',
						'yolo\YoloMenu Updated v6.sqf','dll\Project1_[www.unknowncheats.me]_.exe','Scripts\Project1_[www.unknowncheats.me]_.exe',
						'gc_menu\uitvoeren.sqf','scr_wasteland\menu\initmenu.sqf','exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf',
						'infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf',
						'scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','invisible.sqf',
						'@mHlopchik\Menu_Scripts\menu\keybind\funmenu','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf',
						'Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf',
						'TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf',
						'DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf',
						'CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf',
						'Obama Drone 0.5.2.1.exe','NewDayZ.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf',
						'hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf',
						'VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe',
						'scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf',
						'@Hak_script\1.GLAVNOYE\000.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf',
						'ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe',
						'AimJunkies.exe','FABISDayZLauncher.exe','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','ChernoNuke.sqf',
						'Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf',
						'NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf',
						'ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf',
						'ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf',
						'God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf',
						'TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf',
						'Ubu5Ukg3.sqf','customizethis.sqf','Z__i_n_f_i_S_T_A_R__Z\Run.sqf','Missions\infiSTAR_SEVEN\startup.sqf',
						'Missions\infiSTAR_SSH\startup.sqf','renamethis.sqf','round2\runthis.sqf','safe scripts\gm.sqf','scr\exec.sqf',
						'Scripts\exec.sqf','scrollz\tp.sqf','ShadowyFaze\exec.sqf','infiSTAR_BLACK\Startup.sqf','lol.sqf','teststartup.sqf',
						'infiSTAR_NEW\Startup.sqf','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf','Custom_folder\scrollmenu\Click to Tp.sqf',
						'Aspire Menu v.0.5\ALL TEH SCRIPTS!\esp.sqf','Aspire Menu v.0.5\ALL TEH SCRIPTS!\heal.sqf','SpawnTool.exe','LoganNZL\LoganNZL@execute.sqf',
						'LoganNZL\LoganNZL@start.sqf','LoganNZL@start.sqf','nightsuck.sqf','Project1_[www.unknowncheats.me]_.exe','wuat\RUN.sqf',
						'Missions\Project1_[www.unknowncheats.me]_.exe','Expansion\Project1_[www.unknowncheats.me]_.exe','wuat\Scripts.txt','wuat\start1.sqf',
						'GiveItTheDLL.exe','Missions\GiveItTheDLL.exe','Expansion\GiveItTheDLL.exe','dll\GiveItTheDLL.exe','Scripts\GiveItTheDLL.exe',
						'spawner.dll','Missions\spawner.dll','Expansion\spawner.dll','dll\spawner.dll','Scripts\spawner.dll','wuat\scripts\runMagicaly.sqf',
						'inject.bat','Missions\inject.bat','Expansion\inject.bat','dll\inject.bat','Scripts\inject.bat','wuat\screen2.sqf','wuat\standalonemenu.sqf',
						'spawner\GiveItTheDLL.exe','spawner\Missions\GiveItTheDLL.exe','spawner\Expansion\GiveItTheDLL.exe','spawner\dll\GiveItTheDLL.exe','spawner\Scripts\GiveItTheDLL.exe',
						'spawner\spawner.dll','spawner\Missions\spawner.dll','spawner\Expansion\spawner.dll','spawner\dll\spawner.dll','spawner\Scripts\spawner.dll',
						'spawner\inject.bat','spawner\Missions\inject.bat','spawner\Expansion\inject.bat','spawner\dll\inject.bat','spawner\Scripts\inject.bat',
						'infiSTAR_SSH\setup\startup.sqf','Supplys\BBstart.sqf','TM\666.sqf','vscripts\Startup.sqf','Ronnie\Startup.sqf','MyScripts\cargo.sqf',
						'BE\update.sqf','ScriptBasic.sqf','ScriptTelePlayer.sqf','Deluxe.sqf','Moving_Gun_Menu\start.sqf',
						'WRMoney.sqf','allover_[www.unknowncheats.me]_.dll','allover.dll','WhippyMenu\keybindfz.sqf','WhippyMenu\SqfFiles\esp.sqf',
						'WhippyMenu\SqfFiles\destroyb.sqf','WhippyMenu\SqfFiles\setviewdistance500m.sqf','WhippyMenu\SqfFiles\night.sqf','WhippyMenu\SqfFiles\unlock.sqf',
						'initFunctions.sqf','tbb4malloc_bi.dll','PRaZ\start.sqf','jh\Action.sqf','ArmA2OA_Extars\BB_menu_BB.sqf',
						'ArmA2OA_Extras\ben_ex.sqf'
					]+_m+_sa;
					while{1 == 1}do
					{
						_c = 0;
						{
							_c = _c + 1;
							if(_c >= 10)then
							{
								_c = 0;
								uiSleep 0.5;
							};
							_f = preprocessFileLineNumbers _x;
							if(_f != '')then
							{
								[] spawn "+_randvar2+";
								_log = format['BadFile: %1 - %2',_x,_f];
								[_name,getPlayerUID player,'BAN',toArray (_log)] call "+_randvar242737+";
							};
							uiSleep 0.01;
							true
						} count _farray;
						uiSleep 600;
					};
				};
			};
		};
		"+_randvar4+" = {
			_bkey = _this select 0;
			
			_log = format['<infiSTAR.de>: You have pressed a forbidden Key! (%1)',_bkey];
			cutText [_log,'WHITE IN'];
			hint _log;
			systemchat _log;
			if("+str _PBK+")then{for '_start' from 0 to 5 do {disableUserInput true;};};
			if("+str _LBK+")then
			{
				_log = format['BadKey: %1',_bkey];
				_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
				[_name,getPlayerUID player,'SLOG_BK',toArray (_log)] call "+_randvar242737+";
			};
			if("+str _PBK+")then{uiSleep 3;for '_stop' from 0 to 5 do {disableUserInput false;};};
		};
		"; if(_UIM)then{ _AHstring = _AHstring + "
			"+_randvar6+" = {
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				_alt = _this select 4;
				_handled = false;
				if(_key == "+str _ODK+")exitWith{[] spawn fnc_debugX0;_handled=true;true};
				_handled
			};
		"; }else{; _AHstring = _AHstring + "
			"+_randvar6+" = {
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				_alt = _this select 4;
				_handled = false;
				
				_fnc_punish_combatlog = {
					_isInCombat = player getVariable['startcombattimer',0];
					if(str _isInCombat != '0')then
					{
						[player,'sick'] spawn player_death;
						player setHit['Body',1];
					};
				};
				
				if(_key == "+str _ODK+")exitWith{[] spawn fnc_debugX0;_handled=true;true};
				"; if(_RCK)then{ _AHstring = _AHstring + "
					if(_key == "+str _OpenMenuKey+")exitWith{['AdminMenu Key'] spawn "+_randvar4+";_handled=true;true};
					if(_key == 0xC7)exitWith{['Home - Known to start HackMenus'] spawn "+_randvar4+";_handled=true;true};
					if(_key == 0x3B)exitWith{['F1 - Known to start HackMenus'] spawn "+_randvar4+";_handled=true;true};
					if(_key == 0x3C)exitWith{['F2 - Known to start HackMenus'] spawn "+_randvar4+";_handled=true;true};
					if(_key == 0x3D)exitWith{['F3 - Known to start HackMenus'] spawn "+_randvar4+";_handled=true;true};
					if(_shift)then
					{
						if(_key == 0x19)exitWith{['Shift + P to CombatLog'] spawn "+_randvar4+";call _fnc_punish_combatlog;_handled=true;true};
					};
					if(_alt)then
					{
						if(_key == 0x57)exitWith{['ALT-F11'] spawn "+_randvar4+";};
						if(_key == 0x3E)exitWith{['ALT-F4 to CombatLog'] spawn "+_randvar4+";call _fnc_punish_combatlog;_handled=true;true};
					};
				"; }; _AHstring = _AHstring + "
				_handled
			};
			if("+str _VON+")then
			{
				[] spawn {
					_voicecount = 0;
					while{1 == 1}do
					{
						if(!isNull findDisplay 63)then
						{
							_ctrlText = ctrlText (findDisplay 63 displayCtrl 101);
							_chID = switch _ctrlText do {
								case localize 'STR_GLOBAL_CHANNEL' : {0};
								case localize 'STR_SIDE_CHANNEL' : {1};
								default {['',-1]};
							};
							if((!isNull findDisplay 55) && (_chID in [0,1]))then
							{
								_msg = '<infiSTAR.de>: NO VOICE ON SIDE/GLOBAL!';
								hint _msg;
								1 cutText [format ['%1',_msg],'PLAIN DOWN'];
								systemchat _msg;
								
								_voicecount = _voicecount + 1;
								if(_voicecount > 3)then
								{
									_log = format['Voice over Side Chat (KILLED) @%1',mapGridPosition player];
									[name player,getPlayerUID player,'SLOG',toArray (_log)] call "+_randvar242737+";
									uiSleep 3;
									findDisplay 46 closeDisplay 0;
								};
							};
						};
						uiSleep 0.5;
					};
				};
			};
		"; }; _AHstring = _AHstring + "
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			_FTG = "+str _FTG+";
			while{1 == 1}do
			{
				_ltxt = lbtext [12001,0];
				if(!isNil 'TraderItemList')then
				{
					if(typeName TraderItemList == 'CODE')then
					{
						[] spawn "+_randvar2+";
						_log = format['Active Menu:   Trader Menu - not near a Trader! #1 - %1 @%2',_ltxt,getPosATL player];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				};
				
				_cwep = currentWeapon player;
				if(_cwep != '')then
				{
					_cammo = player ammo _cwep;
					if(abs _cammo > 100000)then
					{
						[] spawn "+_randvar2+";
						_log = format['AmmoCheck: %1',_cammo];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				};
				if("+str _URC+")then
				{
					if(str(unitRecoilCoefficient player) != str(1))then
					{
						[] spawn "+_randvar2+";
						[_name,_puid,'BAN',toArray ('NoRecoil')] call "+_randvar242737+";
					};
					vehicle player setUnitRecoilCoefficient 1;
					player setUnitRecoilCoefficient 1;
				};
				setTerrainGrid _FTG;
				BIS_fnc_spawnCrew = {};
				BIS_fnc_spawnGroup = {};
				BIS_fnc_help = {};
				bis_fnc_3Dcredits = {};
				BIS_fnc_crows = {};
				bis_fnc_customGPS = {};
				bis_fnc_destroyCity = {};
				BIS_fnc_dirIndicator = {};
				bis_fnc_spawnvehicle = {};
				BIS_fnc_spawnEnemy = {};
				BIS_fnc_AAN = {};
				bis_fnc_taskPatrol = {};
				bis_fnc_taskDefend = {};
				BIS_fnc_taskAttack = {};
				BIS_fnc_supplydrop = {};
				BIS_fnc_spotter = {};
				BIS_fnc_listPlayers = {};
				bis_fnc_customGPSvideo = {};
				if(isNil 'deathHandled')then{ deathHandled = true; } else { if(typeName deathHandled != 'BOOL')then{ deathHandled = true;YOLO = true; }; };
				if(deathHandled)then
				{
					[] spawn {
						uiSleep 35;
						player setVariable['combattimeout',0, true];
						(findDisplay 46) closeDisplay 0;
					};
				};
				if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
				_r_player_blood = r_player_blood;
				if(_r_player_blood > 12750)then
				{
					if(_r_player_blood > 14500)then
					{
						r_player_blood = -500;
						[] spawn "+_randvar2+";
						
						_log = format['To much Blood: %1 should be max 12000',_r_player_blood];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					}
					else
					{
						r_player_blood = 12000;
						_log = format['To much Blood: %1 should be max 12000',_r_player_blood];
						[_name,_puid,'SLOG',toArray (_log)] call "+_randvar242737+";
					};
				};
				if((deathHandled) && (r_player_blood > 0))then
				{
					r_player_blood = -500;
					uiSleep 1;
					if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
					if(r_player_blood > 0)then
					{
						if(alive player)then
						{
							if(isNil 'LASTDAMAGESOURCE')then{LASTDAMAGESOURCE = player;} else {if(isNull LASTDAMAGESOURCE)then{LASTDAMAGESOURCE = player;};};
							[LASTDAMAGESOURCE,'shotheavy'] spawn player_death;
							player setHit['Body',1];
						};
						[] spawn "+_randvar2+";
						[_name,_puid,'HLOG_SKICK',toArray ('Godmode')] call "+_randvar242737+";
					};
				};
				if(isNil 'r_player_blood')then{ r_player_blood = -500; } else { if(typeName r_player_blood != 'SCALAR')then{ r_player_blood = -500;YOLO = true; }; };
				if((!deathHandled) && (r_player_blood < 0))then
				{
					if(alive player)then
					{
						if(isNil 'LASTDAMAGESOURCE')then{LASTDAMAGESOURCE = player;} else {if(isNull LASTDAMAGESOURCE)then{LASTDAMAGESOURCE = player;};};
						[LASTDAMAGESOURCE,'shotheavy'] spawn player_death;
						player setHit['Body',1];
					};
					player setHit['Body',1];
				};
				uiSleep 0.5;
				_con = vehicle cameraOn;
				_veh = vehicle player;
				if(str _con != str _veh)then
				{
					if(typeName _con == 'OBJECT')then
					{
						if(str(_con) != '<NULL-object>')then
						{
							if(!isNull _con)then
							{
								if((_veh distance "+str _mPos+" > 250) && (_con distance "+str _mPos+" > 250) && (_con distance _veh > 150))then
								{
									if(str(vehicle cameraOn) != str(vehicle player))then
									{
										[] spawn "+_randvar2+";
										_log = format['BadCamera: (%1) should be (%2), distance: %3m',_con,_veh,_con distance _veh];
										[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
									};
								};
							};
						};
					};
				};
			};
		};
		if("+str _UIC+")then
		{
			[_puid,_name] spawn {
				_puid = _this select 0;_name = _this select 1;
				while{1 == 1}do
				{
					uiSleep 3;
					_posP = getPos player;
					{
						if((!isNull _x)&&{alive _x})then
						{
							if(str _x != str player)then
							{
								_type = typeOf _x;
								_parachuteWest = ((_type == 'ParachuteWest') || (_type == 'ParachuteC'));
								if(!_parachuteWest)then
								{
									_xID = _x getVariable['ObjectID','-3'];
									_xUID = _x getVariable['ObjectUID','-3'];
									if(_xID == '-3' && _xUID == '-3')then
									{
										_checkedTime = _x getVariable['ObjectIDCT',-1];
										if(_checkedTime == -1)then
										{
											_x setVariable['ObjectIDCT',diag_tickTime];
										}
										else
										{
											if(diag_tickTime - _checkedTime > 30)then
											{
												_pos = getPos _x;
												_mgp = mapGridPosition _pos;
												_x setDamage 5;
												
												_log = format['Vehicle with Invalid ID: %1 @%2 (waited 30 seconds..)',_type,_mgp];
												[_name,_puid,'HLOG',toArray (_log)] call "+_randvar242737+";
											};
										};
									};
								};
							};
						};
					} forEach ([vehicle player]+(_posP nearEntities [['LandVehicle','Air','Ship'],25]));
				};
			};
		};
		if("+str _URG+")then
		{
			[_name,_puid] spawn {
				_name = _this select 0;_puid = _this select 1;
				private ['_fuelpumparray','_fueltruckarray','_fuelsources'];
				_antirefuel = true;
				_anticargod = true;
				_cheatref = 0;
				_cheatrep = 0;
				_impparts = ['HitLFWheel','HitLBWheel','HitRFWheel','HitRBWheel','HitEngine'];
				_fuelpumparray =
				[
					'FuelPump_DZ','Land_A_FuelStation_Feed','Land_Ind_FuelStation_Feed_EP1','Land_FuelStation_Feed_PMC','FuelStation',
					'Land_ibr_FuelStation_Feed','Land_fuelstation_army','Land_fuelstation','land_fuelstation_w','Land_benzina_schnell'
				];
				if(!isNil 'dayz_fuelpumparray')then
				{
					if(typeName dayz_fuelpumparray == 'ARRAY')then
					{
						_fuelpumparray = _fuelpumparray + dayz_fuelpumparray;
					};
				};
				_fueltruckarray =
				[
					'KamazRefuel_DZ','UralRefuel_TK_EP1_DZ','MtvrRefuel_DES_EP1_DZ','V3S_Refuel_TK_GUE_EP1_DZ','MtvrRefuel_DZ',
					'KamazRefuel_DZE','UralRefuel_TK_EP1_DZE','MtvrRefuel_DES_EP1_DZE','V3S_Refuel_TK_GUE_EP1_DZE','MtvrRefuel_DZE'
				];
				if(!isNil 'DZE_fueltruckarray')then
				{
					if(typeName DZE_fueltruckarray == 'ARRAY')then
					{
						_fueltruckarray = _fueltruckarray + DZE_fueltruckarray;
					};
				};
				_fuelsources =
				[
					'Land_Ind_TankSmall','Land_fuel_tank_big','Land_fuel_tank_stairs','Land_fuel_tank_stairs_ep1',
					'Land_wagon_tanker','Land_fuelstation','Land_fuelstation_army','land_fuelstation_w','Land_benzina_schnell'
				];
				if(!isNil 'dayz_fuelsources')then
				{
					if(typeName dayz_fuelsources == 'ARRAY')then
					{
						_fuelsources = _fuelsources + dayz_fuelsources;
					};
				};
				vehicle_getHitpoints = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf';
				_getHitpoints = vehicle_getHitpoints;
				object_getHit = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_getHit.sqf';
				_getHit = object_getHit;
				while{1 == 1}do
				{
					_vehold = vehicle player;
					if((_vehold != player) && (player == driver _vehold) && ((typeOf _vehold) != 'Tractor'))then
					{
						_oldpos = getPosATL _vehold;
						_oldfuel = fuel _vehold;
						_oldtime = time;
						_damold = false;
						_hitp = _vehold call _getHitpoints;
						{
							_damage = [_vehold,_x] call _getHit;
							if((_x in _impparts) && (_damage == 1))exitWith 
							{
								_damold = true;
							};
						} forEach _hitp;
						uiSleep 3;
						_vehnew = vehicle player;
						if((_vehnew == _vehold) && (player == driver _vehnew))then
						{
							_newpos = getPosATL _vehnew;
							_newfuel = fuel _vehnew;
							_newtime = time;
							if((_newfuel > _oldfuel) || (_damold))then
							{
								_distance = [_oldpos select 0,_oldpos select 1,0] distance [_newpos select 0,_newpos select 1,0];
								_difftime = _newtime - _oldtime;
								_speed = (_distance / _difftime)*3.6;
								_typeveh = typeOf _vehnew;
								_topSpeed = getNumber (configFile >> 'CfgVehicles' >> _typeveh >> 'maxSpeed');
								_nearSpeed = 30*(_topSpeed/100);
								if(_speed > _nearSpeed)then
								{
									_adm = false;
									_ppls = crew _vehnew;
									_nameppls = [];
									{
										_uid = getPlayerUID _x;
										if(_uid != '')then
										{
											if(_x != player)then{
												_namexx = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_namexx = name _x;};
												_nameppls = _nameppls + [[_namexx,_uid]];
											};
										};
									} forEach _ppls;
									if(!_adm)then
									{
										if((_damold) && (_anticargod))then
										{
											_dampart = [];
											_damnew = false;
											{
												_damage = [_vehnew,_x] call _getHit;
												if((_x in _impparts) && (_damage == 1))then 
												{
													_dampart = _dampart + [[_x,_damage]];
													_damnew = true;
												};
											} forEach _hitp;
											if(_damnew)then{_cheatrep = _cheatrep + 1;};
											if(_cheatrep > 2)then
											{
												_cheatrep = 0;
												[_vehnew] spawn {
													_vehnew = _this select 0;
													
													vehicle_getHitpoints = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf';
													_getHitpoints = vehicle_getHitpoints;
													_hitp = _vehnew call _getHitpoints;
													_selections = [];
													{
														_selections = _selections + [getText (configFile >> 'CfgVehicles' >> (typeOf _vehnew) >> 'HitPoints' >> _x >> 'name')];
													} forEach _hitp;
													while{1 == 1}do
													{
														{
															_strH = 'hit_' + (_x);
															_dam = _vehnew getvariable[_strH,0];
															if(_dam != 0)then{_vehnew setHit [_x,_dam];};
														} forEach _selections;
														if((_vehnew == player) || (player != driver _vehnew))exitWith {};
														uiSleep 0.005;
													};
												};
												_log = format['%1 DRIVING %2 WITH CHEAT REPAIRING | speed: %4km/h | damage: %3 | position: %5 (%6) | players in vehicle: %7',_name,_typeveh,_dampart,round _speed,_newpos,mapGridPosition _newpos,_nameppls];
												[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
												[] spawn "+_randvar2+";
											};
										};
										if((_newfuel > _oldfuel) && (_antirefuel))then
										{
											_fsources = _fuelpumparray + _fuelsources;
											_listfuel = (nearestObjects [_posnew, _fsources, 100]) + (nearestObjects [_posold, _fsources, 100]);
											_listveh = ((_posnew nearEntities [['Landvehicle'], 100]) + (_posold nearEntities [['Landvehicle'], 100]));
											_fveh = false;
											{
												if((typeOf _x) in _fueltruckarray)exitWith {_fveh = true;};
											} forEach _listveh;
											
											if(!_fveh && ((count _listfuel) == 0))then{_cheatref = _cheatref + 1;};
											if(_cheatref > 2)then 
											{
												_cheatref = 0;
												_vehnew setVelocity [0,0,0];
												{_x action ['eject',_vehnew];} forEach (crew _vehnew);
												deleteVehicle _vehnew;
												_log = format['AUTO REFUEL %10 IN MOVEMENT (x3) | speed: %2km/h | old position: %3 (%4) - new position: %5 (%6) | old fuel: %7 - new fuel: %8 | players in vehicle: %9',_name,round _speed,_oldpos,mapGridPosition _oldpos,_newpos,mapGridPosition _newpos,_oldfuel,_newfuel,_nameppls,_typeveh];
												[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
												[] spawn "+_randvar2+";
											};
										};
									};
								};
							};
						};
					}
					else
					{
						uiSleep 3;
					};
				};
			};
		}
		else
		{
			[] spawn {
				vehicle_getHitpoints = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\vehicle_getHitpoints.sqf';
				_getHitpoints = vehicle_getHitpoints;
				while{1 == 1}do
				{
					_veh = vehicle player;
					if((_veh != player) && (player == driver _veh))then
					{
						_hitp = _veh call _getHitpoints;
						_selections = [];
						{
							_selections = _selections + [getText (configFile >> 'CfgVehicles' >> (typeOf _veh) >> 'HitPoints' >> _x >> 'name')];
						} forEach _hitp;
						while{1 == 1}do
						{
							{
								_strH = 'hit_' + (_x);
								_dam = _veh getvariable[_strH,0];
								if(_dam != 0)then{_veh setHit [_x,_dam];};
							} forEach _selections;
							if((_veh == player) || (player != driver _veh))exitWith {};
							uiSleep 0.005;
						};
					};
					uiSleep 2;
				};
			};
		};
	};
	[_name,_puid] spawn {
		disableSerialization;
		_name = _this select 0;_puid = _this select 1;
		_idcount = 0;
		_startTime = time;
		_fnc_inString = {
			private ['_needle','_haystack','_needleLen','_hay','_found'];
			_needle = _this select 0;
			if(isNil'_needle')exitWith{};
			if(typeName _needle != 'STRING')exitWith{};
			if(_needle == '')exitWith{};
			_needle = toLower _needle;
			
			_haystack = _this select 1;
			if(isNil'_haystack')exitWith{};
			if(typeName _haystack != 'STRING')exitWith{};
			if(_haystack == '')exitWith{};
			_haystack = toLower _haystack;
			_haystack = toArray _haystack;
			
			
			_needleLen = count toArray _needle;
			_hay = +_haystack;
			_hay resize _needleLen;
			_found = false;
			for '_i' from _needleLen to count _haystack do {
				if(toString _hay == _needle)exitWith {_found = true};
				_hay set [_needleLen, _haystack select _i];
				_hay set [0, 'x'];
				_hay = _hay - ['x']
			};
			_found
		};
		_veryBadTexts =
		[
			'/item','/gunbox','/run','/backpack','/morph','/start','/exec','/menu','/skin','/ban','adminstart','admin_start','.ban','.sqf','bbhelp','bbammo','bbbox','bbdel','bbesp','bbgod','bbtp','bbunlock',
			'/pesp','/pmarkers','/ptp','/pdel','/pammo','/pnuke','/pgunbox','/pepochbox','/pteleportall','/pgod','t3l3all','n00k3','t3p3','4mm0','3sp','j3sus','v3hj3sus','m4rk3rs','z3dz','inf4mm0','b0mb4ll','bombtrgt',
			'/troll','/troll funces','/trollf','/trollfu','/trollfun','/trollfunk','/trollfunks','/troll funks','/trollf','/trollfuc','/trollfuck','/trollfucku','/trollfuckup','/spawn100','iRap3','iRap3bt','iRap3eX','iRap3mrK',
			'iRap35P','iRap37A','iRap3d3l','/bot','/tp','/2ndtp','/playermarker','/safemarkers','/fini','/finikillall','/banall','/givecoins','/itemspawn','/itemmassspawn','/vehspawn','/finitpall','/finiinfistar',
			'/finiactivatere','/kickall','/finialldance','/god'
		];
		while{1 == 1}do
		{
			if(!isNil 'dayzPlayerLogin')then
			{
				if(typeName dayzPlayerLogin != 'ARRAY')then
				{
					[] spawn "+_randvar2+";
					_log = format['PlayerLogin: %1 != ARRAY      %2',typeName dayzPlayerLogin,time];
					[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
				};
			};
			if(isNil 'dayz_characterID')then
			{
				[] spawn "+_randvar2+";
				[_name,_puid,'HLOG_SKICK',toArray ('CharacterID is NIL')] call "+_randvar242737+";
			}
			else
			{
				if(typeName dayz_characterID != 'STRING')then
				{
					[] spawn "+_randvar2+";
					_log = format['typeName CharacterID is   %1 != STRING      %2',typeName dayz_characterID,time];
					[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
				};
			};
			uiSleep 0.2;
			if !("+str _UIM+")then
			{
				_display = findDisplay 24;
				if(isNull _display)then
				{
					uiSleep 0.3;
				}
				else
				{
					_chat = _display displayCtrl 101;
					_txt = ctrlText _chat;
					if(_txt != '')then
					{
						_txtArray = toArray _txt;
						if((_txtArray select 0) in [44,36,37,38,92,124,194,176,45,95,60,62])then{_chat ctrlSetText '';};
						_txt = toLower _txt;
						if("+str _UCF+")then
						{
							if(_txt in ['/scream','scream'])then
							{
								(_display) closeDisplay 0;
								_sound = ['z_scream_3','z_scream_4'] call BIS_fnc_selectRandom;
								[nil,player,rSAY,[_sound,250]] call RE;
								[player,500,true,(getPosATL player)] spawn player_alertZombies;
							};
							if(isNil 'canbuild')then{ canbuild = true; } else { if(typeName canbuild != 'BOOL')then{ canbuild = true;YOLO = true; }; };
							if(vehicle player == player)then
							{
								if((count (nearestObjects [player, ['Plastic_Pole_EP1_DZ'],65]) == 0) && (canbuild))then
								{
									if(_txt in ['stop','/stop'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rswitchMove,''] call RE;
										player playActionNow 'stop';
									};
									if(_txt in ['pushup','/pushup'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exercisePushup'] call RE;
									};
									if(_txt in ['handstand','/handstand'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou'] call RE;
									};
									if(_txt in ['boxing','/boxing'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle68boxing'] call RE;
									};
									if(_txt in ['karate','/karate','fighter','/fighter'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_exerciseKata'] call RE;
									};
									if(_txt in ['boogie','/boogie'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoIvan'] call RE;
									};                             
									if(_txt in ['dance','/dance'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingStefan'] call RE;
									};
									if(_txt in ['clubbing','/clubbing'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'ActsPercMstpSnonWnonDnon_DancingDuoStefan'] call RE;
									};
									if(_txt in ['excercise','/excercise'])then
									{
										(_display) closeDisplay 0;
										[objNull, player, rplayMove,'AmovPercMstpSnonWnonDnon_idle69drepy'] call RE;
									};
								};
							};
							if(_txt in ['/killme','killme','/suicide','suicide'])then
							{
								_waitTime = 180;
								if(time > _startTime + _waitTime)then
								{
									_chat ctrlSetText 'GOOD BYE CRUEL WORLD';
									[player,'sick'] spawn player_death;
									player setHit['Body',1];
									_startTime = time;
								}
								else
								{
									_chat ctrlSetText format['You have to wait %1s',ceil((_startTime + _waitTime) - time)];
								};
							};
							if(_txt in ['/cry','cry','!cry'])then
							{
								(_display) closeDisplay 0;
								[nil,player,rSAY,['babycry_1', 100]] call RE;
							};
						};
						if("+str _UDN+")then
						{
							if(_txt in ['!vote day','/vote day','vote day','!day','/day'])then
							{
								(_display) closeDisplay 0;
								[player,'DAY'] call "+_randvar242737+";
							};
							if(_txt in ['!vote night','/vote night','vote night','!night','/night'])then
							{
								(_display) closeDisplay 0;
								[player,'NIGHT'] call "+_randvar242737+";
							};
						};
						if(_txt in ['!help','/help','help'])then
						{
							(_display) closeDisplay 0;
							systemChat 'infiSTAR.de ChatCommands:';
							systemChat '/stop, stop, /pushup, pushup, /handstand, handstand, /boxing, boxing,';
							systemChat '/karate, karate, /fighter, fighter, /boogie, boogie,';
							systemChat '/dance, dance, /clubbing, clubbing, /excercise, excercise,';
							if("+str _UDN+")then{systemChat '!vote day,/vote day, vote day,!vote night,/vote night, vote night';};
							systemChat '/killme, killme, /suicide, suicide';
							systemChat '/cry, cry, !cry';
						};
						if(_txt in _veryBadTexts)then
						{
							(_display) closeDisplay 0;
							_log = format['BadText: %1',_txt];
							[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
							(findDisplay 46)closeDisplay 0;
						}
						else
						{
							{
								_found = [_x,_txt] call _fnc_inString;
								if(_found)exitWith
								{
									(_display) closeDisplay 0;
									_log = format['BadText: %1',_txt];
									[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
									(findDisplay 46)closeDisplay 0;
								};
							} forEach _veryBadTexts;
						};
						if(_txt in ['/m'])then
						{
							[] spawn {
								for '_i' from 0 to 10 do
								{
									closeDialog 0;closeDialog 0;closeDialog 0;
									uiSleep 0.2;
								};
							};
							(_display) closeDisplay 0;
							_log = format['BadText: %1',_txt];
							[_name,_puid,'HLOG',toArray (_log)] call "+_randvar242737+";
						};
						if!(_puid in "+str _allAdmins+")then
						{
							_shorterArray = _txtArray;
							_shorterArray resize 6;
							_shorterTxt = toString _shorterArray;
							_shorterTxt = toLower _shorterTxt;
							if(_shorterTxt in ['/telea','/item ','/esp','/spawn','/troll'])then
							{
								_log = format['BadText: %1',_txt];
								[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
							};
							
							if(_txt in [format['.ban %1',toLower _name],format['.ban %1 true',toLower _name],format['.ban %1 true;',toLower _name]])then
							{
								_log = format['BadText: %1',_txt];
								[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
							};
							if(_txt in ['adminstart','admin_start'])then
							{
								_log = format['BadText: %1',_txt];
								[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
							};
						};
					};
				};
				if(!isNil 'r_player_unconscious')then
				{
					if(typeName r_player_unconscious != 'BOOL')then{r_player_unconscious = false;};
					if(isNil 'deathHandled')then{ deathHandled = true; } else { if(typeName deathHandled != 'BOOL')then{ deathHandled = true;YOLO = true; }; };
					
					_obj = player;
					if(isNil 'inSafeZone')then{ inSafeZone = false; } else { if(typeName inSafeZone != 'BOOL')then{ inSafeZone = false;YOLO = true; }; };
					if(inSafeZone)then
					{
						if(r_player_unconscious)then
						{
							player setVariable ['NORRN_unconscious',false,true];
							player setVariable ['unconsciousTime',0,true];
							player setVariable ['USEC_isCardiac',false,true];
							r_player_unconscious = false;
							r_player_cardiac = false;
							r_player_handler1 = false;
							disableUserInput false;
							if(vehicle player == player)then{
								[objNull,player,rSwitchMove,'AinjPpneMstpSnonWnonDnon'] call RE;
								player switchMove 'AinjPpneMstpSnonWnonDnon';
								player playMoveNow 'AmovPpneMstpSnonWnonDnon_healed';
							};
						};
					};
					if((r_player_unconscious) && (!deathHandled))then
					{
						if(_obj getVariable['infiUnconDone','0'] == '0')then
						{
							_obj setVariable['infiUnconDone','1'];
							[] spawn {
								endLoadingScreen;
								_mytime = 0;
								if(!isNull player)then{_mytime = player getVariable['unconsciousTime',0];};
								if(_mytime == 0)then{_mytime = 30;};
								_steps = 1 / _mytime;	
								for '_i' from 0 to _mytime do
								{
									_txt = format['infiSTAR.de unconscious: %1s',_mytime - _i];
									startLoadingScreen [_txt,'DayZ_loadingScreen'];
									progressLoadingScreen (_steps*_i);
									uiSleep 1;
									if(isNil 'r_player_unconscious')then{ r_player_unconscious = true; } else { if(typeName r_player_unconscious != 'BOOL')then{ r_player_unconscious = true;YOLO = true; }; };
									if(!r_player_unconscious)exitWith {endLoadingScreen;};
									if(isNil 'deathHandled')then{ deathHandled = true; } else { if(typeName deathHandled != 'BOOL')then{ deathHandled = true;YOLO = true; }; };
									if(deathHandled)exitWith {endLoadingScreen;};
								};
								endLoadingScreen;
							};
						};
						(findDisplay 24) closeDisplay 0;
					}
					else
					{
						if(_obj getVariable['infiUnconDone','-1'] == '1')then
						{
							_obj setVariable['infiUnconDone','0'];comment '2427';
						};
					};
				};
			};
		};
	};
	if !("+str _UIM+")then
	{
		[_name,_puid] spawn {
			_name = _this select 0;_puid = _this select 1;
			_colorTXT = "+str _EscColor+";
			_btnTitle0TXT = "+str _TopOfESC+";
			_btnTitle1TXT = "+str _LowerTop+";
			_btnTitle2TXT = "+str _LowerBottom+";
			disableSerialization;
			_startTime = time;
			while{1 == 1}do
			{
				waitUntil {uiSleep 0.1;!isNull findDisplay 49};
				_display = findDisplay 49;
				if(!isNull _display)then
				{
					_btnSave = _display displayCtrl 103;
					_btnSave ctrlShow true;
					_btnSave ctrlEnable false;
					_btnSave ctrlSetScale 0.8;
					_btnSave ctrlSetText 'PlayerUID (SteamID):';
					_btnSave ctrlCommit 0;
					
					_btnRestart = _display displayCtrl 119;
					_btnRestart ctrlShow true;
					_btnRestart ctrlEnable false;
					_btnRestart ctrlSetScale 0.9;
					_btnRestart ctrlSetText (format['%1',getPlayerUID player]);
					_btnRestart ctrlCommit 0;
					
					_btnRespawn = _display displayCtrl 1010;
					_btnRespawn ctrlShow true;
					_btnRespawn ctrlSetScale 0.9;
					if((canStand player) || (deathHandled))then
					{
						_btnRespawn ctrlEnable false;
						_btnRespawn ctrlSetText 'by infiSTAR.de';
					}
					else
					{
						_waitTime = 180;
						_btnRespawn ctrlEnable false;
						_btnRespawn ctrlSetText format['wait %1s',round((_startTime + _waitTime) - time)];
						if(time > _startTime + _waitTime)then
						{
							_btnRespawn ctrlEnable true;
							_btnRespawn ctrlSetText 'Respawn';
							_startTime = time;
						};
					};
					_btnRespawn buttonSetAction '
						[player,''btnRespawn''] spawn player_death;
						player setHit[''Body'',1];
					';
					_btnRespawn ctrlCommit 0;
					
					_btnTitle0 = _display displayCtrl 523;
					_btnTitle0 ctrlSetText _btnTitle0TXT;
					_btnTitle0 ctrlSetTextColor _colorTXT;
					_btnTitle0 ctrlSetScale 0.9;
					_btnTitle0 ctrlCommit 0;
					
					_btnTitle1 = _display displayCtrl 121;
					_btnTitle1 ctrlSetText _btnTitle1TXT;
					_btnTitle1 ctrlSetTextColor _colorTXT;
					_btnTitle1 ctrlSetScale 0.9;
					_btnTitle1 ctrlCommit 0;
					
					_btnTitle2 = _display displayCtrl 120;
					_btnTitle2 ctrlSetText _btnTitle2TXT;
					_btnTitle2 ctrlSetTextColor _colorTXT;
					_btnTitle2 ctrlSetScale 0.9;
					_btnTitle2 ctrlCommit 0;
				};
			};
		};
	};
	[] spawn {
		_RE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
		_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
		_puid = getPlayerUID player;
		BIS_MPF_remoteExecutionServer = "+str _BIS_MPF_RES+";
		_iMPF_remoteExecutionServer = "+str _BIS_MPF_RES+";
		iMPF_remoteExecutionServer = "+str _BIS_MPF_RES+";
		_oplayer_lockVault = {};_oplayer_unlockDoor = {};
		_epoch = false;if(!isNil 'DZE_Q')then{_epoch = true;_oplayer_lockVault = player_lockVault;_oplayer_unlockDoor = player_unlockDoor;};
		remExFieldTEST = [];
		while{1 == 1}do
		{
			RE = _RE;
			if("+str _TCT+")then
			{
				if(!isNil 'remExField')then
				{
					if(typeName remExField == 'ARRAY')then
					{
						if(str remExFieldTEST != str remExField)then
						{
							if(count remExField > 3)then
							{
								_atwo = remExField select 2;
								if(!isNil '_atwo')then
								{
									if(_atwo in ['titleText','cutText'])then
									{
										_athree = remExField select 3;
										if(!isNil '_athree')then
										{
											[] spawn "+_randvar2+";
											_log = format['remExField TitleText: %1',_athree];
											[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
										};
									};
								};
							};
						};
					};
				};
			};
			"; if(_LEM)then{ _AHstring = _AHstring + "
				'PVDZE_maintainArea' addPublicVariableEventHandler
				{
					private['_input','_player','_targetObj'];
					_input = (_this select 1);
					_player = _input select 0;
					_targetObj = _input select 2;
					
					_log = format['%1(%2) maintained %3 @%4',name _player,getPlayerUID _player,typeOf _targetObj,mapGridPosition _targetObj];
					'ARMA_LOG' callExtension format['A2_MAINTAIN:%1%2',_log,DAYZ_INSTANCE_LOGGING];
					diag_log (LOGGEDTIME+_log);
					
					_input spawn server_maintainArea
				};
			"; }; _AHstring = _AHstring + "
			'remExField' addPublicVariableEventHandler
			{
				remExFieldTEST = remExField;
				_this call iMPF_remoteExecutionServer;
			};
			'remExFP' addPublicVariableEventHandler {_this call iMPF_remoteExecutionServer;diag_log _this;};
			if(isNil 's_player_deleteBuild')then{s_player_deleteBuild = -1;};
			if(s_player_deleteBuild == 1)then
			{
				_obj = cursorTarget;
				if(!isNull _obj)then
				{
					if(typeOf _obj == 'Plastic_Pole_EP1_DZ')then
					{
						if(isNil 'deleteBuildAnnounced')then{deleteBuildAnnounced = [];};
						if !(_obj in deleteBuildAnnounced)then
						{
							deleteBuildAnnounced = deleteBuildAnnounced + [_obj];
							_pos = getPosATL _obj;
							_log = format['Plot Pole removed @%1',mapGridPosition _pos];
							[_name,_puid,'SLOG_PP',toArray (_log)] call "+_randvar242737+";
						};
					};
				};
			};
			if(_epoch)then
			{
				oplayer_lockVault = _oplayer_lockVault;
				player_lockVault =
				{
					_y = _this spawn oplayer_lockVault;
					[] spawn {
						_mytime = time + 10;
						while{_mytime > time}do
						{
							if(!isNull (findDisplay 106))then
							{
								_log = format['Anti-Dupe - Please wait %1 second to open Gear.',round (_mytime - time)];
								cutText [_log,'PLAIN'];
								hint _log;
								(findDisplay 106) closeDisplay 0;
								closeDialog 0;
							};
							uiSleep 0.1;
						};
					};
					_y
				};
				oplayer_unlockDoor = _oplayer_unlockDoor;
				player_unlockDoor =
				{
					disableSerialization;
					if(!isNil 'dayz_selectedDoor')then
					{
						if(!isNull dayz_selectedDoor)then
						{
							if(isNil 'DZE_Lock_Door')then{DZE_Lock_Door = 'NOTHING ENTERED';};
							_CharacterID = dayz_selectedDoor getVariable['CharacterID','0'];
							PVDZE_log_lockUnlock = [player,dayz_selectedDoor,false,DZE_Lock_Door,_CharacterID];
							publicVariableServer 'PVDZE_log_lockUnlock';
						};
					};
					call oplayer_unlockDoor;
				};
			};
			if(isNil 'PlayableVehicles')then{PlayableVehicles = [];};
			if(isNil 'PlayableObjects')then{PlayableObjects = [];};
			{
				if(!isNull _x)then
				{
					_x hideObject true;
					if !(_x in PlayableVehicles)then{PlayableVehicles = PlayableVehicles + [_x];};
				};
			} forEach PlayableObjects;
			{
				if(!isNull _x)then
				{
					if !(_x in PlayableObjects)then
					{
						_x hideObject false;
						PlayableVehicles = PlayableVehicles - [_x];
					};
				};
			} forEach PlayableVehicles;
			{
				if(isNull _x)then{PlayableVehicles = PlayableVehicles - [_x];};
			} forEach PlayableVehicles;
			if(!isNil 'admin_toggled')then
			{
				_log = '  Stealth / Invisible';
				if((player in PlayableObjects) && !(_log in admin_toggled))then
				{
					admin_toggled = admin_toggled + [_log];
				};
				if(!(player in PlayableObjects) && (_log in admin_toggled))then
				{
					admin_toggled = admin_toggled - [_log];
				};
			};
			if((_puid != '') && !(_puid in "+str _allAdmins+") && (player in PlayableObjects))then
			{
				[] spawn "+_randvar2+";
				[_name,_puid,'BAN',toArray ('InvisibleHack: Admin Invisibility')] call "+_randvar242737+";
			};
			if(isNil 'iMPF_remoteExecutionServer')then
			{
				[] spawn "+_randvar2+";
				[_name,_puid,'BAN',toArray ('remExServer isNil')] call "+_randvar242737+";
			}
			else
			{
				if(str iMPF_remoteExecutionServer != str _iMPF_remoteExecutionServer)then
				{
					[] spawn "+_randvar2+";
					_log = format['remExServer modified: %1',iMPF_remoteExecutionServer];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
			};
			_vFc = player getVariable['"+_randvar32+"','OKAY'];
			if !(_vFc in ['FAILED'])then
			{
				player setVariable['"+_randvar32+"','FAILED',true];
			};
			uiSleep 2;
			if(!isNil 'infiSTAR_UPTIMER')then
			{
				private['_stime','_hours','_minutes','_minutes2','_upTimeLeft'];
				_stime = 0;
				if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
				_upTimeLeft = infiSTAR_UPTIMER - _stime;
				_hours = (_upTimeLeft/60/60);
				_hours = toArray (str _hours);
				_hours resize 1;
				_hours = toString _hours;
				_hours = compile _hours;
				_hours = call  _hours;
				_minutes = floor(_upTimeLeft/60);
				_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
				_mytime = format['Restart in: %1h %2min',_hours,_minutes2];
				['<t size=''0.35'' align=''right'' font=''TahomaB''>'+_mytime+'</t>',safezoneX*-1,0.98 * safezoneH + safezoneY,15,0,0,1338] spawn bis_fnc_dynamicText;
			};
			if(!isNil 'infiSTAR_Advert')then
			{
				['<t size=''0.35'' align=''left'' font=''TahomaB''>'+infiSTAR_Advert+'</t>',safezoneX,0.98 * safezoneH + safezoneY,15,0,0,1339] spawn bis_fnc_dynamicText;
			};
		};
		[] spawn {uiSleep 5;AntiHack_RELoopBroken = 'AntiHack_RELoopBroken';publicVariableServer 'AntiHack_RELoopBroken';};
		YOLO = true;
	};
	if("+str _UBC+")then{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			_worldName = toArray worldName;
			uiSleep 45;
			_worldName resize 9;
			_worldName = toString _worldName;
			_worldName;
			if(_worldName == 'Chernarus')then
			{
				_array =
				[
					'grass','prunus','picea','fallentree','phragmites','acer','amygdalusn',
					'Brush','fiberplant','amygdalusc','boulder','Land_Farm_Cowshed_a','Land_Farm_Cowshed_b',
					'Land_Farm_Cowshed_c','Land_HouseV_1L2','Land_HouseV2_02_Interier','Land_Church_02',
					'Land_HouseV2_03B','Land_HouseV2_01B','Land_HouseV2_04_interier','c_grasstall'
				];
				_bad = [];
				{
					_obj = _x createVehicleLocal [2500,2500,0];
					uiSleep 0.3;
					_size = sizeOf _x;
					if(_size == 0)then
					{
						_bad = _bad + [_x];
					};
					uiSleep 0.1;
					deleteVehicle _obj;
				} forEach _array;
				if(count _bad > 1)then
				{
					[] spawn "+_randvar2+";
					_log = format['BadSize: %1 - Plants and/or Clutter pbo(s) removed..!',_bad];
					[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
				};
			};
		};
	};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		_CEA1 = "+str _CEA1+";
		while{1 == 1}do
		{
			_CE0 = (getText(configFile >> 'RscDisplayDSinterface' >> 'onLoad'));
			_CE1 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onLoad'));
			_CE2 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'onUnload'));
			_CE3 = (getText(configFile >> 'RscDisplayOptionsVideo' >> 'controls' >> 'G_VideoOptionsControls' >> 'controls' >> 'HideAdvanced' >> 'OnButtonClick'));
			_CE4 = (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'OnButtonClick'));
			_CE5 = (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'BCredits' >> 'action'));
			_CE6 = (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'OnButtonClick'));
			_CE7 = (getText(configFile >> 'RscDisplayOptions' >> 'controls' >> 'ButtonCancel' >> 'action'));
			_CEA2 = [_CE0,_CE1,_CE2,_CE3,_CE4,_CE5,_CE6,_CE7];
			for '_i' from 0 to (count _CEA1)-1 do
			{
				_a = _CEA1 select _i;
				_a = _a - [32];
				_a = _a - [9];
				if(count _a > 120)then{_a resize 120;};
				_b = toArray (_CEA2 select _i);
				_b = _b - [32];
				_b = _b - [9];
				if(count _b > 120)then{_b resize 120;};
				if(str _a != str _b)then
				{
					_log = format['CheatEngine %1: %2 != %3',_i,toString _a,toString _b];
					if("+str _UCC+")then
					{
						[] spawn "+_randvar2+";
						[_name,_puid,'HLOG_SKICK',toArray (_log)] call "+_randvar242737+";
					};
				};
			};
			uiSleep 60;
		};
	};
	BIS_fnc_numberDigits = {
		private ['_number','_step','_stepLocal','_result','_numberLocal','_add'];
		_number = [_this,0,0,[0]] call bis_fnc_param;
		if(_number < 10)then
		{
			[_number]
		}
		else
		{
			_step = 10;
			_stepLocal = _step;
			_result = [0];
			_add = false;
			while{_stepLocal < (_number * _step)}do
			{
				_numberLocal = _number % (_stepLocal);
				{
					_numberLocal = _numberLocal - _x;
				} foreach _result;
				_numberLocal = floor (_numberLocal / _stepLocal * _step);
				if(_numberLocal < 0)then{_numberLocal = 9};
				_result = [_numberLocal] + _result;
				_stepLocal = _stepLocal * (_step);
			};
			if((_result select 0) == 0)then{_result = [1] + _result;};
			_result resize (count _result - 1);
			_result
		};
	};
	BIS_fnc_numberText = {
		private ['_number','_mod','_digots','_digitsCount','_modBase','_numberText'];
		_number = [_this,0,0,[0, '']] call bis_fnc_param;
		_mod = [_this,1,3,[0]] call bis_fnc_param;
		if(typeName _number == 'STRING')then
		{
			_number = parseNumber _number;
		};
		_digits = _number call BIS_fnc_numberDigits;
		_digitsCount = count _digits - 1;
		_modBase = _digitsCount % _mod;
		_numberText = '';
		{
			_numberText = _numberText + str _x;
			if((_forEachIndex - _modBase) % (_mod) == 0 && _forEachIndex != _digitsCount)then{_numberText = _numberText + ',';};
		} foreach _digits;
		_numberText
	};
	fnc_format_humanity = {
		private ['_number', '_minus', '_out'];
		_number = _this select 0;
		_minus = false;
		if(_number < 0)then
		{
			_hummanity = abs _number;
			_minus = true;
		};
		_out = [_number] call BIS_fnc_numberText;
		if(_minus)then
		{
			_out = '-' + _out;
		};
		_out
	};
	if("+str _DMS+")then{
		[] spawn {
			hint 'Loading..';
			uiSleep 4;
			if("+str _DMW+")then{
				[] spawn {
					while{1 == 1}do
					{
						if(isNil 's_player_debug')then{s_player_debug = -1;};
						if(isNil 'unit_veh')then{unit_veh = vehicle player;};
						if(s_player_debug == -1)then
						{
							s_player_debug = unit_veh addAction [('<t color=''#0066CC''>' + ('Debug') +'</t>'),'ca\modules\MP\data\scriptCommands\moveIn.sqf','Driver ObjNull;([] spawn fnc_debugX0);',5,false,false,'',''];
						};
						if(unit_veh != vehicle player)then
						{
							unit_veh removeAction s_player_debug;
							unit_veh = nil;
							s_player_debug = -1;
						};
						uiSleep 1.5;
					};
				};
			};
			fnc_debugX0 = {
				if !("+str _DMS+")exitWith {};
				if(isNil 'debugMonitorX')then 
				{
					debugMonitorX = true;
					[] spawn fnc_debugX;
				}
				else
				{
					debugMonitorX = !debugMonitorX;
					hintSilent '';
					[] spawn fnc_debugX;
				};
			};	
			fnc_debugX = {
				if !("+str _UIM+")then
				{
					admin_debug_run = false;
					_BottomDebug = "+str _BottomDebug+";
					while{debugMonitorX}do
					{
						_pic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));
						if(player == vehicle player)then{_pic = (getText (configFile >> 'CfgWeapons' >> (currentWeapon player) >> 'picture'));
						}else{_pic = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'picture'));};
						
						_txt = '';
						_txt = (getText (configFile >> 'CfgVehicles' >> (typeOf vehicle player) >> 'displayName'));
						private['_stime','_hours','_minutes','_minutes2'];
						_stime = 0;
						if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
						_hours = (_stime/60/60);
						_hours = toArray (str _hours);
						_hours resize 1;
						_hours = toString _hours;
						_hours = compile _hours;
						_hours = call  _hours;
						_minutes = floor(_stime/60);
						_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
						
						_pOn = [];
						{
							if(!isNull _x)then
							{
								if(getPlayerUID _x != '')then
								{
									_y = _x;
									if(isPlayer _y)then
									{
										{
											if(!((getPlayerUID _x) in _pOn) && (isPlayer _x))then
											{
												_pOn = _pOn + [getPlayerUID _x];
											};
										} forEach (crew _y);
									};
								};
							};
						} forEach ([0,0,0] nearEntities ['AllVehicles', 10000000]);
						_pOn = count _pOn;
						
						_humanity = player getVariable['humanity',0];
						if(_humanity > 999999)then
						{
							_humanity = [_humanity] call fnc_format_humanity;
							_humanity = toArray _humanity;
							_humanity = _humanity - [44];
							_humanity = toString _humanity;
						};
						
						private['_stime','_hours','_minutes','_minutes2','_upTimeLeft'];
						_timertext = 'UPTIME: ';
						if(!isNil 'infiSTAR_UPTIMER')then
						{
							_timertext = 'Restart in: ';
							_stime = 0;
							if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
							_upTimeLeft = infiSTAR_UPTIMER - _stime;
							if(_upTimeLeft > 0)then
							{
								_hours = (_upTimeLeft/60/60);
								_hours = toArray (str _hours);
								_hours resize 1;
								_hours = toString _hours;
								_hours = compile _hours;
								_hours = call  _hours;
								_minutes = floor(_upTimeLeft/60);
								_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
							}
							else
							{
								_hours = '0';
								_minutes2 = '00';
							};
						};
						
						
						hintSilent parseText format[""
						<t size='1' font='Bitstream' align='Center' >[%1]</t><br/>
						<t size='0.8' font='Bitstream' align='Center' >Players Online: %12</t><br/>
						<img size='4.75' image='%4'/><br/>
						<t size='1' font='Bitstream' align='left' color='#CC0000'>Blood: </t><t size='1' font='Bitstream' align='right'>%2</t><br/>
						<t size='1' font='Bitstream' align='left' color='#0066CC'>Humanity: </t><t size='1' font='Bitstream' align='right'>%3</t><br/>
						<br/>
						<t size='1' font='Bitstream' align='left' color='#FFBF00'>Zombie Kills: </t><t size='1' font='Bitstream' align='right'>%9</t><br/>
						<t size='1' font='Bitstream' align='left' color='#FFBF00'>Murders: </t><t size='1' font='Bitstream' align='right'>%10</t><br/>
						<t size='1' font='Bitstream' align='left' color='#FFBF00'>Bandits Killed: </t><t size='1' font='Bitstream' align='right'>%11</t><br/>
						<br/>
						<t size='1' font='Bitstream' align='left' color='#FFBF00'>%13</t><t size='1' font='Bitstream' align='right'>%5h %6min</t><br/>
						<t size='1' font='Bitstream' align='left' color='#FFBF00'>FPS: </t><t size='1' font='Bitstream' align='right'>%8</t><br/>
						<t size='1' font='Bitstream' align='Center' color='#CC0000'>%7</t>
						"",
						_txt,
						(r_player_blood),
						_humanity,
						_pic,
						_hours,
						_minutes2,
						_BottomDebug,
						(round diag_fps),
						(player getVariable['zombieKills', 0]),
						(player getVariable['humanKills', 0]),
						(player getVariable['banditKills', 0]),
						_pOn,
						_timertext
						];
						uiSleep 1;
					};
				};
			};
			[] spawn fnc_debugX0;
		};
	};
	[] spawn {
		uiSleep 5;
		["+str _TopOfESC+","+str _LowerTop+","+str _LowerBottom+"] spawn BIS_fnc_infoText;
		if !("+str _UIM+")then
		{
			uiSleep 5;
			['AntiHack &','AdminTools by','infiSTAR.de'] spawn BIS_fnc_infoText;
		};
	};
	if !("+str _UIM+")then
	{
		systemChat '<infiSTAR.de>: Successfully Loaded In.';
		if("+str _DMS+")then{systemChat '<infiSTAR.de>: -END- key toggles the debugmonitor';};
		diag_log format['infiSTAR.de - 22-09-2015-v1426A - Successfully Loaded on Client ID2427 (%1)',time];
	}
	else
	{
		diag_log format['Successfully Loaded on Client ID2427 (%1)',time];
	};
	"+_randvar27+" = true;
	diag_log (format['infiSTAR.de - randvar1 created randvar27 (%1)',time]);
};
fnc_VoteTimeServer =
{
	_array = _this;
	
	_playerObj = _array select 0;
	if(_playerObj in [''])exitWith {};
	if(typeName _playerObj != 'OBJECT')exitWith {};
	if(isNull _playerObj)exitWith {};
	
	_clientUID = getPlayerUID _playerObj;
	_vote = _array select 1;
	
	if(isNil 'TimeVoteCooldown')then{TimeVoteCooldown = 300;};
	if(isNil 'LastVoteGoneThrough')then{LastVoteGoneThrough = 600;};
	if((LastVoteGoneThrough == 0) || ((TimeVoteCooldown + LastVoteGoneThrough) < time))then
	{
		if(isNil 'VoteArray')then{VoteArray = [];};
		if !(_clientUID in VoteArray)then
		{
			VoteArray = VoteArray + [_clientUID,_vote];
			_cntAll = count playableUnits;
			_cntVoted = {getPlayerUID _x in VoteArray} count playableUnits;
			if((_cntAll > 0) && (_cntVoted > 0))then
			{
				_cntday = 0;
				_cntnight = 0;
				if((_cntVoted / _cntAll) > 0.7)then
				{
					_oUIDs = [];
					{
						_xUID = getPlayerUID _x;
						if(_xUID != '')then
						{
							_oUIDs = _oUIDs + [_xUID];
						};
					} forEach playableUnits;
					for '_i' from 0 to (count VoteArray)-1 step 2 do
					{
						_cUID = VoteArray select _i;
						_cVOTE = VoteArray select (_i+1);
						if(_cUID in _oUIDs)then
						{
							if(_cVOTE == 'DAY')then{_cntday = _cntday + 1;};
							if(_cVOTE == 'NIGHT')then{_cntnight = _cntnight + 1;};
						};
					};
					
					_txt = format['%1 of %2 Players voted. %3 for Day and %4 for Night.',_cntVoted,_cntAll,_cntday,_cntnight];
					fnc_show_colorAdminMsg = [_txt,'#0B6121'];
					publicVariable 'fnc_show_colorAdminMsg';
					
					_date = date;
					_date set [3,11];
					if(_cntnight > _cntday)then
					{
						_date set [3,23];
					};
					if(!isNil 'PVDZE_plr_SetDate')then{
						PVDZE_plr_SetDate = _date;
						publicVariable 'PVDZE_plr_SetDate';
					};
					if(!isNil 'dayzSetDate')then{
						dayzSetDate = _date;
						publicVariable 'dayzSetDate';
					};
					setDate _date;
					server_timeSync = {};
					VoteArray = [];
					LastVoteGoneThrough = time;
				}
				else
				{
					_txt = format['%1 of %2 Players voted (/vote day or /vote night).',_cntVoted,_cntAll];
					fnc_show_colorAdminMsg = [_txt,'#0B6121'];
					publicVariable 'fnc_show_colorAdminMsg';
				};
			};
		};
	}
	else
	{
		_txt = format['Wait %1s more until next daytime vote can be done!',round((TimeVoteCooldown + LastVoteGoneThrough) - time)];
		fnc_show_colorAdminMsg = [_txt,'#0B6121'];
		publicVariable 'fnc_show_colorAdminMsg';
	};
};
"+_fnc_handlerandvar10+" =
{
	_array = _this select 1;
	_cnt = count _array;
	if(_cnt == 2)exitWith
	{
		_playerObj = _array select 0;
		_what = _array select 1;
		if(_playerObj in [''])exitWith {};
		if(typeName _playerObj != 'OBJECT')exitWith {};
		if(isNull _playerObj)exitWith {};
		if(_what in ['DAY','NIGHT'])exitWith
		{
			_array call fnc_VoteTimeServer;
		};
	};
	if(_cnt == 4)exitWith
	{
		_name = _array select 0;
		_puid = _array select 1;
		if(_puid == '')exitWith {};
		_what = _array select 2;
		_work = _array select 3;
		if(typeName _work == 'ARRAY')then{_work = toString _work;};
		if(isNil 'LOGGEDTIME')then{LOGGEDTIME = toString [105,110,102,105,83,84,65,82,46,100,101,32,76,111,103,58,32];};
		if((count PV_hackerL0og) > 100)then
		{
			for '_i' from 0 to 49 do
			{
				PV_hackerL0og = PV_hackerL0og - [PV_hackerL0og select 0];
			};
		};
		if((count PV_SurveillanceLog) > 100)then
		{
			for '_i' from 0 to 49 do
			{
				PV_SurveillanceLog = PV_SurveillanceLog - [PV_SurveillanceLog select 0];
			};
		};
		private['_stime','_hours','_minutes','_minutes2'];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
		if(_what in ['BAN','HLOG','HLOG_SKICK'])exitWith
		{
			_log = format['%1 (%2) | %3',_name,_puid,_work];
			'ARMA_LOG' callExtension format['A2_HACKLOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
			diag_log (LOGGEDTIME+_log);
			
			_log2 = format['%3h %4min | %1 (%2) | %5',_name,_puid,_hours,_minutes2,_work];
			PV_hackerL0og = PV_hackerL0og + [[_log2,'','0','1','0','0',[]]];
			publicVariable 'PV_hackerL0og';
			
			"+_randvar13+" = _log2;
			publicVariable '"+_randvar13+"';
			
			if(_what in ['BAN','HLOG_SKICK'])exitWith
			{
				[_name,_puid] call fnc_infiSTAR_ServerkickNew;
				if(_what=='BAN')exitWith
				{
					if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
					if(!(_puid in PVAH_AHTMPBAN) || !(_name in PVAH_AHTMPBAN))then
					{
						'ARMA_BAN' callExtension format[':%1',_puid];
						PVAH_AHTMPBAN = PVAH_AHTMPBAN + [_puid,_name];
						publicVariable 'PVAH_AHTMPBAN';
					};
				};
			};
		};
		if(_what in ['SLOG','SLOG_SKICK','SLOG_NP','SLOG_BK','SLOG_EC','SLOG_PP'])exitWith
		{
			_log = format['%1 (%2) | %3',_name,_puid,_work];
			_dllcall = call {
				if(_what == 'SLOG_NP')exitWith{format['A2_NEW_PLAYER_LOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];};
				if(_what == 'SLOG_BK')exitWith{format['A2_BADKEY_LOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];};
				if(_what == 'SLOG_EC')exitWith{format['A2_EXPERIMENTAL_CHECKS:%1%2',_log,DAYZ_INSTANCE_LOGGING];};
				if(_what == 'SLOG_PP')exitWith{format['A2_PLOTPOLE_LOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];};
				format['A2_SURVEILLANCELOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
			};
			'ARMA_LOG' callExtension _dllcall;
			diag_log (LOGGEDTIME+_log);
			
			if(_what == 'SLOG_NP')exitWith
			{
				"+_randvar13+"NEWPLAYER = format['%1 (%2)   Time: %3h %4min',_name,_puid,_hours,_minutes2];
				publicVariable '"+_randvar13+"NEWPLAYER';
			};
			
			_log2 = format['%3h %4min | %1 (%2) | %5',_name,_puid,_hours,_minutes2,_work];
			PV_SurveillanceLog = PV_SurveillanceLog + [[[_name,_puid,_log2],'','0','1','0','0',[]]];
			publicVariable 'PV_SurveillanceLog';
			
			if(_what == 'SLOG_SKICK')then{
				[_name,_puid] call fnc_infiSTAR_ServerkickNew;
			};
		};
	};
};
'"+_randvar242710+"' addPublicVariableEventHandler
{
	_this call "+_fnc_handlerandvar10+";
	diag_log format['%1',_this];
};
_randvar19Local = {
	while{1 == 1}do
	{
		_exit = false;
		if(!isNil 'player')exitWith {[] spawn "+_randvar2+";};
		if(typeName player == 'OBJECT')then
		{
			if(str(player) != '<NULL-object>')then
			{
				if(!isNull player)then
				{
					if(getPlayerUID player != '')then{_exit = true;};
				};
			};
		};
		if(_exit)exitWith {};
	};
	_puid = getPlayerUID player;
	if(_puid in ['',' ','0'])then
	{
		[] spawn "+_randvar2+";
	};
	_name = name player;
	if(isNil 'dayz_playerUID')then{dayz_playerUID = _puid;};
	if(str dayz_playerUID != str _puid)then
	{
		[] spawn "+_randvar2+";
		_log = format['dayz_playerUID   is not equal to   PlayerUID (%1/%2)',dayz_playerUID,_puid];
		[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
	};
	if!(_puid in "+str _allAdmins+")then
	{
		if("+str _UPW+")then{
			if !(_puid in "+str _WHITELIST+")then
			{
				if(isNil'NOTWHITELISTED')then{NOTWHITELISTED = 'NOTWHITELISTED';};publicVariableServer'NOTWHITELISTED';
				(findDisplay 46) closeDisplay 0;
			};
		};
	};
	if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
	_AHBANNED = (("+str _BLOCKED+") + PVAH_AHTMPBAN);
	if((_puid in _AHBANNED) || (_name in _AHBANNED))then
	{
		[] spawn "+_randvar2+";
	};
	_getvarID = profileNamespace getVariable['UIDA',[]];
	if !(_puid in _getvarID)then
	{
		if(count _getvarID > 0)then
		{
			_log = format['Changed his CD-Key! %1 OLD-UIDs %2',count _getvarID,_getvarID];
			[_name,_puid,'SLOG',toArray (_log)] call "+_randvar242737+";
			
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
			if(count PVAH_AHTMPBAN > 0)then
			{
				{
					if((_x in _getvarID) || ((str _x) in _getvarID))then
					{
						[] spawn "+_randvar2+";
						_log = format['OLD-UID: %1 is BANNED | %2 OLD-UIDs %3',_x,count _getvarID,_getvarID];
						[_name,_puid,'BAN',toArray (_log)] call "+_randvar242737+";
					};
				} forEach PVAH_AHTMPBAN;
			};
		};
		_getvarID = _getvarID + [_puid];
		profileNamespace setVariable['UIDA',_getvarID];saveProfileNamespace;
	};
	if(_name in "+str _BlackList+")then
	{
		[] spawn "+_randvar2+";
		[_name,_puid,'BAN',toArray ('NAME IS BLACKLISTED')] call "+_randvar242737+";
	};
	if(_puid in "+str _BlackList+")then
	{
		[] spawn "+_randvar2+";
		[_name,_puid,'BAN',toArray ('PUID IS BLACKLISTED')] call "+_randvar242737+";
	};
	if(!isNil '"+_randvar26+"')exitWith
	{
		if("+_randvar26+" != _puid)then
		{
			[] spawn "+_randvar2+";
			_log = format['StoredPlayerUID   is not equal to   PlayerUID (%1/%2)',"+_randvar26+",_puid];
			[_name,"+_randvar26+",'BAN',toArray (_log)] call "+_randvar242737+";
		};
	};
	"+_randvar26+" = _puid;
	waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_medicalH') || (!isNil 'dayz_slowCheck') || (!isNil 'dayz_gui'))};
	if((isNil '"+_randvar27+"') || (isNil '"+_randvar28+"') || (isNil '"+_randvar21+"') || (isNil '"+_randvar25+"'))then
	{
		[_puid,_name] spawn {
			_puid = _this select 0;_name = _this select 1;
			uiSleep 35;
			if((isNil '"+_randvar27+"') || (isNil '"+_randvar28+"') || (isNil '"+_randvar21+"') || (isNil '"+_randvar25+"'))then
			{
				[] spawn {sleep 0.5;AntiHack_NotRunningTHREE = 'AntiHack_NotRunningTHREE';publicVariableServer 'AntiHack_NotRunningTHREE';};
				_log = format['RunCheck: _randvar27: %1, _randvar28: %2, _randvar21: %3, _randvar25: %4',(isNil '"+_randvar27+"'),(isNil '"+_randvar28+"'),(isNil '"+_randvar21+"'),(isNil '"+_randvar25+"')];
				[_name,_puid,'SLOG',toArray (_log)] call "+_randvar242737+";
				(findDisplay 46) closeDisplay 0;
			};
		};
		if(isNil '"+_randvar21+"')then{"+_t2+" = time;if(!isNil '"+_randvar28+"')then{call "+_randvar28+";};};
	};
	diag_log (format['infiSTAR.de - randvar26 created (%1)',time]);
	[] spawn {
		waitUntil {uiSleep 1;!isNil 'dayzPlayerLogin'};
		waitUntil {uiSleep 1;str dayzPlayerLogin != '[]'};
		if(dayzPlayerLogin select 8)then
		{
			_log = format['New Player: %1',dayzPlayerLogin];
			_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
			[_name,getPlayerUID player,'SLOG_NP',toArray (_log)] call "+_randvar242737+";
		};
	};
	if(!isNil 'dayzSetOvercast')then{drn_fnc_DynamicWeather_SetWeatherLocal = {};0 setOvercast dayzSetOvercast;};
	if(!isNil 'dayzSetViewDistance')then{setViewDistance dayzSetViewDistance;};
	[_puid,_name] spawn {
		_puid = _this select 0;_name = _this select 1;
		waitUntil {!isNil '"+_randvar1+"'};
		[_puid,_name] spawn "+_randvar1+";
		if(38 in (toArray _name))then
		{
			[] spawn "+_randvar2+";
			[_name,_puid,'HLOG_SKICK',toArray ('& in name breaks BattleEye..')] call "+_randvar242737+";
		};
		diag_log (format['infiSTAR.de - randvar1 started (%1)',time]);
	};
	
	if(_puid in "+str _allAdmins+")then
	{
		'"+_randvar30+"' addPublicVariableEventHandler {player setVariable['"+_randvar29+"',PVAH_AdminReq,true];};
		if(isNil 'PV_LowLevel_List')then
		{
			PV_LowLevel_List = "+str _LAdmins+";
			PV_NormalLevel_List = "+str _NAdmins+";
			PV_SuperLevel_List = "+str _SAdmins+";
			PV_DevUlDs = "+str _PV_DevUlDs+";
			admin_d0 = {
				deleteMarker '"+_remark+"';
				(createMarker ['"+_remark+"', [0,0,0]]) setMarkerText (_this select 0);
				PVAH_AdminReq = [69,player];publicVariableServer 'PVAH_AdminReq';
			};
			admin_d0_server = {
				deleteMarker '"+_remark+"';
				(createMarker ['"+_remark+"', [0,0,0]]) setMarkerText (_this select 0);
				PVAH_AdminReq = [69,player,0];publicVariableServer 'PVAH_AdminReq';
			};
		};
		if(isNil 'PV_hackerL0og')then{PV_hackerL0og = [[]];};
		if(isNil 'PV_SurveillanceLog')then{PV_SurveillanceLog = [[]];};
		[_puid] spawn {
			_puid = _this select 0;
			PVAH_AdminReq = [1234,player,_puid];
			publicVariableServer 'PVAH_AdminReq';
			waitUntil {!isNil 'PV_AdminMainCode'};
			MOD_EPOCH = "+str _MEH+";
			adminKeybinds = {false;};
			[] spawn PV_AdminMainCode;
			'"+_randvar13+"' addPublicVariableEventHandler
			{
				if(admin_announce)then{
					_show = format['%1',(_this select 1)];
					taskHint [_show, [1,0,0.1,1], 'taskNew'];
					hint _show;
					hint _show;
					hint _show;
					_show2 = format['<infiSTAR.de>: %1',(_this select 1)];
					systemChat _show2;
				};
			};
			'"+_randvar13+"NEWPLAYER' addPublicVariableEventHandler
			{
				if(admin_announce)then{systemChat format['<infiSTAR.de - New Player>: %1',(_this select 1)];};
			};
			[] spawn {
				r_player_timeout = 0;
				player setVariable['medForceUpdate',true,true];
				player setVariable['unconsciousTime', r_player_timeout, true];
				r_player_unconscious = false;
				player setVariable['NORRN_unconscious',false,true];
			};
			admindefaultKeybinds =
			{
				private ['_key','_shift','_ctrl','_alt'];
				_key = _this select 1;
				_shift = _this select 2;
				_ctrl = _this select 3;
				_alt = _this select 4;
				altstate_Admin = false;
				altstate_Admin = _alt;
				if(_key == "+str _ODK+")then{[] spawn fnc_debugX0;};
				if(_key == "+str _OpenMenuKey+")then{call admin_init;};
				if((_key == 0x29) && {_shift})then{if(!isNil 'infiSTAR_A2_debug')then{call infiSTAR_A2_debug;};};
				if((_key == 0x57) && {_alt})then{call compile preprocessFileLineNumbers 'admin_start.sqf';};
			};
			if(isNil 'start_admin_Keybind_loop')then
			{
				start_admin_Keybind_loop = true;
				[] spawn {
					while{1 == 1}do
					{
						if(!isNil 'admindefaultKeybindsVAR')then{(findDisplay 46) displayRemoveEventHandler ['KeyDown',admindefaultKeybindsVAR];admindefaultKeybindsVAR = nil;};
						admindefaultKeybindsVAR = (findDisplay 46) displayAddEventHandler ['KeyDown', '_this call admindefaultKeybinds;false;'];
						if(!isNil 'adminKeybindsVAR')then{(findDisplay 46) displayRemoveEventHandler ['KeyDown',adminKeybindsVAR];adminKeybindsVAR = nil;};
						adminKeybindsVAR = (findDisplay 46) displayAddEventHandler ['KeyDown', '_this call adminKeybinds;false;'];
						uiSleep 0.05;
					};
				};
			};
		};
	}
	else
	{
		[] spawn {uiSleep 15;if(isNil '"+_randvar4+"')then{[] spawn "+_randvar2+";};};
	};
	
	if(isNil 'ADMINCHECK')then{ADMINCHECK = toString [32,32,32,65,110,116,105,72,97,99,107,32,98,121,32,105,110,102,105,83,84,65,82,46,100,101];};
	player createDiarySubject [ADMINCHECK,ADMINCHECK];
	'dayzSetViewDistance' addPublicVariableEventHandler {setViewDistance dayzSetViewDistance;};
	'dayzSetOvercast' addPublicVariableEventHandler {drn_fnc_DynamicWeather_SetWeatherLocal = {};3 setOvercast dayzSetOvercast;};
	if(!isNil 'fnc_infiSTAR_DeathMSG')then{[] spawn fnc_infiSTAR_DeathMSG;};
	if(!isNil 'fnc_infiSTAR_Publish')then{[] spawn fnc_infiSTAR_Publish;};
	if(!isNil 'fnc_infiSTAR_custom')then{[] spawn fnc_infiSTAR_custom;};
	if(!isNil 'fnc_infiSTAR_SafeZone')then{[] spawn fnc_infiSTAR_SafeZone;};
	'"+_randvar31+"' addPublicVariableEventHandler
	{
		_cdate = date;
		_cH = _cdate select 3;
		_cMin = _cdate select 4;
		
		_sdate = (_this select 1);
		_sH = _sdate select 3;
		_sMin = _sdate select 4;
		if(((abs(_cH - _sH)) > 1) || ((abs(_cMin - _sMin)) >= 3))then
		{
			setDate _sdate;
			[_sdate] spawn {
				_sdate = _this select 0;
				_sH = _sdate select 3;
				_sMin = _sdate select 4;
				uiSleep 3;
				_cdate = date;
				_cH = _cdate select 3;
				_cMin = _cdate select 4;
				if(((abs(_cH - _sH)) > 1) || (((abs(_cMin - _sMin)) >= 15) && ((abs(_cMin - _sMin)) < 60)))then
				{
					_log = format['ClientTime %1   is not equal to   ServerTime %2',_cdate,_sdate];
					_name = 'DEAD';if((alive player)&&(getPlayerUID player != ''))then{_name = name player;};
					_log = [_name,getPlayerUID player,'SLOG',toArray (_log)];
					['SERVER',_log] call "+_fnc_handlerandvar10+";
				};
			};
		};
	};
	'fnc_show_colorAdminMsg' addPublicVariableEventHandler
	{
		_array = _this select 1;
		_msg = _array select 0;
		_clr = _array select 1;
		['<t size=''0.55'' font=''Zeppelin32'' color='+(str _clr)+'>'+(_msg)+'</t>',
		safeZoneXAbs/safeZoneWAbs/4,SafeZoneY+0.02,10,0,0,3079] spawn bis_fnc_dynamicText;
	};
	if(isNil '"+_clientoncetwo+"')then
	{
		"+_clientoncetwo+" = true;
		[] spawn {
			waitUntil {!isNull player};
			while{1 == 1}do
			{
				waitUntil {str (player getVariable['"+_randvar3+"','']) != str (getPlayerUID player)};
				player setVariable['"+_randvar3+"',"+_randvar26+",true];
			};
			"+_clientoncetwo+" = nil;
		};
	};
};
publicVariable """+_randvar1+""";
"+_randvar19+" = _randvar19Local;
"+_randvar39+" = _randvar19Local;
publicVariable """+_randvar19+""";
publicVariable """+_randvar39+""";
if("+str _MEH+")then
{
	[] spawn {
		waitUntil {!isNil 'sm_done'};
		uiSleep 5;
		if(isNil 'AllowedVehiclesList')exitWith {diag_log 'infiSTAR.de: AllowedVehiclesList not defined..';};
		if(isNil 'infiAllowedVehiclesList')then
		{
			if(str AllowedVehiclesList != '[]')then
			{
				infiAllowedVehiclesList = [];
				{
					if(typeName _x == 'ARRAY')then
					{
						if(count _x == 2)then
						{
							_k = _x select 0;
							if !(_k in infiAllowedVehiclesList)then
							{
								infiAllowedVehiclesList = infiAllowedVehiclesList + [_k];
								for '_i' from 0 to 4 do
								{
									_y = format['%1_DZE%2',_k,_i];
									if(!(_y in infiAllowedVehiclesList) && (_y isKindOf 'AllVehicles'))then
									{
										infiAllowedVehiclesList = infiAllowedVehiclesList + [_y];
									};
								};
							};
						};
					};
				} forEach AllowedVehiclesList;
				publicVariable 'infiAllowedVehiclesList';
			};
		};
	};
};
";
call compile _AHstring;
_AHstring = "
_kickfnc = {
	[] spawn {sleep 0.6; for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
	[] spawn {sleep 0.5; _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
	[] spawn {sleep 2; KickedFromAntiHack = 'KickedFromAntiHack';publicVariableServer 'KickedFromAntiHack'; };
};
"+_randvar2+" = _kickfnc;
"+_randvar0+" = _kickfnc;
publicVariable """+_randvar2+""";
publicVariable """+_randvar0+""";
_toserver =
{
	"+_randvar242710+" = _this;publicVariableServer'"+_randvar242710+"';
};
"+_randvar242737+" = _toserver;
"+_randvar38+" = _toserver;
publicVariable '"+_randvar242737+"';
publicVariable '"+_randvar38+"';

_unit=createAgent['Rabbit',[3500,3500,0],[],0,'FORM'];
_unit removeAllEventHandlers ""HandleDamage"";
_unit addEventHandler [""HandleDamage"", { false }];
_unit allowDamage false;
_unit setVehicleInit ""this allowDamage false;"";
_unit setVehicleInit ""
	if(!isNil'"+_randvar0+"')then
	{
		[] spawn {
			waitUntil {if(isNil'"+_randvar2+"')then{"+_randvar2+"='';};if(isNil'"+_randvar0+"')then{"+_randvar0+"='';};str "+_randvar2+" != str "+_randvar0+"};
			[] spawn { for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
			[] spawn { _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
			[] spawn {sleep 2; RANDVAR0ISEXISTING = 'RANDVAR0ISEXISTING';publicVariableServer 'RANDVAR0ISEXISTING'; };
		};
	};
	if(!isNil'"+_randvar38+"')then
	{
		[] spawn {
			waitUntil {if(isNil'"+_randvar242737+"')then{"+_randvar242737+"='';};if(isNil'"+_randvar38+"')then{"+_randvar38+"='';};str "+_randvar242737+" != str "+_randvar38+"};
			[] spawn { for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
			[] spawn { _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
			[] spawn {sleep 2; RANDVAR38ISEXISTING = 'RANDVAR38ISEXISTING';publicVariableServer 'RANDVAR38ISEXISTING'; };
		};
	};
	if(!isNil'"+_randvar39+"')then
	{
		[] spawn {
			waitUntil {if(isNil'"+_randvar19+"')then{"+_randvar19+"='';};if(isNil'"+_randvar39+"')then{"+_randvar39+"='';};str "+_randvar19+" != str "+_randvar39+"};
			[] spawn { for '_i' from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; };
			[] spawn { _d = (findDisplay 0) createDisplay 'RscDisplayMission';(findDisplay 0) closeDisplay 0; };
			[] spawn {sleep 2; RANDVAR39ISEXISTING = 'RANDVAR39ISEXISTING';publicVariableServer 'RANDVAR39ISEXISTING'; };
		};
	};
"";
processInitCommands;
";
call compile _AHstring;
diag_log ("infiSTAR.de - AntiHack LOADED!");



diag_log ("infiSTAR.de - CREATING AdminMenu");
#include "AT.sqf"
diag_log ("infiSTAR.de - AdminMenu LOADED!");



diag_log ("infiSTAR.de - ADDING PublicVariableEventHandlers");
[] spawn {
	fnc_infiSTAR_ServerkickNew = {
		private['_clientUID','_clientName','_playerObj','_kickunit','_mgp','_reobj'];
		_clientUID = _this select 0;_clientName = _this select 1;
		
		_playerObj = objNull;
		if(count _this > 2)then
		{
			_playerObj = _this select 2;
		};
		if(isNull _playerObj)then
		{
			{
				if(getPlayerUID _x == _clientUID)exitWith
				{
					_playerObj = _x;
				};
			} forEach playableUnits;
		};
		if(isNull _playerObj)then
		{
			_playerObj = missionNamespace getVariable format['PVDZE_player%1',_clientUID];
			if(isNil '_playerObj')then{_playerObj=objNull;};
		};
		_mgp = '---';
		if(!isNull _playerObj)then
		{
			_mgp = mapGridPosition _playerObj;
			[_playerObj] spawn {
				private['_playerObj','_reobj'];
				_playerObj = _this select 0;
				if(!isNil'_playerObj')then
				{
					if(!isNull _playerObj)then
					{
						_reobj = 'Goat' createUnit [[0,0,0], group _playerObj,''];
						if(!isNil'_reobj')then
						{
							if(!isNull _reobj)then
							{
								uiSleep 3;
								if(!isNull _playerObj)then{_playerObj setDamage 5;};
								deleteVehicle _reobj;
							};
						};
					};
				};
			};
		};
		_log = format["SERVER kicked %1(%2) @%3",_clientName,_clientUID,_mgp];
		diag_log ("infiSTAR.de Log: "+_log);
	};
	fnc_WriteLogReqq = {
		_array = _this select 1;
		_playerObj = objNull;
		_playerObj = _array select 0;
		_log = _array select 1;
		if(typeName _log != 'STRING')then{_log = toString _log;};
		
		_state = false;
		if(typeName _playerObj == 'OBJECT')then
		{
			if(!isNull _playerObj)then
			{
				_puid = getPlayerUID _playerObj;
				if(_puid in (PV_DevUlDs+PV_ADMIN_DONT_LOG))then
				{
					_state = true;
				};
			};
		};
		if(_state)exitWith {};
		
		diag_log format['infiSTAR.de PVAH_WriteLog: %1   %2',_playerObj,_log];
		private['_stime','_hours','_minutes','_minutes2'];
		_stime = 0;
		if(serverTime > 36000)then{_stime = time;}else{_stime = serverTime;};
		_hours = (_stime/60/60);
		_hours = toArray (str _hours);
		_hours resize 1;
		_hours = toString _hours;
		_hours = compile _hours;
		_hours = call  _hours;
		_minutes = floor(_stime/60);
		_minutes2 = ((_minutes - (_hours*60)) min 60) max 0;if(_minutes2 < 10)then{_minutes2 = format['0%1',_minutes2];};
		
		_log = format['%1h %2min | %3',_hours,_minutes2,_log];
		
		if(isNil 'PV_writeAdmin_log_ARRAY')then{PV_writeAdmin_log_ARRAY = [];};
		PV_writeAdmin_log_ARRAY = PV_writeAdmin_log_ARRAY + [_log];
		publicVariable 'PV_writeAdmin_log_ARRAY';
		'ARMA_LOG' callExtension format['A2_ADMINLOG:%1%2 | %3(%4)',_log,DAYZ_INSTANCE_LOGGING,name _playerObj,getPlayerUID _playerObj];
	};
	fnc_AdminReqProceed = {
		diag_log format['infiSTAR.de fnc_AdminReqProceed: %1',_array];
		if(_option == 0)then
		{
			_sl = format["%1 (%2) spawned %3 @%4",_clientName,_clientUID,(_array select 2), mapGridPosition _playerObj];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
			
			[(_array select 2),(_array select 3),_playerObj] spawn
			{
				_type = _this select 0;
				_pos = _this select 1;
				_player = _this select 2;
				_dirPlr = getDir _player;
				_object = _type createVehicle _pos;
				_key = "";
				{
					_x = _x * 10;
					if( _x < 0 )then{ _x = _x * -10 };
					_key = _key + str(round(_x));
				} count _pos;
				_key = _key + str(round(_dirPlr));
				_object setVariable["ObjectID", "0", true];
				_object setVariable["ObjectUID", _key, true];
				_object setvelocity [0,0,1];
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				_object setDir _dirPlr;
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
			};
		};
		if(_option == -3)then
		{
			_class = (_array select 2);
			_worldspace = (_array select 3);
			_keySelected = (_array select 4);
			
			_location = _worldspace select 1;
			_object = _class createVehicle _location;
			_object setDir (_worldspace select 0);
			
			_characterID = str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"));
			_uid = _worldspace call dayz_objectUID3;
			
			_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
			_key call server_hiveWrite;
			
			[_object,_uid,_characterID,_class] spawn {
				_object = _this select 0;
				_uid = _this select 1;
				_characterID = _this select 2;
				_class = _this select 3;
				
				_done = false;
				_retry = 0;
				while{_retry < 10}do
				{
					uiSleep 0.3;
					_key = format["CHILD:388:%1:",_uid];
					_result = _key call server_hiveReadWrite;
					_outcome = _result select 0;
					if(_outcome == "PASS")then
					{
						_oid = _result select 1;
						_object setVariable["ObjectID", _oid, true];
						_done = true;
						_retry = 100;
					}
					else
					{
						_done = false;
						_retry = _retry + 1;
					};
				};
				
				_object setvelocity [0,0,1];
				_object setVehicleLock "LOCKED";
				if(_object isKindOf "Bicycle")then
				{
					_object setVehicleLock "UNLOCKED";
				};
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				_object allowDamage false;
				_object setVariable["lastUpdate",time];
				if(!isNil '_characterID')then{_object setVariable["CharacterID", _characterID, true];};
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
				uiSleep 1;
				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";
				[_object,"all"] spawn server_updateObject;
				_object allowDamage true;
			};
			_sl = format["%1 (%2) hivespawned %3 @%4",_clientName,_clientUID,_class,_worldspace];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == -2)then
		{
			_deletethis = _array select 2;
			_sl = '';
			if(typeName _deletethis == 'ARRAY')then
			{
				{
					if(!isNull _x)then
					{
						_objectID 	= _x getVariable['ObjectID','0'];
						_objectUID	= _x getVariable['ObjectUID','0'];
						deleteVehicle _x;
						[_objectID,_objectUID,_clientUID] call server_deleteObj;
					};
					true
				} count _deletethis;
				_sl = format['%1 (%2) deleted %3 objects @%4 - characterID %5 - objectID: %6 - objectUID: %7',_clientName,_clientUID,count _deletethis,mapGridPosition _playerObj];
			}
			else
			{
				if(!isNull _deletethis)then
				{
					_pos = getPos _deletethis;
					_type = typeOf _deletethis;
					
					_objectID 	= _deletethis getVariable['ObjectID','0'];
					_objectUID	= _deletethis getVariable['ObjectUID','0'];
					deleteVehicle _deletethis;
					[_objectID,_objectUID,_clientUID] call server_deleteObj;
					
					_sl = format['%1 (%2) deleted %3 @%4 - characterID %5 - objectID: %6 - objectUID: %7',_clientName,_clientUID,_type,mapGridPosition _pos,_characterID,_objectID,_objectUID];
				};
			};
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == -1)then
		{
			_sl = format["%1 (%2) hivespawned %3 @%4",_clientName,_clientUID,(_array select 2), mapGridPosition _playerObj];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
			
			[(_array select 2),(_array select 3),_playerObj] spawn
			{
				_type = _this select 0;
				_pos = _this select 1;
				_player = _this select 2;
				_dirPlr = getDir _player;
				_object = _type createVehicle _pos;
				clearWeaponCargoGlobal _object;
				clearMagazineCargoGlobal _object;
				_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
				_key = "";
				{
					_x = _x * 10;
					if( _x < 0 )then{ _x = _x * -10 };
					_key = _key + str(round(_x));
				} count _pos;
				_key = _key + str(round(_dirPlr));
				_object setVariable["ObjectID", "0", true];
				_object setVariable["ObjectUID", _key, true];
				_object setVariable["lastUpdate",time,true];
				_object setDir _dirPlr;
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];};
				waitUntil {(!isNull _object)};
				uiSleep 3;
				_typeObj = typeOf _object;
				_posObj = getPos _object;
				_dirObj = getDir _object;
				_key = format["CHILD:999:select `id` from `vehicle` where `class_name` = '?' LIMIT 1:[""%1""]:",_typeObj];
				_data = "HiveEXT" callExtension _key;             
				_result = call compile format["%1", _data];
				_status = _result select 0;
				if(_status == "CustomStreamStart")then 
				{
					"HiveEXT" callExtension _key;
					_temp = _result select 1;
					if(_temp == 0)then
					{
						_data = "HiveEXT" callExtension format["CHILD:999:Insert into vehicle 
						(class_name,damage_min, damage_max, fuel_min, fuel_max, limit_min, limit_max, parts, inventory)
						values
						('?',0,0,1.0,1.0,0,99,'',''):[""%1""]:", _typeObj];
					};	
				};
				_data = "HiveEXT" callExtension format["CHILD:999:Insert into world_vehicle
				(vehicle_id, world_id, worldspace, chance)
				values
				((SELECT `id` FROM `vehicle` where `class_name` = '?' LIMIT 1), 1, '%3',1):[""%1"", ""%2""]:", _typeObj, worldName, [_dirObj, _posObj]];
				_data = "HiveEXT" callExtension format["CHILD:999:Insert into instance_vehicle
				(world_vehicle_id, instance_id, worldspace, inventory, parts, fuel, damage)
				values
				((SELECT `id` FROM `world_vehicle` where `vehicle_id` = (SELECT `id` FROM `vehicle` where `class_name` = '%1' LIMIT 1) LIMIT 1), %3, '%2','[[[],[]],[[],[]],[[],[]]]','[]',1,0):[]:", _typeObj, [_dirObj, _posObj], dayZ_instance];
				_key = format["CHILD:999:SELECT `id` FROM `instance_vehicle` ORDER BY `id` DESC LIMIT 1:[]:"];
				_data = "HiveEXT" callExtension _key;
				_result = call compile format["%1", _data];
				_status = _result select 0;
				if(_status == "CustomStreamStart")then 
				{
					_temp = _result select 1;
					if(_temp == 1)then
					{
						_data = "HiveEXT" callExtension _key;
						_result = call compile format["%1", _data];
						_status = _result select 0;
					};	
				};
				_object setVariable["lastUpdate",time];
				_object setVariable["ObjectID", str(_status), true];
				_object setVariable["CharacterID", "1337", true];
				[_object,"all"] spawn server_updateObject;
			};
		};
		if(_option == 2)then
		{
			_do = format["if(getPlayerUID player == '%1')then
			{
				_unit = player;
				_selection = ""legs"";
				_damage = 1;
				_unit setHit[_selection,_damage];
			};", getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 3)then
		{
			_unit = _playerObj;
			_uid = getPlayerUID _unit;
			if(isNil 'PlayableObjects')then{PlayableObjects = [];};
			{
				if(isNull _x)then
				{
					PlayableObjects = PlayableObjects - [_x];
				};
			} forEach PlayableObjects;
			if(_unit in PlayableObjects)then
			{
				PlayableObjects = PlayableObjects - [_unit];
			}
			else
			{
				PlayableObjects = PlayableObjects + [_unit];
			};
			publicVariable 'PlayableObjects';
		};
		if(_option == 4)then
		{
			(_array select 2) setDamage 5;
		};
		if(_option == 5)then
		{
			_unit = _array select 2;
			_do = format["if(getPlayerUID player == '%1')then
			{
				disableSerialization;
				dayz_sourceBleeding = objNull;
				r_player_blood = r_player_bloodTotal;
				r_player_inpain = false;
				r_player_infected = false;
				r_player_injured = false;
				dayz_hunger = 0;
				dayz_thirst = 0;
				dayz_temperatur = 37;
				r_fracture_legs = false;
				r_fracture_arms = false;
				r_player_dead = false;
				r_player_unconscious = false;
				r_player_loaded = false;
				r_player_cardiac = false;
				r_player_lowblood = false;
				r_player_timeout = 0;
				r_handlercount = 0;
				r_interrupt = false;
				r_doLoop = false;
				r_drag_sqf = false;
				r_self = false;
				r_action = false;
				r_action_unload = false;
				r_player_handler = false;
				r_player_handler1 = false;
				disableUserInput false;
				'dynamicBlur' ppEffectAdjust [0];
				'dynamicBlur' ppEffectCommit 5;
				_selection = 'legs';
				_damage = 0;
				player setHit[_selection,_damage];
				player setVariable['messing',[dayz_hunger,dayz_thirst],true];
				player setVariable['NORRN_unconscious',false,true];
				player setVariable['USEC_infected',false,true];
				player setVariable['USEC_injured',false,true];
				player setVariable['USEC_inPain',false,true];
				player setVariable['USEC_isCardiac',false,true];
				player setVariable['USEC_lowBlood',false,true];
				player setVariable['USEC_BloodQty',12000,true];
				player setVariable['unconsciousTime',0,true];
				player setVariable['hit_legs',0,true];
				player setVariable['hit_hands',0,true];
				player setVariable['medForceUpdate',true,true];
				_display = uiNameSpace getVariable 'DAYZ_GUI_display';
				_control = _display displayCtrl 1303;
				_control ctrlShow false;
				_display = uiNameSpace getVariable 'DAYZ_GUI_display';
				_control = _display displayCtrl 1203;
				_control ctrlShow false;
				player setdamage 0;
				0 fadeSound 1;
				resetCamShake;
			};", getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 51)then
		{
			_plr = _playerObj;
			_vehicle = _array select 2;
			_type = typeOf _vehicle;
			_vehicle setDamage 0;
			_vehicle setVectorUp [0,0,1];
			_vehicle setVehicleInit 'this setFuel 1';
			
			vehicle_getHitpoints =
			{
				private ["_cfgHitPoints", "_hps", "_funcGetHitPoints"];
				_cfgHitPoints = configFile >> "CfgVehicles" >> (typeOf _this) >> "HitPoints";
				_hps = [];
				_funcGetHitPoints = 
				{
					for "_i" from 0 to ((count _this) - 1) do 
					{
						private ["_hp"];
						_hp = configName (_this select _i);
						if(!(_hp in _hps))then 
						{
							_hps set [count _hps, _hp];
						};
					};
				};
				while{(configName _cfgHitPoints) != ""}do 
				{
					_cfgHitPoints call _funcGetHitPoints;
					_cfgHitPoints = inheritsFrom _cfgHitPoints;
				};
				_hps
			};
			_hitpoints = _vehicle call vehicle_getHitpoints;
			{
				_hitpoint = _x;
				_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _hitpoint >> "name");
				_vehicle setHit[_selection,0];
				_strH = ("hit_" + (_selection));
				_vehicle setVariable[_strH,0,true];
			} forEach _hitpoints;
			if(!isNil "server_updateObject")then
			{
				PVDZE_veh_SFuel = [_vehicle,1];
				publicVariable "PVDZE_veh_SFuel";
				[_vehicle,"repair"] call server_updateObject;
			};
			_sl = format["%1 AdminRepair %2",_clientName,_type];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == 52)then
		{
			_pos = _array select 2;
			_vehicles = _pos nearEntities [['LandVehicle','Air','Ship'],15];
			
			{
				if(!isNull _x)then
				{
					clearVehicleInit _x;
					_x setVehicleInit 'this setVectorUp [0,0,1];';
				};
			} forEach _vehicles;
			
			_sl = format["%1 Flipped vehicles @%2",_clientName,_pos];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == 8)then
		{
			_do = format["if(getPlayerUID player == '%1')then
			{
				{player removeMagazine _x;} forEach (magazines player);
				removeAllWeapons player;
				removebackpack player;
			};", getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 91)then
		{
			_msg = _array select 2;
			_clr = _array select 3;
			if(typeName _msg == 'ARRAY')then{_msg = toString _msg;};
			fnc_show_colorAdminMsg = [_msg,_clr];
			publicVariable 'fnc_show_colorAdminMsg';
		};
		if(_option == 10)then
		{
			_do = format["if(getPlayerUID player == '%1')then
			{
				(findDisplay 46) closeDisplay 0;
			};", getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 111)then
		{
			_do = format['if(!isServer)then
			{
				{
					if(name _x == ''%1'')then
					{
						_i = [_x,4,time,false,false] spawn BIS_Effects_Burn;
					};
				} forEach ([0,0,0] nearEntities [''AllVehicles'', 10000000]);
				if(name player == ''%1'')then
				{
					[] spawn {
						_addup = 0;
						while{alive player}do
						{
							_xxx = (round(random 250));
							_yyy = (round(random 250));
							_equals = _xxx + _yyy;
							if(_equals < 300)then{_equals = 333;};
							r_player_blood = r_player_blood - _equals;
							_addup = _addup + _equals;
							if(_addup >= 12000)exitWith {(findDisplay 46) closeDisplay 0;};
							uiSleep 0.5;
						};
					};
				};
			};', name (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 110)then
		{
			_do = format["if(!isServer)then
			{
				if(getPlayerUID player == '%1')then
				{
					_vehicle = vehicle player;
					_hitpoint = '%2';
					_type = typeOf _vehicle;
					_selection = getText(configFile >> 'cfgVehicles' >> _type >> 'HitPoints' >> _hitpoint >> 'name');
					_vehicle setHit[_selection,%3];
					_strH = ('hit_' + (_selection));
					_vehicle setVariable[_strH,%3,true];
				};
			};", getPlayerUID (_array select 2),_array select 3,_array select 4];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 112)then
		{
			_do = format['if(!isServer)then
			{
				if(getPlayerUID player == "%1")then{disableUserInput true;};
			};', getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 113)then
		{
			_do = format['if(!isServer)then
			{
				if(getPlayerUID player == "%1")then{disableUserInput false;};
			};', getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 11)then
		{
			_do = format['if(getPlayerUID player == "%1")then
			{
				fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
				_unit = player;
				if(_unit == player)then
				{
					r_player_timeout = 30;
					r_player_unconscious = true;
					player setVariable["medForceUpdate",true,true];
					player setVariable["unconsciousTime", r_player_timeout, true];
				};
				if(vehicle _unit != _unit)then
				{
					_unit spawn {
						private["_veh","_unit"];
						_veh = vehicle _this;
						_unit = _this;
						waitUntil{(((getPos _veh select 2 < 1) && (speed _veh < 1)) || (!r_player_unconscious))};
						if(r_player_unconscious)then{
							_unit action ["eject", _veh];
							waitUntil{((vehicle _this) != _this)};
							uiSleep 1;
							_unit setVariable["NORRN_unconscious", true, true];
							_unit playActionNow "Die";
						};
					};
				}
				else
				{
					_unit setVariable["NORRN_unconscious", true, true];
					_unit playActionNow "Die";
				};
			};', getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 14)then 
		{
			{deleteVehicle _x;} forEach allMissionObjects "Foodbox0";
			{
				if((((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 200) || (count ([currentWeapon _x] + (weapons _x) + (magazines _x)) > 40))then 
				{
					deleteVehicle _x;
				};
			} forEach allMissionObjects "ALL";
		};
		if(_option == 15)then
		{
			_do = format['if(getPlayerUID player == "%1")then
			{
				[] spawn {
					if(isNil "druggedbiatch")then
					{
						druggedbiatch = true;
						hint "You took drugs YOLOLOLO";
						_mytime = time;
						while{druggedbiatch}do
						{
							nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
							nonapsi_ef ppEffectEnable true;
							nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
							nonapsi_ef ppEffectCommit 1;
							uiSleep random(1);
							wetdist1 = ppEffectCreate ["wetDistortion", 2006];
							wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
							wetdist1 ppEffectEnable true;
							wetdist1 ppEffectCommit 0;
							ppe = ppEffectCreate ["colorCorrections", 1555]; 
							ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
							ppe ppEffectCommit 1;
							ppe ppEffectEnable true; 
							ppe2 = ppEffectCreate ["chromAberration", 1555]; 
							ppe2 ppEffectAdjust [0.01,0.01,true];
							ppe2 ppEffectCommit 1;
							ppe2 ppEffectEnable true;
							ppe3 = ppEffectCreate ["radialBlur", 1555]; 
							ppe3 ppEffectEnable true;
							ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15];
							ppe3 ppEffectCommit 1;
							uiSleep random(1);
							wetdist1 = ppEffectCreate ["wetDistortion", 2006];
							wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
							wetdist1 ppEffectEnable true;
							wetdist1 ppEffectCommit 0;
							uiSleep random(1);
							nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
							nonapsi_ef ppEffectEnable true;
							nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
							nonapsi_ef ppEffectCommit 1;
							uiSleep random(1);
							if(_mytime + 30 < time)exitWith {};
						};
						ppEffectDestroy nonapsi_ef;
						ppEffectDestroy ppe;
						ppEffectDestroy ppe2;
						ppEffectDestroy ppe3;
						ppEffectDestroy wetdist1;
						setaperture 0;
						"dynamicBlur" ppEffectAdjust [0];
						"dynamicBlur" ppEffectCommit 16;
						"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 0.0]];
						"colorCorrections" ppEffectCommit 0;
					};
				};
			};', getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 16)then
		{
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
			PVAH_AHTMPBAN = [];
			publicVariable 'PVAH_AHTMPBAN';
		};
		if(_option == 17)then
		{
			_playerObj = _array select 2;
			_clientUID = (getPlayerUID _playerObj);
			_clientName = 'DEAD';if((alive _playerObj)&&(getPlayerUID _playerObj != ''))then{_clientName = name _playerObj;};
			[_clientUID,_clientName,_playerObj] call fnc_infiSTAR_ServerkickNew;
		};
		if(_option == 18)then
		{
			_playerObj = _array select 2;
			_clientUID = (getPlayerUID _playerObj);
			_clientName = 'DEAD';if((alive _playerObj)&&(getPlayerUID _playerObj != ''))then{_clientName = name _playerObj;};
			[_clientUID,_clientName,_playerObj] call fnc_infiSTAR_ServerkickNew;
			
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
			if(!(_clientUID in PVAH_AHTMPBAN) || !(_clientName in PVAH_AHTMPBAN))then
			{
				PVAH_AHTMPBAN = PVAH_AHTMPBAN + [_clientUID,_clientName];
				publicVariable 'PVAH_AHTMPBAN';
				if((_array select 3) == 2)then
				{
					'ARMA_BAN' callExtension format[':%1',_clientUID];
				};
			};
		};
		if(_option == 182)then
		{
			_uid = _array select 2;
			_name = _array select 3;
			if(isNil 'PVAH_AHTMPBAN')then{PVAH_AHTMPBAN = [];} else {if(typeName PVAH_AHTMPBAN != 'ARRAY')then{PVAH_AHTMPBAN = [];};};
			PVAH_AHTMPBAN = PVAH_AHTMPBAN - [_uid] - [_name];
			publicVariable 'PVAH_AHTMPBAN';
		};
		if(_option == 19)then
		{
			_selection = _array select 2;
			_intensity = _array select 3;
			switch (_selection) do {
				case 1:
				{
					dayzSetViewDistance = _intensity;publicVariable "dayzSetViewDistance";
					
					_sl = format["%1 Viewdistance %2",_clientName,_intensity];
					PVAH_WriteLogReq = [_playerObj,toArray _sl];
					publicVariableServer 'PVAH_WriteLogReq';
				};
				case 2:
				{
					dayzSetOvercast = _intensity;publicVariable "dayzSetOvercast";
					
					_sl = format["%1 Weather %2",_clientName,_intensity];
					PVAH_WriteLogReq = [_playerObj,toArray _sl];
					publicVariableServer 'PVAH_WriteLogReq';
				};
			};
		};
		if(_option == 20)then 
		{
			_offset = _array select 2;
			_date = [2012,1,1,_offset,0];
			if(!isNil 'PVDZE_plr_SetDate')then{
				PVDZE_plr_SetDate = _date;
				publicVariable 'PVDZE_plr_SetDate';
			};
			if(!isNil 'dayzSetDate')then{
				dayzSetDate = _date;
				publicVariable 'dayzSetDate';
			};
			setDate _date;
			server_timeSync = {};
			
			_sl = format["%1 Time to %2",_clientName,_date];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == 21)then 
		{
			_do = format['if(getPlayerUID player == "%1")then
			{
				[] spawn {
					_vehicle_player = vehicle player;
					playsound "Ivn_notscared";
					playsound "Ivn_notscared";
					uiSleep 2;
					playSound "Gul_youshouldbe";
					playSound "Gul_youshouldbe";
					uiSleep 4;
					playSound "beat04";playSound "beat04";
					playSound "beat04";playSound "beat04";
					_vehicle_player SetVelocity [6,6,2];
					uiSleep 1.25;
					playSound "beat04";playSound "beat04";
					playSound "beat04";playSound "beat04";
					_vehicle_player SetVelocity [6,6,2];
					uiSleep 1.25;
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					uiSleep 2.25;
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					playSound "All_haha";
					
					cutText ["You Got Punished By An Admin", "PLAIN"];
				};
			};', getPlayerUID (_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 22)then
		{
			_UID = getPlayerUID (_array select 2);
			_do = "if(getPlayerUID player == "+str _UID+")then
			{
				[] spawn {
					canAbort = true;
					_swep = '';
					{
						if((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2)exitWith
						{
							_swep = _x;
						};
					} forEach (weapons player);
					if(_swep != '')then
					{
						player selectWeapon _swep;
					};
					
					cutText [format['You think about your family... 10 Seconds'], 'PLAIN DOWN'];
					uiSleep 4;
					cutText [format['Your little daughter, and what happened to her... 6 Seconds'], 'PLAIN DOWN'];
					uiSleep 4;
					cutText [format['You cant take this shit any longer... 2 Seconds'], 'PLAIN DOWN'];
					uiSleep 2;
					cutText [format['I come to you Sahra! Goodbye cruel world!'], 'PLAIN DOWN'];
					canAbort = false;
					player playmove 'ActsPercMstpSnonWpstDnon_suicide1B';
					uiSleep 8.4;
					player_fired = {
						[player,'suicide'] spawn player_death;
						player setHit['Body',1];
					};
					player addEventHandler ['Fired', {_this call player_fired;}];
					player fire (currentWeapon player);
				};
			};";
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 23)then
		{
			dayzPlayerDeathsResult = PlayerDeaths;
			PVDZE_plr_DeathBResult = PlayerDeaths;
			if(!isNull _playerObj)then{
				_clientID publicVariableClient "dayzPlayerDeathsResult";
				_clientID publicVariableClient "PVDZE_plr_DeathBResult";
			};
		};
		if(_option == 24)then
		{
			_do = format["if(name player == '%1')then
			{
				[] spawn {
					closedialog 0;cutText ['','PLAIN',0];Titletext ['','PLAIN',0];endLoadingScreen;0 fadeSound 1;disableUserInput false;
					_model = '%2';
					if(_model isKindOf 'CAAnimalBase')then
					{
						{player removeMagazine _x;} forEach (magazines player);
						removeAllWeapons player;
						removebackpack player;
					};
					[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
					waitUntil {typeOf player == _model};
					_ok = player getVariable['Admin_1_Morph','ok'];if(_ok == 'ok')then{player setVariable['Admin_1_Morph',_model,true];};
					uiSleep 0.1;
					_ok = player getVariable['Admin_1_Morph','ok'];if(_ok == 'ok')then{player setVariable['Admin_1_Morph',_model,true];};
					vehicle player switchCamera 'EXTERNAL';
				};
			};",(_array select 2),(_array select 3)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 25)then
		{
			_do = format["if(name player == '%1')then
			{
				[] spawn {
					_obj = player;
					_mags = getArray (configFile >> 'CfgWeapons' >> currentWeapon vehicle _obj >> 'magazines');
					_mag = _mags select 0;
					vehicle _obj addMagazine _mag;
				};
			};",(_array select 2)];
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 26)then
		{
			_object = (_array select 2);
			_class = typeOf _object;
			_worldspace = [getDir _object,getPosATL _object];
			
			_characterID = 0;
			_characterID = _object getVariable["CharacterID","0"];
			_uid = _worldspace call dayz_objectUID3;
			
			_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
			_key call server_hiveWrite;
			
			[_object,_uid,_characterID,_class] spawn {
				_object = _this select 0;
				_uid = _this select 1;
				_characterID = _this select 2;
				_class = _this select 3;
				
				_done = false;
				_retry = 0;
				while{_retry < 10}do
				{
					uiSleep 0.3;
					_key = format["CHILD:388:%1:",_uid];
					_result = _key call server_hiveReadWrite;
					_outcome = _result select 0;
					if(_outcome == "PASS")then
					{
						_oid = _result select 1;
						_object setVariable["ObjectID", _oid, true];
						_done = true;
						_retry = 100;
					}
					else
					{
						_done = false;
						_retry = _retry + 1;
					};
				};
				
				_object setvelocity [0,0,1];
				_object allowDamage false;
				_object setVariable["lastUpdate",time];
				if(!isNil '_characterID')then{_object setVariable["CharacterID", _characterID, true];};
				if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
				if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
				uiSleep 1;
				_object call fnc_veh_ResetEH;
				PVDZE_veh_Init = _object;
				publicVariable "PVDZE_veh_Init";
				[_object,"all"] spawn server_updateObject;
				_object allowDamage true;
			};
			
			_sl = format["%1 saved -  %2 (characterID: %3)  - to the database",_clientName,typeOf (_array select 2),_characterID];
			PVAH_WriteLogReq = [_playerObj,toArray _sl];
			publicVariableServer 'PVAH_WriteLogReq';
		};
		if(_option == 666)then
		{
			_UID = getPlayerUID (_array select 2);
			_do = "if(getPlayerUID player == "+str _UID+")then
			{
				r_player_blood = r_player_blood - 200;
				player setVariable['USEC_BloodQty',r_player_blood,true];
			};";
			_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
		};
		if(_option == 9001)then
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				_b0x_wpnlist = 
				['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
				'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
				'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
				'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
				'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
				'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
				'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
				'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
				'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
				'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014','m107_DZ',
				'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
				'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
				'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
				'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
				'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
				'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
				'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
				'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
				'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
				'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
				'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
				'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','NVGoggles'];
				_b0x_maglist = 
				['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
				'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
				'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
				'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
				'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
				'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
				'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
				'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
				'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
				'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
				'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
				'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
				'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
				'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
				'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
				'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
				'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
				'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
				'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
				'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
				'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
				'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
				'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
				'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
				'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
				'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
				'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
				'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
				'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
				'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
				'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
				
				{_b0x addWeaponCargoGlobal [_x, 5];} forEach _b0x_wpnlist;
				{_b0x addMagazineCargoGlobal [_x, 20];} forEach _b0x_maglist;
				_b0x addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];
			};
		};
		if(_option == 9002)then 
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				if(isNil "PV_b0x_wpnlist")then
				{
					PV_b0x_wpnlist = [];
					_CfgWeapons = configFile >> "CfgWeapons";
					for "_i" from 0 to (count _CfgWeapons)-1 do
					{
						_weapon = _CfgWeapons select _i;
						if(isClass _weapon)then
						{
							_wpn_type = configName(_weapon);
							_plx = toArray _wpn_type;
							_plx resize 7;
							_plx;
							_plx = toString _plx;
							if(((_plx != "ItemKey") || (_wpn_type == "ItemKeyKit")) && (_wpn_type != "MineE"))then
							{
								if(((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != ""))then
								{
									PV_b0x_wpnlist = PV_b0x_wpnlist + [_wpn_type];
								};
							};
						};
					};
					uiSleep 2;
				};
				
				if(isNil "PV_b0x_maglist")then
				{
					PV_b0x_maglist = [];
					_CfgWeapons = configFile >> "CfgMagazines";
					for "_i" from 0 to (count _CfgWeapons)-1 do
					{
						_weapon = _CfgWeapons select _i;
						if(isClass _weapon)then
						{
							_wpn_type = configName(_weapon);
							if(((getNumber (_weapon >> "scope") == 0) || (getNumber (_weapon >> "scope") == 2)) && (getText (_weapon >> "picture") != "") && !(_wpn_type in ['AngelCookies','Skinbase']))then
							{
								PV_b0x_maglist = PV_b0x_maglist + [_wpn_type];
							};
						};
					};
					uiSleep 2;
				};
				
				{_b0x addWeaponCargoGlobal [_x, 5];} forEach PV_b0x_wpnlist;
				{_b0x addMagazineCargoGlobal [_x, 20];} forEach PV_b0x_maglist;
				_b0x addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
			};
		};
		if(_option == 9003)then
		{
			_dir = getdir _playerObj;
			_pos = getPosATL _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox0' createVehicle _pos;
				_b0x setPosATL _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				
				{_b0x addMagazineCargoGlobal [_x, 40];} forEach ['ItemWoodWallGarageDoor','ItemWoodWallGarageDoorLocked',
				'ItemWoodFloorHalf','ItemWoodWallDoorLg','ItemWoodWallWithDoorLgLocked','ItemWoodWallLg',
				'ItemWoodWallWindowLg','ItemWoodFloorQuarter','ItemWoodWallDoor','ItemWoodWallWithDoorLocked',
				'ItemWoodWall','ItemWoodWallWindow','ItemWoodWallThird','ItemWoodLadder','ItemWoodFloor','ItemWoodStairs',
				'ItemWoodStairsSupport','ItemTentDomed2','ItemTentDomed','ItemTent','ItemTankTrap',
				'ItemSandbagLarge','ItemSandbag','ItemPole','ItemCorrugated','ItemCanvas','ItemBurlap','PartWoodLumber',
				'PartWoodPlywood','bulk_empty','wooden_shed_kit','wood_shack_kit','workbench_kit','stick_fence_kit',
				'sandbag_nest_kit','sun_shade_kit','rusty_gate_kit','outhouse_kit','storage_shed_kit','light_pole_kit',
				'ItemLightBulb','desert_net_kit','forest_net_kit','desert_large_net_kit','forest_large_net_kit',
				'metal_panel_kit','ItemComboLock','FoodMRE','CinderBlocks','deer_stand_kit',
				'ItemGoldBar10oz','ItemSilverBar10oz','ItemGoldBar','ItemSilverBar','MortarBucket',
				'ItemCopperBar','ItemCopperBar10oz','ItemBriefcase100oz','ItemBriefcase80oz','ItemFireBarrel_kit',
				'ItemBriefcase60oz','ItemBriefcase40oz','ItemBriefcase20oz','ItemGunRackKit','ItemOilBarrel','ItemFuelBarrel',
				'm240_nest_kit','ItemLockbox','metal_floor_kit','cinder_wall_kit','cinder_garage_kit','cinder_door_kit',
				'ItemVault','ItemGenerator','Skin_Rocker2_DZ','30m_plot_kit','Skin_SurvivorW2_DZ','Skin_Functionary1_EP1_DZ',
				'Skin_Haris_Press_EP1_DZ','Skin_Priest_DZ','Skin_SurvivorWpink_DZ','Skin_SurvivorWurban_DZ',
				'Skin_SurvivorWcombat_DZ','Skin_SurvivorWdesert_DZ','Skin_Survivor2_DZ','fuel_pump_kit','ItemFuelPump',
				'Skin_Rocker1_DZ','Skin_Rocker3_DZ','Skin_RU_Policeman_DZ','Skin_Pilot_EP1_DZ',
				'Skin_Rocker4_DZ','Skin_Bandit1_DZ','Skin_Bandit2_DZ','Skin_GUE_Commander_DZ',
				'Skin_GUE_Soldier_2_DZ','Skin_GUE_Soldier_CO_DZ','Skin_GUE_Soldier_Crew_DZ',
				'Skin_GUE_Soldier_MG_DZ','Skin_GUE_Soldier_Sniper_DZ','Skin_Ins_Soldier_GL_DZ',
				'Skin_TK_INS_Soldier_EP1_DZ','Skin_TK_INS_Warlord_EP1_DZ','Skin_BanditW1_DZ','park_bench_kit',
				'Skin_BanditW2_DZ','Skin_CZ_Special_Forces_GL_DES_EP1_DZ','Skin_Drake_Light_DZ','PartPlankPack',
				'Skin_Soldier_Sniper_PMC_DZ','Skin_FR_OHara_DZ','Skin_FR_Rodriguez_DZ','ItemSandbagExLarge',
				'Skin_CZ_Soldier_Sniper_EP1_DZ','Skin_Graves_Light_DZ','Skin_Soldier_Bodyguard_AA12_PMC_DZ',
				'Skin_Camo1_DZ','Skin_Rocket_DZ','Skin_Sniper1_DZ','Skin_Soldier1_DZ','Skin_Soldier_TL_PMC_DZ','wood_ramp_kit'];
				{_b0x addWeaponCargoGlobal [_x, 20];} forEach ['ItemFishingPole','ItemSledge','ItemKeyKit','ItemToolbox','ItemEtool'];
			};
		};
		if(_option == 9004)then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['ItemWoodWallLg','ItemWoodFloorQuarter','ItemWoodStairs',
				'ItemWoodWallWithDoorLgLocked','ItemWoodWallGarageDoorLocked','ItemLockBox','ItemVault','ItemSledgeHead','ItemSledgeHandle','30m_plot_kit','workbench_kit'];
				_b0x addWeaponCargoGlobal ['ItemToolbox', 1];
				_b0x addWeaponCargoGlobal ['ItemCrowbar', 1];
				_b0x addWeaponCargoGlobal ['ItemEtool', 1];
			};
		};
		if(_option == 9005)then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['ItemVault','ItemSledgeHead','ItemSledgeHandle','storage_shed_kit','30m_plot_kit','workbench_kit'];
				_b0x addMagazineCargoGlobal ['cinder_wall_kit', 15];
				_b0x addMagazineCargoGlobal ['MortarBucket', 10];
				_b0x addMagazineCargoGlobal ['CinderBlocks', 30];
				_b0x addMagazineCargoGlobal ['cinder_garage_kit', 2];
				_b0x addMagazineCargoGlobal ['ItemTankTrap', 6];
				_b0x addMagazineCargoGlobal ['ItemPole', 6];
				_b0x addMagazineCargoGlobal ['ItemComboLock', 2];
				_b0x addMagazineCargoGlobal ['ItemWoodLadder', 2];
				_b0x addMagazineCargoGlobal ['ItemWoodStairs', 3];
				_b0x addMagazineCargoGlobal ['metal_floor_kit', 8];
				{_b0x addWeaponCargoGlobal [_x, 1];} forEach
				[
				'ItemToolbox',
				'ItemCrowbar',
				'ItemEtool'
				];
			};
		};
		if(_option == 9006)then
		{
			_dir = getdir _playerObj;
			_pos = getPos _playerObj;
			_pos = [(_pos select 0)+2*sin(_dir),(_pos select 1)+2*cos(_dir),(_pos select 2)];
			[_dir,_pos,_playerObj] spawn {
				_dir = _this select 0;
				_pos = _this select 1;
				_b0x = 'Foodbox1' createVehicle _pos;
				clearWeaponCargoGlobal _b0x;
				clearmagazinecargoGlobal _b0x;
				_b0x setPosATL _pos;
				{_b0x addMagazineCargoGlobal [_x, 1];} forEach ['30m_plot_kit','workbench_kit'];
				{_b0x addMagazineCargoGlobal [_x, 25];} forEach
				[
				'cinder_wall_kit'
				];
				{_b0x addMagazineCargoGlobal [_x, 15];} forEach
				[
				'MortarBucket'
				];
				{_b0x addMagazineCargoGlobal [_x, 50];} forEach
				[
				'CinderBlocks'
				];
				{_b0x addMagazineCargoGlobal [_x, 4];} forEach
				[
				'cinder_garage_kit',
				'ItemComboLock',
				'ItemWoodLadder'
				];
				{_b0x addMagazineCargoGlobal [_x, 12];} forEach
				[
				'ItemTankTrap',
				'ItemPole'
				];
				{_b0x addMagazineCargoGlobal [_x, 6];} forEach
				[
				'ItemWoodStairs'
				];
				{_b0x addMagazineCargoGlobal [_x, 15];} forEach
				[
				'metal_floor_kit'
				];
				{_b0x addMagazineCargoGlobal [_x, 2];} forEach
				[
				'ItemVault',
				'ItemSledgeHead',
				'ItemSledgeHandle',
				'storage_shed_kit'
				];
				{_b0x addWeaponCargoGlobal [_x, 2];} forEach
				[
				'ItemToolbox',
				'ItemCrowbar',
				'ItemEtool'
				];
			};
		};
		if(_option == 9000)then
		{
			private ['_weapons', '_magazines', '_backpack', '_selected', '_worldspace', '_combination', '_inventory'];
			_selected = _array select 2;
			_worldspace = _array select 3;
			_combination = _array select 4;
			
			_inventory = _selected call fnc_getSupportVaultContent;
			if(isNil'_inventory')exitWith{diag_log format['<infiSTAR.de> PVAH_AdminReq %1: nil _inventory',_option]};
			if(typeName _inventory != 'ARRAY')exitWith{diag_log format['<infiSTAR.de> PVAH_AdminReq %1: typeName _inventory != ARRAY -> %2',_option,typeName _inventory]};
			if(count _inventory != 3)exitWith{diag_log format['<infiSTAR.de> PVAH_AdminReq %1: count _inventory != 3 -> %2',_option, count _inventory]};
			
			[_worldspace, _combination, _inventory, _playerObj] call {
				private ['_worldspace', '_combination', '_inventory', '_player', '_uid', '_key', '_vault'];
				_worldspace = _this select 0;
				_combination = _this select 1;
				_inventory = _this select 2;
				_player = _this select 3;
				
				_uid = _worldspace call dayz_objectUID3;
				
				_key = format['CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:',
					dayZ_instance,
					'VaultStorageLocked',
					0 ,
					_combination,
					_worldspace,
					[],
					[],
					0,
					_uid
				];
				_key call server_hiveWrite;
				
				_vault = createVehicle ['VaultStorageLocked', [0,0,0], [], 0, 'CAN_COLLIDE'];
				_vault setDir (_worldspace select 0);
				_vault setPosATL (_worldspace select 1);
				
				_vault setVariable ['lastUpdate',time];
				_vault setVariable ['ObjectUID', _uid,true];
				_vault setVariable ['OEMPos',(_worldspace select 1),true];
				_vault setVariable ['CharacterID',_combination,true];
				
				_vault enableSimulation false;
				
				PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_vault];
				
				_vault setVariable ['WeaponCargo', _inventory select 0, true];
				_vault setVariable ['MagazineCargo', _inventory select 1, true];
				_vault setVariable ['BackpackCargo', _inventory select 2, true];
				
				_key = format['CHILD:309:%1:%2:',_uid,_inventory];
				_key call server_hiveWrite;
			};
		};
		if(_option == 9099)then
		{
			_playerObj = _array select 1;
			_selected = _array select 2;
			_pos = _array select 3;
			
			_b0x = 'Foodbox1' createVehicle _pos;
			clearWeaponCargoGlobal _b0x;
			clearmagazinecargoGlobal _b0x;
			_b0x setPosATL _pos;
			
			_arrayforcrate = _selected call fnc_getSupportBoxContent;
			if(isNil'_arrayforcrate')exitWith{diag_log format['<infiSTAR.de> PVAH_AdminReq %1: nil _arrayforcrate',_option]};
			
			if(str _arrayforcrate == '[]')exitWith{};
			{
				if(typeName _x == 'ARRAY')then
				{
					_item = _x select 0;
					_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
					if(_BackPack)then
					{
						_b0x addBackpackCargoGlobal [_item,_x select 1];
					}
					else
					{
						if(isClass (configFile >> 'CfgWeapons' >> _item))then
						{
							_b0x addWeaponCargoGlobal [_item,_x select 1];
						};
						if(isClass (configFile >> 'CfgMagazines' >> _item))then
						{
							_b0x addMagazineCargoGlobal [_item,_x select 1];
						};
					};
				}
				else
				{
					_item = _x;
					_BackPack = getText (configfile >> 'CfgVehicles' >> _item >> 'vehicleClass') == 'BackPacks';
					if(_BackPack)then
					{
						_b0x addBackpackCargoGlobal [_item,1];
					}
					else
					{
						if(isClass (configFile >> 'CfgWeapons' >> _item))then
						{
							_b0x addWeaponCargoGlobal [_item,1];
						};
						if(isClass (configFile >> 'CfgMagazines' >> _item))then
						{
							_b0x addMagazineCargoGlobal [_item,1];
						};
					};
				};
			} forEach _arrayforcrate;
		};
	};
	server_onPlayerConnect_infiSTAR =
	{
		_log = format['infiSTAR.de PlayerConnected: %1',_this];
		diag_log (_log);
		_this call fnc_infiSTAR_PlayerLog;
	};
	waitUntil {uiSleep 0.1;
		!isNil 'server_onPlayerConnect_infiSTAR' && 
		!isNil 'fnc_infiSTAR_ServerkickNew' && 
		!isNil 'fnc_WriteLogReqq' && 
		!isNil 'fnc_AdminReqProceed'
	};
	_server_onPlayerConnect_infiSTAR = server_onPlayerConnect_infiSTAR;
	_fnc_infiSTAR_ServerkickNew = fnc_infiSTAR_ServerkickNew;
	_fnc_WriteLogReqq = fnc_WriteLogReqq;
	_fnc_AdminReqProceed = fnc_AdminReqProceed;
	
	_fnc_WriteLogReq = {'test'};
	fnc_WriteLogReq = _fnc_WriteLogReq;
	while{1 == 1}do
	{
		breakshitbyben = 'no breaking logs please.';
		if(str fnc_WriteLogReq != str _fnc_WriteLogReq)then
		{
			_fnc_WriteLogReq = fnc_WriteLogReq;
			
			_log = format['fnc_WriteLogReq CHANGED: %1',fnc_WriteLogReq];
			diag_log ('infiSTAR.de Log: '+_log);
			'ARMA_LOG' callExtension format['A2_HACKLOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
		};
		
		server_onPlayerConnect_infiSTAR = _server_onPlayerConnect_infiSTAR;
		onPlayerConnected {[_uid,_name] call server_onPlayerConnect_infiSTAR;};
		fnc_infiSTAR_ServerkickNew = _fnc_infiSTAR_ServerkickNew;
		if(str fnc_WriteLogReqq != str _fnc_WriteLogReqq)then
		{
			_log = format['fnc_WriteLogReqq CHANGED: %1',fnc_WriteLogReqq];
			diag_log ('infiSTAR.de Log: '+_log);
			'ARMA_LOG' callExtension format['A2_HACKLOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
			fnc_WriteLogReqq = _fnc_WriteLogReqq;
		};
		fnc_AdminReqProceed = _fnc_AdminReqProceed;
		'PVAH_WriteLogReq' addPublicVariableEventHandler {_this call fnc_WriteLogReqq;};
		uiSleep 1;
	};
};
[] spawn {
	waitUntil {uiSleep 0.1;!isNil 'sm_done'};
	uiSleep 30;
	{
		if(!isNull _x)then{_x addMPEventHandler ["MPKilled",{_this call infiSTAR_object_handleServerKilled;}];};
	} forEach ([0,0,0] nearEntities [['LandVehicle','Air','Ship'], 10000000]);
	infiSTAR_object_handleServerKilled =
	{
		private['_unit','_objectID','_objectUID','_source','_entities'];
		_unit = _this select 0;
		_source = _this select 1;
		if(isNil '_unit')then{_unit = objNull;};
		if(isNil '_source')then{_source = objNull;};
		
		_log = '';
		_name = '';
		_uid = '';
		
		_objectID 	= _unit getVariable['ObjectID','0'];
		_objectUID 	= _unit getVariable['ObjectUID','0'];
		_worldSpace = [getDir _unit,getPosATL _unit];
		_nearby = [];
		_entities = _unit nearEntities [['Man'], 200];
		{
			if(!isNull _x)then
			{
				_nearguy = _x;
				if(getPlayerUID _nearguy != '')then
				{
					{
						if(!isNull _x)then
						{
							if(getPlayerUID _x != '')then
							{
								_namex = 'DEAD';if((alive _x)&&(getPlayerUID _x != ''))then{_namex = name _x;};
								_logN = format['%1 (%2)',_namex,getPlayerUID _x];
								if !(_logN in _nearby)then
								{
									_nearby = _nearby + [_logN];
								};
							};
						};
					} forEach (crew vehicle _nearguy);
				};
			};
		} forEach _entities;
		
		if(!isNull _source)then
		{
			_uid = getPlayerUID _source;
			if(_uid != '')then
			{
				_name = 'UNKNOWN';if((alive _source)&&(getPlayerUID _source != ''))then{_name = name _source;};
			};
		};
		
		if(!isNull _unit)then
		{
			_locked = '';
			if(locked _unit)then{_locked = 'Locked ';};
			_characterID = '0';_characterID = _unit getvariable['CharacterID','0'];
			if(_uid != '')then
			{
				_log = format['%10Vehicle destroyed with %9 @%7 by %1 (%2) - %3, worldspace %4, CharId %11, objID %5, objUID %6, nearby %8',
				_name,_uid,typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition _unit,_nearby,weaponState _source,_locked,_characterID];
			}
			else
			{
				_log = format['%7Vehicle destroyed @%5 - %1, worldspace %2, CharId %8, objID %3, objUID %4, nearby %6',
				typeOf _unit,_worldSpace,_objectID,_objectUID,mapGridPosition _unit,_nearby,_locked,_characterID];
			};
		};
		diag_log ('infiSTAR.de Log: '+_log);
		'ARMA_LOG' callExtension format['A2_VEHICLE_DESTROYED_LOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
		PV_SurveillanceLog = PV_SurveillanceLog + [[[_name,_uid,_log],'','0','1','0','0',[]]];
		publicVariable 'PV_SurveillanceLog';
		true
	};
};
[] spawn {
	waitUntil {uiSleep 0.1;!isNil 'sm_done'};
	uiSleep 5;
	infiSTAR_customSend =
	{
		private ['_unit','_variable','_arraytosend','_source','_humanityHit','_arr'];
		_arr = (_this select 1);
		_unit = _arr select 0;
		_variable = _arr select 1;
		_arraytosend = _arr select 2;
		if(_variable == 'Humanity')then
		{
			_source = _arraytosend select 0;
			_humanityHit = _arraytosend select 1;
			if(abs _humanityHit > 12000)then
			{
				if(!isNull _source)then
				{
					_clientUID = getPlayerUID _source;
					if(_clientUID != '')then
					{
						if((vehicle _source) isKindOf 'Man')then
						{
							_clientName = name _source;
							
							deleteVehicle (vehicle _source);
							_do = format['if(!isServer)then
							{
								if(getPlayerUID player == ''%1'')then
								{
									removeAllWeapons player;
								};
							};',_clientUID];
							_tmpu=createAgent['Rabbit',[2500,2500,0],[],0,'FORM'];_tmpu setVehicleInit _do;processInitCommands;clearVehicleInit _tmpu;deleteVehicle _tmpu;
							
							_log = format['%1 (%2) - Significant humanity change (%3)!.. damage hack?',_clientName,_clientUID,_humanityHit];
							diag_log ('infiSTAR.de Log: '+_log);
							'ARMA_LOG' callExtension format['A2_HACKLOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
							PV_hackerL0og = PV_hackerL0og + [[_log,'','0','1','0','0',[]]];
							publicVariable 'PV_hackerL0og';
						};
					};
				};
			};
		};
		if(_variable == 'SafeZoneState')then
		{
			_state = _arraytosend select 0;
			_pos = getPosATL _unit;
			_GPS = mapGridPosition _pos;
			_msg = '   Entered SafeZone';
			if(_state == 0)then
			{
				_msg = '   Left SafeZone';
			};
			_log = format['%1(%2) - %3 @%4',name _unit,getPlayerUID _unit,_msg,_GPS];
			diag_log ('infiSTAR.de Log: '+_log);
			'ARMA_LOG' callExtension format['A2_SAFEZONELOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
		};
	};
	'PVDZE_send' addPublicVariableEventHandler
	{
		(_this select 1) call server_sendToClient;
		_this call infiSTAR_customSend;
	};
	if(!isNil 'server_logUnlockLockEvent')then
	{
		server_logUnlockLockEvent = {
			private['_obj','_player','_objectID','_objectUID','_pos','_worldspace','_log','_codeEntered','_doorCode','_status','_statusText'];
			_obj = _this select 1;
			if(!isNull _obj)then
			{
				_player = _this select 0;
				_objectID = _obj getVariable['ObjectID', '0'];
				_objectUID = _obj getVariable['ObjectUID', '0'];
				
				_log = '';
				if(count _this > 3)then
				{
					_codeEntered = _this select 3;
					if(_codeEntered == 'NOTHING ENTERED')then{_player setDamage 5;_codeEntered = '-HACKER KILLED-';};
					if(_codeEntered == '')then{_codeEntered = '000';};
					_doorCode = _this select 4;
					if(_codeEntered==_doorCode)then
					{
						_nameP = 'DEAD';if((alive _player)&&(getPlayerUID _player != ''))then{_nameP = name _player;};
						_log = format['DOOR UNLOCKED: ID:%1 UID:%2 BY %3(%4) @%5 Code Entered: %6',_objectID,_objectUID,_nameP,(getPlayerUID _player),(mapGridPosition _obj),_codeEntered];
					}
					else
					{
						_nameP = 'DEAD';if((alive _player)&&(getPlayerUID _player != ''))then{_nameP = name _player;};
						_log = format['DOOR UNLOCK ATTEMPT: ID:%1 UID:%2 BY %3(%4) @%5 Code Entered: %6 | Correct Code: %7',_objectID,_objectUID,_nameP,(getPlayerUID _player),(mapGridPosition _obj),_codeEntered,_doorCode];
					};
				}
				else
				{
					_status = _this select 2;
					_statusText = 'UNLOCKED';
					if(_status)then
					{
						[_obj, 'gear'] call server_updateObject;
						_statusText = 'LOCKED';
					};
					_nameP = 'DEAD';if((alive _player)&&(getPlayerUID _player != ''))then{_nameP = name _player;};
					_log = format['SAFE %6: ID:%1 UID:%2 BY %3(%4) @%5', _objectID, _objectUID, _nameP, (getPlayerUID _player), (mapGridPosition _obj), _statusText];
				};
				diag_log ('infiSTAR.de Log: '+_log);
				'ARMA_LOG' callExtension format['A2_UNLOCKLOCKLOG:%1%2',_log,DAYZ_INSTANCE_LOGGING];
			};
		};
	};
};
BIS_Effects_Burn={};
diag_log ('infiSTAR.de - AntiHack FULLY LOADED');
/* ********************************************************************************* */
/* *********************************www.infiSTAR.de********************************* */
/* *******************Developed by infiSTAR (infiSTAR23@gmail.com)****************** */
/* **************infiSTAR Copyright®© 2011 - 2015 All rights reserved.************** */
/* ********************************************************************************* */
/* ****DayZAntiHack.com***DayZAntiHack.de***ArmaAntiHack.com***Arma3AntiHack.com**** */