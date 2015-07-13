private["_exit","_forceUnsilenced","_forceSilenced","_pistolOptic","_pistolSilencer","_pistolLaser","_silenced","_iUniformItems","_oUniformItems","_bUniformItems","_iVestItems","_oVestItems","_bVestItems","_iBackpackItems","_oBackpackItems","_bBackpackItems","_radioConfig","_bBinocular","_oBinocular","_iBinocular","_bipod","_bBipod","_oBipod","_iBipod","_side","_bGps","_oGps","_iGps","_unit","_class","_visual","_uniform","_bUniform","_oUniform","_iUniform","_vest","_bVest","_oVest","_iVest","_backpack","_bBackpack","_oBackpack","_iBackpack","_goggles","_bGoggles","_oGoggles","_iGoggles","_helmet","_bHelmet","_oHelmet","_iHelmet","_weapon","_bWeapon","_oWeapon","_iWeapon","_weaponAmmo","_bWeaponAmmo","_oWeaponAmmo","_iWeaponAmmo","_weaponAttachements","_pistol","_bPistol","_oPistol","_iPistol","_pistolAmmo","_bPistolAmmo","_oPistolAmmo","_iPistolAmmo","_pistolAttachements","_launcher","_bLauncher","_oLauncher","_iLauncher","_launcherAmmo","_bLauncherAmmo","_oLauncherAmmo","_iLauncherAmmo","_binocular","_binocularAmmo","_uniformItems","_vestItems","_backpackItems","_linkedItems","_insignia","_uniformAmmo","_bUniformAmmo","_oUniformAmmo","_iUniformAmmo","_vestAmmo","_bVestAmmo","_oVestAmmo","_iVestAmmo","_backpackAmmo","_bBackpackAmmo","_oBackpackAmmo","_iBackpackAmmo","_silencer","_bSilencer","_oSilencer","_iSilencer","_laser","_bLaser","_oLaser","_iLaser","_optic","_bOptic","_oOptic","_iOptic","_watch","_map","_compass","_radio","_bRadio","_oRadio","_iRadio","_gps","_nv","_bNv","_oNv","_iNv"];

//if (!isClass (configFile >> "CfgPatches" >> "BWA3_Units")) exitWith {};
//if (!isClass (configFile >> "CfgPatches" >> "BWA3_Weapons")) exitWith {};
//if (!isClass (configFile >> "CfgPatches" >> "task_force_radio_items")) exitWith {};

_unit = [_this, 0, player] call BIS_fnc_param;
_class = [_this, 1, "B_Soldier_F"] call BIS_fnc_param;
_visual = [_this, 2, 0] call BIS_fnc_param;
_side = [_this, 3, side _unit] call BIS_fnc_param;
_forceUnsilenced = [_this, 4, false] call BIS_fnc_param;
_forceSilenced = [_this, 5, false] call BIS_fnc_param;
_isMedic = [_this, 6, false] call BIS_fnc_param;
_isExSpec = [_this, 7, false] call BIS_fnc_param;
_isPilot = [_this, 8, false] call BIS_fnc_param;

_class = toLower _class;
_exit = false;

switch (_class) do
{
	case toLower "freizeit":
	{
		removeAllWeapons _unit;
		removeAllItems _unit;
		removeAllAssignedItems _unit;
		removeUniform _unit;
		removeVest _unit;
		removeBackpack _unit;
		removeHeadgear _unit;
		removeGoggles _unit;
		_unit forceAddUniform "U_C_Poor_1";
		_unit addHeadgear "H_Cap_grn_BI";
		_unit addGoggles "G_Shades_Blue";
		_unit linkItem "ItemWatch";
		TF_speak_volume_level = "whispering";
		TF_speak_volume_meters = 5;
		[parseText (format[localize "STR_voice_volume", localize "STR_voice_whispering"]), 5] call TFAR_fnc_showHint;
		["OnSpeakVolume", _unit, [_unit, TF_speak_volume_meters]] call TFAR_fnc_fireEventHandlers;
		if (isClass (configFile >> "CfgPatches" >> "AGM_Hearing")) then
		{
			_unit setVariable ["AGM_hasEarPlugsIn", true, true];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then
		{
			_unit setVariable ["ACE_hasEarPlugsIn", true, true];
		};
		_exit = true;
	};
	case toLower "rSoldier";
	case toLower "B_recon_F";
	case toLower "O_recon_F";
	case toLower "I_recon_F":
	{
		[_unit, "", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rExSpec";
	case toLower "B_recon_exp_F";
	case toLower "O_recon_exp_F";
	case toLower "I_recon_exp_F":
	{
		[_unit, "ExSpec", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rDM";
	case toLower "B_recon_M_F";
	case toLower "O_recon_M_F";
	case toLower "I_recon_M_F":
	{
		[_unit, "DM", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rMedic";
	case toLower "B_recon_medic_F";
	case toLower "O_recon_medic_F";
	case toLower "I_recon_medic_F":
	{
		[_unit, "Medic", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rLAT";
	case toLower "B_recon_LAT_F";
	case toLower "O_recon_LAT_F";
	case toLower "I_recon_LAT_F":
	{
		[_unit, "LAT", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "B_Recon_Sharpshooter_F";
	case toLower "O_Pathfinder_F":
	{
		[_unit, "SS", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rFTL";
	case toLower "B_recon_TL_F";
	case toLower "O_recon_TL_F";
	case toLower "I_recon_TL_F":
	{
		[_unit, "FTL", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "rSL":
	{
		[_unit, "SL", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
	case toLower "B_recon_JTAC_F";
	case toLower "O_recon_JTAC_F";
	case toLower "I_recon_JTAC_F":
	{
		[_unit, "FAC", _visual, _side, false, true, _isMedic, _isExSpec, _isPilot] call CODI_Loadout_fnc_loadouts;
		_exit = true;
	};
};
if (_exit) exitWith{};

if (isClass (configFile >> "CfgPatches" >> "AGM_Hearing")) then
{
	_unit setVariable ["AGM_hasEarPlugsIn", true, true];
};
if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then
{
	_unit setVariable ["ACE_hasEarPlugsIn", true, true];
};

_uniform = "";//replaces _bUniform, _oUniform, _iUniform
_bUniform = "";
_oUniform = "";
_iUniform = "";
_vest = "";//replaces _bVest, _oVest, _iVest
_bVest = "";
_oVest = "";
_iVest = "";
_backpack = "";//replaces _bBackpack, _oBackpack, _iBackpack
_bBackpack = "";
_oBackpack = "";
_iBackpack = "";
_goggles = "";//replaces _bGoggles, _oGoggles, _iGoggles
_bGoggles = "";
_oGoggles = "";
_iGoggles = "";
_helmet = "";//replaces _bHelmet, _oHelmet, _iHelmet
_bHelmet = "";
_oHelmet = "";
_iHelmet = "";
_weapon = "";//replaces _bWeapon, _oWeapon, _iWeapon
_bWeapon = "";
_oWeapon = "";
_iWeapon = "";
_weaponAmmo = [];//replaces _bWeaponAmmo, _oWeaponAmmo, _iWeaponAmmo
_bWeaponAmmo = [];
_oWeaponAmmo = [];
_iWeaponAmmo = [];
_weaponAttachements = [];//DO NOT EDIT
_pistol = "";//replaces _bPistol, _oPistol, _iPistol
_bPistol = "";
_oPistol = "";
_iPistol = "";
_pistolAmmo = [];//replaces _bPistolAmmo, _oPistolAmmo, _iPistolAmmo
_bPistolAmmo = [];
_oPistolAmmo = [];
_iPistolAmmo = [];
_pistolAttachements = [];//DO NOT EDIT
_pistolLaser = "";
_pistolSilencer = "";
_pistolOptic = "";
_launcher = "";//replaces _bLauncher, _oLauncher, _iLauncher
_bLauncher = "";
_oLauncher = "";
_iLauncher = "";
_launcherAmmo = "";//replaces _bLauncherAmmo, _oLauncherAmmo, _iLauncherAmmo
_bLauncherAmmo = "";
_oLauncherAmmo = "";
_iLauncherAmmo = "";
_binocular = "";//replaces _bBinocular, _oBinocular, _iBinocular
_bBinocular = "";
_oBinocular = "";
_iBinocular = "";
_binocularAmmo = "";
_uniformItems = [];
_bUniformItems = [];//expands _uniformItems
_oUniformItems = [];//expands _uniformItems
_iUniformItems = [];//expands _uniformItems
_vestItems = [];
_bVestItems = [];//expands _vestItems
_oVestItems = [];//expands _vestItems
_iVestItems = [];//expands _vestItems
_backpackItems = [];
_bBackpackItems = [];//expands _backpackItems
_oBackpackItems = [];//expands _backpackItems
_iBackpackItems = [];//expands _backpackItems
_linkedItems = [];//DO NOT EDIT
_insignia = "MANW";
_uniformAmmo = [];//replaces _bUniformAmmo, _oUniformAmmo, _iUniformAmmo
_bUniformAmmo = [];
_oUniformAmmo = [];
_iUniformAmmo = [];
_vestAmmo = [];//replaces _bVestAmmo, _oVestAmmo, _iVestAmmo
_bVestAmmo = [];
_oVestAmmo = [];
_iVestAmmo = [];
_backpackAmmo = [];//replaces _bBackpackAmmo, _oBackpackAmmo, _iBackpackAmmo
_bBackpackAmmo = [];
_oBackpackAmmo = [];
_iBackpackAmmo = [];

_silencer = "";
_bSilencer = "";
_oSilencer = "";
_iSilencer = "";
_laser = "";
_bLaser = "";
_oLaser = "";
_iLaser = "";
_optic = "";
_bOptic = "";
_oOptic = "";
_iOptic = "";
_bipod = "";
_bBipod = "";
_oBipod = "";
_iBipod = "";

_watch = "";
_map = "";
_compass = "";
_radio = "";
_bRadio = "";
_oRadio = "";
_iRadio = "";
_gps = "";
_bGps = "";
_oGps = "";
_iGps = "";
_nv = "";
_bNv = "";
_oNv = "";
_iNv = "";
_radioConfig = "";
_silenced = false;
if (_forceSilenced) then
{
	_silenced = true;
};
if (_forceUnsilenced) then
{
	_silenced = false;
};

if (_visual == "flecktarn") then
{
	_bUniform = "BWA3_Uniform_Fleck";
	_bVest = "BWA3_Vest_Rifleman1_Fleck";
	if (isClass (configFile >> "CfgPatches" >> "BW_Bags")) then
	{
		_bBackpack = "seesack_fleck";
	}
	else
	{
		_bBackpack = "B_Carryall_oli";
	};
	_bHelmet = "BWA3_M92_Fleck";
	_bWeapon = "arifle_MX_Black_F";
	_bNv = "NVGoggles_INDEP";
	_bBipod = "bipod_01_F_blk";
	_bGoggles = "G_Bandanna_oli";
};
if (_visual == "tropentarn") then
{
	_bUniform = "BWA3_Uniform_Tropen";
	_bVest = "BWA3_Vest_Rifleman1_Tropen";
	if (isClass (configFile >> "CfgPatches" >> "BW_Bags")) then
	{
		_bBackpack = "seesack_tropen";
	}
	else
	{
		_bBackpack = "B_Carryall_mcamo";
	};
	_bHelmet = "BWA3_M92_Tropen";
	_bWeapon = "arifle_MX_F";
	_bNv = "NVGoggles";
	_bBipod = "bipod_01_F_snd";
	_bGoggles = "G_Bandanna_tan";
};
_oUniform = "U_O_CombatUniform_ocamo";
//_oVest = "V_HarnessO_brn";
_oVest = "V_PlateCarrier1_blk";
_oBackpack = "B_Carryall_ocamo";
_oHelmet = "H_HelmetSpecO_ocamo";
_oNv = "NVGoggles_OPFOR";
_oBipod = "bipod_02_F_hex";
_iUniform = "U_I_CombatUniform";
_iVest = "V_PlateCarrierIAGL_dgtl";
_iBackpack = "B_Carryall_oli";
_iHelmet = "H_HelmetIA";
_iNv = "NVGoggles_INDEP";
_iBipod = "bipod_03_F_oli";


_oWeapon = "arifle_Katiba_F";
_iWeapon = "arifle_Mk20_F";
if (isClass (configFile >> "CfgPatches" >> "ace_ballistics")) then
{
	_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow"];
	_iVestAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",4],["ACE_30Rnd_556x45_Stanag_Mk318_mag",5]];
}
else
{
	_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow"];
	_iVestAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",9]];
};
_bWeaponAmmo = ["30Rnd_65x39_caseless_mag_Tracer"];
_bVestAmmo = [["30Rnd_65x39_caseless_mag_Tracer",4],["30Rnd_65x39_caseless_mag",5]];
_oWeaponAmmo = ["30Rnd_65x39_caseless_green_mag_Tracer"];
_oVestAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer",4],["30Rnd_65x39_caseless_green",5]];
_bLaser = "acc_pointer_IR";
_oLaser = "acc_pointer_IR";
_iLaser = "acc_pointer_IR";
_bSilencer = "muzzle_snds_H";
_oSilencer = "muzzle_snds_H";
_iSilencer = "muzzle_snds_M";

if (isClass (configFile >> "CfgPatches" >> "ace_optics")) then
{
	_bOptic = "ACE_optic_Hamr_PIP";
	_oOptic = "ACE_optic_Arco_PIP";
	_iOptic = "ACE_optic_Hamr_PIP";
}
else
{
	_bOptic = "optic_Hamr";
	_oOptic = "optic_Arco";
	_iOptic = "optic_Hamr";
};
_bRadio = "tf_anprc152";
_oRadio = "tf_fadak";
_iRadio = "tf_anprc148jem";

_watch = "ItemWatch";
_map = "ItemMap";
_compass = "ItemCompass";
if (isClass (configFile >> "CfgPatches" >> "FETT_FatTrack")) then
{
	_bGps = "b_itemGPS_FT";
	_oGps = "o_itemGPS_FT";
	_iGps = "i_itemGPS_FT";
}
else
{
	_bGps = "ItemGPS";
	_oGps = "ItemGPS";
	_iGps = "ItemGPS";
};
_bBinocular = "Binocular";
_oBinocular = "Binocular";
_iBinocular = "Binocular";
_uniformItems = [["SmokeShellGreen",1]];
if (isClass (configFile >> "CfgPatches" >> "AGM_Grenades")) then
{
	_uniformItems = _uniformItems + [["AGM_HandFlare_Green",1]];
};
if (isClass (configFile >> "CfgPatches" >> "ace_grenades")) then
{
	_uniformItems = _uniformItems + [["ACE_HandFlare_Green",1]];
};
if (isClass (configFile >> "CfgPatches" >> "AGM_Captives")) then
{
	_uniformItems = _uniformItems + [["AGM_CableTie",3]];
};
if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then
{
	_uniformItems = _uniformItems + [["ACE_CableTie",3]];
};
if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
{
	_uniformItems = _uniformItems + [["AGM_Morphine",2],["AGM_Bandage",10],["AGM_Epipen",1]];
};
if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
{
	_uniformItems = _uniformItems + [["ACE_morphine",5],["ACE_quikclot",15],["ACE_epinephrine",5],["ACE_tourniquet",2]];
};
if (isClass (configFile >> "CfgPatches" >> "AGM_Attach")) then
{
	_uniformItems = _uniformItems + [["AGM_IR_Strobe_Item",1]];
};
if (isClass (configFile >> "CfgPatches" >> "ace_attach")) then
{
	_uniformItems = _uniformItems + [["ACE_IR_Strobe_Item",1]];
};
_vestItems = [["HandGrenade",2],["SmokeShell",2]];
if (isClass (configFile >> "CfgPatches" >> "SUP_flash")) then
{
	_vestItems = _vestItems + [["SUPER_flash",2]];
};
if (isClass (configFile >> "CfgPatches" >> "ace_microdagr")) then
{
	_vestItems = _vestItems + [["ACE_microDAGR",1]];
};

switch (_class) do
{
	case toLower "Ammo";
	case toLower "B_Soldier_A_F";
	case toLower "O_Soldier_A_F";
	case toLower "I_Soldier_A_F":
	{
		if (isClass (configFile >> "CfgPatches" >> "ace_ballistics")) then
		{
			_bBackpackAmmo = [["30Rnd_65x39_caseless_mag_Tracer",10],["30Rnd_65x39_caseless_mag",10]];
			_oBackpackAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer",10],["30Rnd_65x39_caseless_green",10]];
			_iBackpackAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",10],["ACE_30Rnd_556x45_Stanag_Mk318_mag",10]];
		}
		else
		{
			_bBackpackAmmo = [["30Rnd_65x39_caseless_mag_Tracer", 20]];
			_oBackpackAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer", 20]];
			_iBackpackAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow", 20]];
		};
	};
	case toLower "LMG";
	case toLower "B_soldier_AR_F";
	case toLower "O_Soldier_AR_F";
	case toLower "I_Soldier_AR_F":
	{
		_goggles = "G_Combat";
		_weapon = "LMG_Mk200_F";
		_silencer = "muzzle_snds_H_MG";
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_weaponAmmo = ["200Rnd_65x39_cased_Box_Tracer"];
		_backpackAmmo = [["200Rnd_65x39_cased_Box_Tracer", 4]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Overheating")) then
		{
			_backpackItems = _backpackItems + [["AGM_SpareBarrel",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_overheating")) then
		{
			_backpackItems = _backpackItems + [["ACE_SpareBarrel",1]];
		};
	};
	case toLower "MMG":
	{
		_goggles = "G_Combat";
		_weapon = "LMG_Zafir_F";
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_weaponAmmo = ["150Rnd_762x54_Box_Tracer"];
		_backpackAmmo = [["150Rnd_762x54_Box_Tracer", 4]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Overheating")) then
		{
			_backpackItems = _backpackItems + [["AGM_SpareBarrel",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_overheating")) then
		{
			_backpackItems = _backpackItems + [["ACE_SpareBarrel",1]];
		};
	};
	case toLower "Medic";
	case toLower "B_medic_F";
	case toLower "O_medic_F";
	case toLower "I_medic_F":
	{
		_isMedic = true;
		if (isClass (configFile >> "CfgPatches" >> "BW_Bags")) then
		{
			if (_visual == "flecktarn") then
			{
				_bBackpack = "seesack_fleck_m";
			};
			if (_visual == "tropentarn") then
			{
				_bBackpack = "seesack_tropen_m";
			};
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
		{
			_backpackItems = _backpackItems + [["AGM_Epipen",10],["AGM_Morphine",20],["AGM_Bandage",40],["AGM_Bloodbag",10]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
		{
			_backpackItems = _backpackItems + [["ACE_morphine",15],["ACE_epinephrine",20],["ACE_packingBandage",25],["ACE_elasticBandage",25],["ACE_atropine",0],["ACE_salineIV",20],["ACE_surgicalKit",1],["ACE_personalAidKit",1],["ACE_quikclot",10]];
		};
	};
	case toLower "Crew";
	case toLower "B_crew_F";
	case toLower "O_crew_F";
	case toLower "I_crew_F":
	{
		_weapon = "SMG_02_F";
		_laser = "acc_pointer_IR";
		_silencer = "muzzle_snds_L";
		_optic = "optic_Aco_smg";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_vestAmmo = [["30Rnd_9x21_Mag",9]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		_bBackpack = "";
		_oBackpack = "";
		_iBackpack = "";
		_bHelmet = "H_HelmetCrew_B";
		_oHelmet = "H_HelmetCrew_O";
		_iHelmet = "H_HelmetCrew_I";
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
	};
	case toLower "Eng";
	case toLower "B_engineer_F";
	case toLower "O_engineer_F";
	case toLower "I_engineer_F";
	case toLower "B_soldier_repair_F";
	case toLower "O_soldier_repair_F";
	case toLower "I_soldier_repair_F":
	{
		_backpackItems = [["ToolKit",1]];
	};
	case toLower "ExSpec";
	case toLower "B_soldier_exp_F";
	case toLower "O_soldier_exp_F";
	case toLower "I_soldier_exp_F":
	{
		_isExSpec = true;
		if (isClass (configFile >> "CfgPatches" >> "AGM_Explosives")) then
		{
			_backpackItems = _backpackItems + [["AGM_M26_Clacker",1],["AGM_DefusalKit",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_explosives")) then
		{
			_backpackItems = _backpackItems + [["ACE_M26_Clacker",1],["ACE_DefusalKit",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_logistics_wirecutter")) then
		{
			_backpackItems = _backpackItems + [["ACE_wirecutter",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Logistics")) then
		{
			_backpackItems = _backpackItems + [["ToolKit",1]];
		};
		_backpackItems = _backpackItems + [["SatchelCharge_Remote_Mag",2],["DemoCharge_Remote_Mag",2],["MineDetector",1]];
	};
	case toLower "Gren";
	case toLower "B_Soldier_GL_F";
	case toLower "O_Soldier_GL_F";
	case toLower "I_Soldier_GL_F":
	{
		if (_visual == "flecktarn") then
		{
			_bWeapon = "arifle_MX_GL_Black_F";
		};
		if (_visual == "tropentarn") then
		{
			_bWeapon = "arifle_MX_GL_F";
		};
		_bWeaponAmmo = ["30Rnd_65x39_caseless_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_oWeapon = "arifle_Katiba_GL_F";
		_oWeaponAmmo = ["30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_iWeapon = "arifle_Mk20_GL_F";
		_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell"];
		_backpackAmmo = [["1Rnd_HE_Grenade_shell",29]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
	};
	case toLower "HeliCrew";
	case toLower "B_helicrew_F";
	case toLower "O_helicrew_F";
	case toLower "I_helicrew_F":
	{
		_weapon = "SMG_02_F";
		_laser = "acc_pointer_IR";
		_silencer = "muzzle_snds_L";
		_optic = "optic_Aco_smg";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_vestAmmo = [["30Rnd_9x21_Mag",9]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		/*if (isClass (configFile >> "CfgPatches" >> "AGM_Parachute")) then
		{
			_backpack = "AGM_NonSteerableParachute";
			_watch = "AGM_Altimeter";
		};*/
		if (isClass (configFile >> "CfgPatches" >> "ACE_Parachute")) then
		{
			_backpack = "ACE_NonSteerableParachute";
			_watch = "ACE_Altimeter";
		}
		else
		{
			_backpack = "B_Parachute";
		};
		_bHelmet = "H_CrewHelmetHeli_B";
		_oHelmet = "H_CrewHelmetHeli_O";
		_iHelmet = "H_CrewHelmetHeli_I";
		_bGoggles = "";
	};
	case toLower "HeliPilot";
	case toLower "B_Helipilot_F";
	case toLower "O_Helipilot_F";
	case toLower "I_Helipilot_F":
	{
		_weapon = "SMG_02_F";
		_laser = "acc_pointer_IR";
		_silencer = "muzzle_snds_L";
		_optic = "optic_Aco_smg";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_vestAmmo = [["30Rnd_9x21_Mag",9]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		/*if (isClass (configFile >> "CfgPatches" >> "AGM_Parachute")) then
		{
			_backpack = "AGM_NonSteerableParachute";
			_watch = "AGM_Altimeter";
		};*/
		if (isClass (configFile >> "CfgPatches" >> "ACE_Parachute")) then
		{
			_backpack = "ACE_NonSteerableParachute";
			_watch = "ACE_Altimeter";
		}
		else
		{
			_backpack = "B_Parachute";
		};
		_bHelmet = "H_PilotHelmetHeli_B";
		_oHelmet = "H_PilotHelmetHeli_O";
		_iHelmet = "H_PilotHelmetHeli_I";
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
	};
	case toLower "DM";
	case toLower "B_soldier_M_F";
	case toLower "O_soldier_M_F";
	case toLower "I_soldier_M_F":
	{
		if (332350 in (getDLCs 1)) then
		{
			_optic = "optic_AMS_snd";
		}
		else
		{
			_optic = "optic_DMS";
		};
		_bipod = "bipod_01_F_snd";
		_weapon = "srifle_EBR_F";
		_silencer = "muzzle_snds_B";
		if (isClass (configFile >> "CfgPatches" >> "ace_ballistics")) then
		{
			_weaponAmmo = ["ACE_20Rnd_762x51_Mag_Tracer"];
			_vestAmmo = [["ACE_20Rnd_762x51_Mag_Tracer",3]];
			_vestAmmo = _vestAmmo + [["ACE_20Rnd_762x51_Mk319_Mod_0_Mag",5]];
		}
		else
		{
			_weaponAmmo = ["20Rnd_762x51_Mag"];
			_vestAmmo = [["20Rnd_762x51_Mag",8]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
		/*if (isClass (configFile >> "CfgPatches" >> "advancedballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "atragmx")) then
			{
				_vestItems = _vestItems + [["ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "kestrel4500")) then
			{
				_vestItems = _vestItems + [["Kestrel4500",1]];
			};
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_advanced_ballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "ace_atragmx")) then
			{
				_vestItems = _vestItems + [["ACE_ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "ace_kestrel4500")) then
			{
				_vestItems = _vestItems + [["ACE_Kestrel4500",1]];
			};
		};*/
		if (isClass (configFile >> "CfgPatches" >> "ace_rangecard")) then
		{
			_vestItems = _vestItems + [["ACE_RangeCard", 1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_tacticalladder")) then
		{
			_backpack = "ACE_TacticalLadder_Pack"
		};
	};
	case toLower "AA";
	case toLower "B_soldier_AA_F";
	case toLower "O_soldier_AA_F";
	case toLower "I_soldier_AA_F":
	{
		if (_visual == "flecktarn") then
		{
			_bLauncher = "launch_I_Titan_F";
		};
		if (_visual == "tropentarn") then
		{
			_bLauncher = "launch_B_Titan_F";
		};
		_oLauncher = "launch_O_Titan_F";
		_iLauncher = "launch_I_Titan_F";
		_backpackAmmo = [["Titan_AA",1]];
		_launcherAmmo = ["Titan_AA"];
	};
	case toLower "AT";
	case toLower "B_soldier_AT_F";
	case toLower "O_soldier_AT_F";
	case toLower "I_soldier_AT_F":
	{
		if (_visual == "flecktarn") then
		{
			_bLauncher = "launch_I_Titan_short_F";
		};
		if (_visual == "tropentarn") then
		{
			_bLauncher = "launch_B_Titan_short_F";
		};
		_oLauncher = "launch_O_Titan_short_F";
		_iLauncher = "launch_I_Titan_short_F";
		_backpackAmmo = [["Titan_AT",1]];
		_launcherAmmo = ["Titan_AT"];
	};
	case toLower "PL";
	case toLower "B_officer_F";
	case toLower "O_officer_F";
	case toLower "I_officer_F":
	{
		_radioConfig = "PL";
		if (_visual == "flecktarn") then
		{
			_bWeapon = "arifle_MX_GL_Black_F";
			_bBackpack = "tf_rt1523g_big_bwmod";
		};
		if (_visual == "tropentarn") then
		{
			_bWeapon = "arifle_MX_GL_F";
			_bBackpack = "tf_rt1523g_big_bwmod_tropen";
		};
		_oBackpack = "tf_mr3000";
		_iBackpack = "tf_anprc155";
		_bWeaponAmmo = ["30Rnd_65x39_caseless_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_oWeapon = "arifle_Katiba_GL_F";
		_oWeaponAmmo = ["30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_iWeapon = "arifle_Mk20_GL_F";
		_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell"];
		_backpackAmmo = [["1Rnd_HE_Grenade_shell",9],["1Rnd_Smoke_Grenade_shell",5]];
		_oUniform = "U_O_OfficerUniform_ocamo";
		_iUniform = "U_I_OfficerUniform";
		_bHelmet = "H_Beret_02";
		_oHelmet = "H_Beret_blk";
		_iHelmet = "H_Beret_blk";
		_bNv = "";
		_oNv = "";
		_iNv = "";
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_uniformItems = _uniformItems + [["ACE_key_lockpick",1]];
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_dagr")) then
		{
			_backpackItems = _backpackItems + [["ACE_DAGR",1]];
		};
	};
	case toLower "Para";
	case toLower "B_soldier_PG_F";
	case toLower "O_soldier_PG_F";
	case toLower "I_soldier_PG_F":
	{
		_silenced = true;
		/*if (isClass (configFile >> "CfgPatches" >> "AGM_Parachute")) then
		{
			_watch = "AGM_Altimeter";
		};*/
		if (isClass (configFile >> "CfgPatches" >> "ACE_Parachute")) then
		{
			_watch = "ACE_Altimeter";
		};
		_backpack = "B_Parachute";
	};
	case toLower "Pilot";
	case toLower "B_Pilot_F";
	case toLower "O_Pilot_F";
	case toLower "I_Pilot_F":
	{
		_isPilot = true;
		_weapon = "SMG_02_F";
		_laser = "acc_pointer_IR";
		_silencer = "muzzle_snds_L";
		_optic = "optic_Aco_smg";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_vestAmmo = [["30Rnd_9x21_Mag",9]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		/*if (isClass (configFile >> "CfgPatches" >> "AGM_Parachute")) then
		{
			_backpack = "AGM_NonSteerableParachute";
			_watch = "AGM_Altimeter";
		};*/
		if (isClass (configFile >> "CfgPatches" >> "ACE_Parachute")) then
		{
			_backpack = "ACE_NonSteerableParachute";
			_watch = "ACE_Altimeter";
		}
		else
		{
			_backpack = "B_Parachute";
		};
		_bHelmet = "H_PilotHelmetFighter_B";
		_oHelmet = "H_PilotHelmetFighter_O";
		_iHelmet = "H_PilotHelmetFighter_I";
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
	};
	case toLower "LAT";
	case toLower "B_soldier_LAT_F";
	case toLower "O_soldier_LAT_F";
	case toLower "I_soldier_LAT_F":
	{
		_launcher = "launch_RPG32_F";
		_launcherAmmo = ["RPG32_HE_F"];
		_backpackAmmo = [["RPG32_HE_F",4]];
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
	};
	case toLower "Lite";
	case toLower "B_Soldier_lite_F";
	case toLower "O_Soldier_lite_F";
	case toLower "I_Soldier_lite_F":
	{
		_bVestAmmo = [["30Rnd_9x21_Mag",9]];
		_oVestAmmo = [["30Rnd_9x21_Mag",9]];
		_iVestAmmo = [["30Rnd_9x21_Mag",9]];
		_weapon = "SMG_02_F";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_optic = "optic_Holosight_smg";
		_silencer = "";
	};
	case toLower "Unarmed";
	case toLower "b_soldier_unarmed_f";
	case toLower "o_soldier_unarmed_f";
	case toLower "i_soldier_unarmed_f":
	{
		//TODO
		_radioConfig = "NONE";
	};
	case toLower "SL";
	case toLower "B_Soldier_SL_F";
	case toLower "O_Soldier_SL_F";
	case toLower "I_Soldier_SL_F":
	{
		_radioConfig = "SL";
		if (_visual == "flecktarn") then
		{
			_bWeapon = "arifle_MX_GL_Black_F";
			_bBackpack = "tf_rt1523g_big_bwmod";
		};
		if (_visual == "tropentarn") then
		{
			_bWeapon = "arifle_MX_GL_F";
			_bBackpack = "tf_rt1523g_big_bwmod_tropen";
		};
		_oBackpack = "tf_mr3000";
		_iBackpack = "tf_anprc155";
		_bWeaponAmmo = ["30Rnd_65x39_caseless_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_oWeapon = "arifle_Katiba_GL_F";
		_oWeaponAmmo = ["30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_iWeapon = "arifle_Mk20_GL_F";
		_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell"];
		_backpackAmmo = [["1Rnd_HE_Grenade_shell",9],["1Rnd_Smoke_Grenade_shell",5]];
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_uniformItems = _uniformItems + [["ACE_key_lockpick",1]];
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_dagr")) then
		{
			_backpackItems = _backpackItems + [["ACE_DAGR",1]];
		};
	};
	case toLower "Survivor";
	case toLower "b_survivor_F";
	case toLower "o_survivor_F";
	case toLower "i_survivor_F":
	{
		//TODO
		_radioConfig = "NONE";
	};
	case toLower "FTL";
	case toLower "B_Soldier_TL_F";
	case toLower "O_Soldier_TL_F";
	case toLower "I_Soldier_TL_F":
	{
		_radioConfig = "FTL";
		if (_visual == "flecktarn") then
		{
			_bWeapon = "arifle_MX_GL_Black_F";
		};
		if (_visual == "tropentarn") then
		{
			_bWeapon = "arifle_MX_GL_F";
		};
		_bWeaponAmmo = ["30Rnd_65x39_caseless_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_oWeapon = "arifle_Katiba_GL_F";
		_oWeaponAmmo = ["30Rnd_65x39_caseless_green_mag_Tracer","1Rnd_HE_Grenade_shell"];
		_iWeapon = "arifle_Mk20_GL_F";
		_iWeaponAmmo = ["30Rnd_556x45_Stanag_Tracer_Yellow","1Rnd_HE_Grenade_shell"];
		_backpackAmmo = [["1Rnd_HE_Grenade_shell",19]];
		_backpackItems = [["SmokeShellGreen",10]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Grenades")) then
		{
			_backpackItems = _backpackItems + [["AGM_HandFlare_Green",5]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_grenades")) then
		{
			_backpackItems = _backpackItems + [["ACE_HandFlare_Green",5]];
		};
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then
		{
			_uniformItems = _uniformItems + [["ACE_key_lockpick",1]];
			_bUniformItems = _bUniformItems + [["ACE_key_west",1]];
			_oUniformItems = _oUniformItems + [["ACE_key_east",1]];
			_iUniformItems = _iUniformItems + [["ACE_key_indp",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_huntir")) then
		{
			_backpackItems = _backpackItems + [["ACE_HuntIR_monitor",1]];
			_backpackAmmo = _backpackAmmo + [["ACE_HuntIR_M203",5]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_dagr")) then
		{
			_backpackItems = _backpackItems + [["ACE_DAGR",1]];
		};
	};
	case toLower "UAV";
	case toLower "B_soldier_UAV_F";
	case toLower "O_soldier_UAV_F";
	case toLower "I_soldier_UAV_F":
	{
		_bGps = "B_UavTerminal";
		_bBackpack = "B_UAV_01_backpack_F";
		_oGps = "O_UavTerminal";
		_oBackpack = "O_UAV_01_backpack_F";
		_iGps = "I_UavTerminal";
		_iBackpack = "I_UAV_01_backpack_F";
	};
	case toLower "Diver";
	case toLower "B_diver_F";
	case toLower "O_diver_F";
	case toLower "I_diver_F":
	{
		_silenced = true;
		_uniformItems = [["HandGrenade",1]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Attach")) then
		{
			_uniformItems = _uniformItems + [["AGM_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_attach")) then
		{
			_uniformItems = _uniformItems + [["ACE_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Captives")) then
		{
			_uniformItems = _uniformItems + [["AGM_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then
		{
			_uniformItems = _uniformItems + [["ACE_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
		{
			_uniformItems = _uniformItems + [["AGM_Morphine",1],["AGM_Bandage",5],["AGM_Epipen",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
		{
			_uniformItems = _uniformItems + [["ACE_morphine",4],["ACE_quikclot",15],["ACE_epinephrine",4],["ACE_tourniquet",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_microdagr")) then
		{
			_uniformItems = _uniformItems + [["ACE_microDAGR",1]];
		};
		_bBackpack = "";
		_oBackpack = "";
		_iBackpack = "";
		_bUniform = "U_B_Wetsuit";
		_oUniform = "U_O_Wetsuit";
		_iUniform = "U_I_Wetsuit";
		_bVest = "V_RebreatherB";
		_oVest = "V_RebreatherIR";
		_iVest = "V_RebreatherIA";
		_bGoggles = "G_B_Diving";
		_oGoggles = "G_O_Diving";
		_iGoggles = "G_I_Diving";
		_bUniformAmmo = [["30Rnd_65x39_caseless_mag_Tracer",4]];
		_oUniformAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer",4]];
		_iUniformAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",4]];
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_vestItems = [];
		_bNv = "NVGoggles_OPFOR";
		_bBipod = "bipod_01_F_blk";
		_oBipod = "bipod_01_F_blk";
	};
	case toLower "DiverExp";
	case toLower "B_diver_exp_F";
	case toLower "O_diver_exp_F";
	case toLower "I_diver_exp_F":
	{
		_silenced = true;
		_uniformItems = [["HandGrenade",1]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Attach")) then
		{
			_uniformItems = _uniformItems + [["AGM_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_attach")) then
		{
			_uniformItems = _uniformItems + [["ACE_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Captives")) then
		{
			_uniformItems = _uniformItems + [["AGM_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then
		{
			_uniformItems = _uniformItems + [["ACE_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
		{
			_uniformItems = _uniformItems + [["AGM_Morphine",1],["AGM_Bandage",5],["AGM_Epipen",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
		{
			_uniformItems = _uniformItems + [["ACE_morphine",4],["ACE_quikclot",15],["ACE_epinephrine",4],["ACE_tourniquet",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_microdagr")) then
		{
			_uniformItems = _uniformItems + [["ACE_microDAGR",1]];
		};
		_backpack = "B_AssaultPack_blk";
		_backpackItems = [["DemoCharge_Remote_Mag",2],["SatchelCharge_Remote_Mag",1],["ACE_M26_Clacker",1],["ACE_DefusalKit",1],["MineDetector",1]];
		_bUniform = "U_B_Wetsuit";
		_oUniform = "U_O_Wetsuit";
		_iUniform = "U_I_Wetsuit";
		_bVest = "V_RebreatherB";
		_oVest = "V_RebreatherIR";
		_iVest = "V_RebreatherIA";
		_bGoggles = "G_B_Diving";
		_oGoggles = "G_O_Diving";
		_iGoggles = "G_I_Diving";
		_bUniformAmmo = [["30Rnd_65x39_caseless_mag_Tracer",4]];
		_oUniformAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer",4]];
		_iUniformAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",4]];
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_vestItems = [];
		_bNv = "NVGoggles_OPFOR";
		_bBipod = "bipod_01_F_blk";
		_oBipod = "bipod_01_F_blk";
	};
	case toLower "DiverFTL";
	case toLower "B_diver_TL_F";
	case toLower "O_diver_TL_F";
	case toLower "I_diver_TL_F":
	{
		_silenced = true;
		_radioConfig = "FTL";
		_uniformItems = [["HandGrenade",1]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Attach")) then
		{
			_uniformItems = _uniformItems + [["AGM_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_attach")) then
		{
			_uniformItems = _uniformItems + [["ACE_IR_Strobe_Item",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Captives")) then
		{
			_uniformItems = _uniformItems + [["AGM_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then
		{
			_uniformItems = _uniformItems + [["ACE_CableTie",2]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
		{
			_uniformItems = _uniformItems + [["AGM_Morphine",1],["AGM_Bandage",5],["AGM_Epipen",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
		{
			_uniformItems = _uniformItems + [["ACE_morphine",4],["ACE_quikclot",15],["ACE_epinephrine",4],["ACE_tourniquet",1]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_microdagr")) then
		{
			_uniformItems = _uniformItems + [["ACE_microDAGR",1]];
		};
		_bBackpack = "";
		_oBackpack = "";
		_iBackpack = "";
		_bUniform = "U_B_Wetsuit";
		_oUniform = "U_O_Wetsuit";
		_iUniform = "U_I_Wetsuit";
		_bVest = "V_RebreatherB";
		_oVest = "V_RebreatherIR";
		_iVest = "V_RebreatherIA";
		_bGoggles = "G_B_Diving";
		_oGoggles = "G_O_Diving";
		_iGoggles = "G_I_Diving";
		_bUniformAmmo = [["30Rnd_65x39_caseless_mag_Tracer",4]];
		_oUniformAmmo = [["30Rnd_65x39_caseless_green_mag_Tracer",4]];
		_iUniformAmmo = [["30Rnd_556x45_Stanag_Tracer_Yellow",4]];
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_vestItems = [];
		_bNv = "NVGoggles_OPFOR";
		_bBipod = "bipod_01_F_blk";
		_oBipod = "bipod_01_F_blk";
		if (isClass (configFile >> "CfgPatches" >> "ace_yardage450")) then
		{
			_binocular = "ACE_Yardage450";
		}
		else
		{
			_binocular = "Rangefinder";
		};
	};
	case toLower "Spotter";
	case toLower "B_spotter_F";
	case toLower "O_spotter_F";
	case toLower "I_spotter_F":
	{
		if (_visual == "flecktarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_lsh";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Fleck";
			};
		};
		if (_visual == "tropentarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_ard";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Tropen";
			};
		};
		if (332350 in (getDLCs 1)) then
		{
			_oUniform = "U_O_FullGhillie_lsh";
			_iUniform = "U_I_FullGhillie_sard";
		}
		else
		{
			_oUniform = "U_O_GhillieSuit";
			_iUniform = "U_I_GhillieSuit";
		};
		if (isClass (configFile >> "CfgPatches" >> "advancedballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "atragmx")) then
			{
				_uniformItems = _uniformItems + [["ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "kestrel4500")) then
			{
				_uniformItems = _uniformItems + [["Kestrel4500",1]];
			};
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_advanced_ballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "ace_atragmx")) then
			{
				_uniformItems = _uniformItems + [["ACE_ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "ace_kestrel4500")) then
			{
				_uniformItems = _uniformItems + [["ACE_Kestrel4500",1]];
			};
		};
		_bHelmet = "";
		_oHelmet = "";
		_iHelmet = "";
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_mx2a")) then
		{
			_vestItems = _vestItems + [["ACE_MX2A", 1]];
		};
		if (332350 in (getDLCs 1)) then
		{
			_bGps = "B_UavTerminal";
			_oGps = "O_UavTerminal";
			_bBackpack = "B_Static_Designator_01_weapon_F";
			_oBackpack = "O_Static_Designator_02_weapon_F";
		};
		_uniformItems = _uniformItems + [["Laserbatteries",1]];
		_iBinocular = "Laserdesignator_03";
		_oBinocular = "Laserdesignator_02";
		_bBinocular = "Laserdesignator";
	};
	case toLower "Sniper";
	case toLower "B_sniper_F";
	case toLower "O_sniper_F";
	case toLower "I_sniper_F":
	{
		_silenced = true;
		if (_visual == "flecktarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_lsh";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Fleck";
			};
			_bWeapon = "srifle_LRR_F";
			_bBackpack = "tf_rt1523g_big_bwmod";
		};
		if (_visual == "tropentarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_ard";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Tropen";
			};
			_bWeapon = "srifle_LRR_camo_F";
			_bBackpack = "tf_rt1523g_big_bwmod_tropen";
		};
		_oWeapon = "srifle_GM6_camo_F";
		_iWeapon = "srifle_LRR_F";
		_oBackpack = "tf_mr3000";
		_iBackpack = "tf_anprc155";
		if (332350 in (getDLCs 1)) then
		{
			_oUniform = "U_O_FullGhillie_lsh";
			_iUniform = "U_I_FullGhillie_sard";
		}
		else
		{
			_oUniform = "U_O_GhillieSuit";
			_iUniform = "U_I_GhillieSuit";
		};
		_optic = "optic_LRPS";
		_bLaser = "";
		_oLaser = "";
		_iLaser = "";
		_bSilencer = "";
		_oSilencer = "";
		_iSilencer = "";
		_bWeaponAmmo = ["7Rnd_408_Mag"];
		_iWeaponAmmo = ["7Rnd_408_Mag"];
		_bVestAmmo = [["BWA3_40Rnd_46x30_MP7",4],["7Rnd_408_Mag",4]];
		_iVestAmmo = [["BWA3_40Rnd_46x30_MP7",4],["7Rnd_408_Mag",4]];
		if (isClass (configFile >> "CfgPatches" >> "ace_ballistics")) then
		{
			_oWeaponAmmo = ["ACE_5Rnd_127x99_AMAX_Mag"];
			_oVestAmmo = [["BWA3_40Rnd_46x30_MP7",4],["ACE_5Rnd_127x99_AMAX_Mag",6]];
		}
		else
		{
			_oWeaponAmmo = ["5Rnd_127x108_Mag"];
			_oVestAmmo = [["BWA3_40Rnd_46x30_MP7",4],["5Rnd_127x108_Mag",6]];
		};
		_pistol = "BWA3_MP7";
		_pistolAmmo = ["BWA3_40Rnd_46x30_MP7"];
		_pistolLaser = "BWA3_acc_LLM01_irlaser";
		_pistolOptic = "optic_Holosight";
		_pistolSilencer = "BWA3_muzzle_snds_MP7";
		_vestItems = [];
		_bHelmet = "";
		_oHelmet = "";
		_iHelmet = "";
		_binocular = "Rangefinder";
		_bGoggles = "";
		if (isClass (configFile >> "CfgPatches" >> "ace_rangecard")) then
		{
			_vestItems = _vestItems + [["ACE_RangeCard", 1]];
		};
	};
	case toLower "AAR";
	case toLower "B_soldier_AAR_F";
	case toLower "O_soldier_AAR_F";
	case toLower "I_soldier_AAR_F":
	{
		_backpackAmmo = [["130Rnd_338_Mag", 5]];
	};
	case toLower "AAA";
	case toLower "B_soldier_AAA_F";
	case toLower "O_soldier_AAA_F";
	case toLower "I_soldier_AAA_F":
	{
		_backpackAmmo = [["Titan_AA",2]];
	};
	case toLower "AAT";
	case toLower "B_soldier_AAT_F";
	case toLower "O_soldier_AAT_F";
	case toLower "I_soldier_AAT_F":
	{
		_backpackAmmo = [["Titan_AT",2]];
	};
	case toLower "AAHMG";
	case toLower "AAGMG";
	case toLower "B_support_AMG_F";
	case toLower "O_support_AMG_F";
	case toLower "I_support_AMG_F":
	{
		_bBackpack = "B_HMG_01_support_F";
		_oBackpack = "O_HMG_01_support_F";
		_iBackpack = "I_HMG_01_support_F";
		_bGps = "B_UavTerminal";
		_oGps = "O_UavTerminal";
		_iGps = "I_UavTerminal";
	};
	case toLower "AMortar";
	case toLower "B_support_AMort_F";
	case toLower "O_support_AMort_F";
	case toLower "I_support_AMort_F":
	{
		_bBackpack = "B_Mortar_01_support_F";
		_oBackpack = "O_Mortar_01_support_F";
		_iBackpack = "I_Mortar_01_support_F";
	};
	case toLower "AGMG";
	case toLower "B_support_GMG_F";
	case toLower "O_support_GMG_F";
	case toLower "I_support_GMG_F":
	{
		_bBackpack = "B_GMG_01_A_weapon_F";
		_oBackpack = "O_GMG_01_A_weapon_F";
		_iBackpack = "I_GMG_01_A_weapon_F";
		_bGps = "B_UavTerminal";
		_oGps = "O_UavTerminal";
		_iGps = "I_UavTerminal";
	};
	case toLower "AHMG";
	case toLower "B_support_MG_F";
	case toLower "O_support_MG_F";
	case toLower "I_support_MG_F":
	{
		_bBackpack = "B_HMG_01_A_weapon_F";
		_oBackpack = "O_HMG_01_A_weapon_F";
		_iBackpack = "I_HMG_01_A_weapon_F";
		_bGps = "B_UavTerminal";
		_oGps = "O_UavTerminal";
		_iGps = "I_UavTerminal";
	};
	case toLower "Mortar";
	case toLower "B_support_Mort_F";
	case toLower "O_support_Mort_F";
	case toLower "I_support_Mort_F":
	{
		_bBackpack = "B_Mortar_01_weapon_F";
		_oBackpack = "O_Mortar_01_weapon_F";
		_iBackpack = "I_Mortar_01_weapon_F";
	};
	case toLower "B_recon_F";
	case toLower "O_recon_F";
	case toLower "I_recon_F":
	{
		_silenced = true;
	};
	case toLower "FAC";
	case toLower "JTAC":
	{
		_radioConfig = "FAC";
		_bBinocular = "Laserdesignator";
		_oBinocular = "Laserdesignator_02";
		_iBinocular = "Laserdesignator_03";
		_binocularAmmo = "Laserbatteries";
		if (_visual == "flecktarn") then
		{
			_bBackpack = "tf_rt1523g_big_bwmod";
		};
		if (_visual == "tropentarn") then
		{
			_bBackpack = "tf_rt1523g_big_bwmod_tropen";
		};
		_oBackpack = "tf_mr3000";
		_iBackpack = "tf_anprc155";
		_backpackItems = [["SmokeShellRed",5],["SmokeShellGreen",10],["B_IR_Grenade",5]];
		if (isClass (configFile >> "CfgPatches" >> "AGM_Grenades")) then
		{
			_backpackItems = _backpackItems + [["AGM_HandFlare_Green",10],["AGM_HandFlare_Red",5]];
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_grenades")) then
		{
			_backpackItems = _backpackItems + [["ACE_HandFlare_Green",10],["ACE_HandFlare_Red",5]];
		};
	};
	case toLower "HMG";
	case toLower "B_HeavyGunner_F";
	case toLower "O_HeavyGunner_F":
	{
		_goggles = "G_Combat";
		if (_visual == "flecktarn") then
		{
			_bWeapon = "MMG_02_black_F";
		};
		if (_visual == "tropentarn") then
		{
			_bWeapon = "MMG_02_sand_F";
		};
		_bVestAmmo = [];
		_oVestAmmo = [];
		_oWeapon = "MMG_02_black_F";
		_oBipod = "bipod_01_F_blk";
		_bWeaponAmmo = ["130Rnd_338_Mag"];
		_oWeaponAmmo = ["130Rnd_338_Mag"];
		_bBackpackAmmo = [["130Rnd_338_Mag",4]];
		_oBackpackAmmo = [["130Rnd_338_Mag",4]];
	};
	case toLower "SS";
	case toLower "B_Sharpshooter_F";
	case toLower "O_Sharpshooter_F":
	{
		if (_visual == "flecktarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_lsh";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Fleck";
			};
			_bWeapon = "srifle_DMR_02_F";
			_bSilencer = "muzzle_snds_338_black";
			_bOptic = "optic_KHS_blk";
		};
		if (_visual == "tropentarn") then
		{
			if (332350 in (getDLCs 1)) then
			{
				_bUniform = "U_B_FullGhillie_ard";
			}
			else
			{
				_bUniform = "BWA3_Uniform_Ghillie_Tropen";
			};
			_bWeapon = "srifle_DMR_02_sniper_F";
			_bSilencer = "muzzle_snds_338_sand";
			_bOptic = "optic_KHS_tan";
		};
		if (332350 in (getDLCs 1)) then
		{
			_oUniform = "U_O_FullGhillie_lsh";
			_iUniform = "U_I_FullGhillie_sard";
		}
		else
		{
			_oUniform = "U_O_GhillieSuit";
			_iUniform = "U_I_GhillieSuit";
		};
		_oWeapon = "srifle_DMR_02_F";
		_oSilencer = "muzzle_snds_338_black";
		_oOptic = "optic_KHS_blk";
		_oBipod = "bipod_01_F_blk";
		_vestAmmo = [["BWA3_40Rnd_46x30_MP7",1]];
		if (isClass (configFile >> "CfgPatches" >> "ace_ballistics")) then
		{
			_bWeaponAmmo = ["ACE_10Rnd_338_300gr_HPBT_Mag"];
			_oWeaponAmmo = ["ACE_10Rnd_338_300gr_HPBT_Mag"];
			_vestAmmo = _vestAmmo + [["ACE_10Rnd_338_300gr_HPBT_Mag",4]];
		}
		else
		{
			_bWeaponAmmo = ["10Rnd_338_Mag"];
			_oWeaponAmmo = ["10Rnd_338_Mag"];
			_vestAmmo = _vestAmmo + [["10Rnd_338_Mag",4]];
		};
		_pistol = "BWA3_MP7";
		_pistolAmmo = ["BWA3_40Rnd_46x30_MP7"];
		_pistolLaser = "BWA3_acc_LLM01_irlaser";
		_pistolOptic = "optic_Holosight";
		/*if (isClass (configFile >> "CfgPatches" >> "BWA3_Vector")) then
		{
			_binocular = "BWA3_Vector";
		}*/
		if (isClass (configFile >> "CfgPatches" >> "ace_vector")) then
		{
			_binocular = "ACE_Vector";
		}
		else
		{
			_binocular = "Rangefinder";
		};
		if (isClass (configFile >> "CfgPatches" >> "advancedballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "atragmx")) then
			{
				_vestItems = _vestItems + [["ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "kestrel4500")) then
			{
				_vestItems = _vestItems + [["Kestrel4500",1]];
			};
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_advanced_ballistics")) then
		{
			if (isClass (configFile >> "CfgPatches" >> "ace_atragmx")) then
			{
				_vestItems = _vestItems + [["ACE_ATragMX",1]];
			};
			if (isClass (configFile >> "CfgPatches" >> "ace_kestrel4500")) then
			{
				_vestItems = _vestItems + [["ACE_Kestrel4500",1]];
			};
		};
		if (332350 in (getDLCs 1)) then
		{
			_bGps = "B_UavTerminal";
			_oGps = "O_UavTerminal";
			_bBackpack = "B_Static_Designator_01_weapon_F";
			_oBackpack = "O_Static_Designator_02_weapon_F";
		};
		if (isClass (configFile >> "CfgPatches" >> "ace_mx2a")) then
		{
			_vestItems = _vestItems + [["ACE_MX2A", 1]];
		};
	};
	case toLower "VR";
	case toLower "B_Protagonist_VR_F";
	case toLower "O_Protagonist_VR_F";
	case toLower "I_Protagonist_VR_F":
	{
		_isMedic = true;
		_silenced = true;
		_bUniform = "U_B_Protagonist_VR";
		_oUniform = "U_O_Protagonist_VR";
		_iUniform = "U_I_Protagonist_VR";
		_vest = "V_PlateCarrierSpec_blk";
		_helmet = "BWA3_OpsCore_Schwarz";
		_goggles = "G_Goggles_VR";
		_nv = "NVGoggles_OPFOR";
		_weapon = "SMG_02_F";
		_laser = "acc_pointer_IR";
		//_silencer = "muzzle_snds_L";
		_optic = "optic_Aco_smg";
		_pistol = "asdg_hgun_Pistol_heavy_01_F";
		_pistolOptic = "optic_MRD";
		_pistolSilencer = "muzzle_snds_acp";
		_bBipod = "";
		_oBipod = "";
		_iBipod = "";
		_binocular = "Binocular";
		_weaponAmmo = ["30Rnd_9x21_Mag"];
		_pistolAmmo = ["11Rnd_45ACP_Mag"];
		_uniformItems = [];
		_vestItems = [];
		_bVestAmmo = [];
		_oVestAmmo = [];
		_iVestAmmo = [];
		_bBackpack = "";
		_oBackpack = "";
		_iBackpack = "";
		if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
		{
			_uniformItems = _uniformItems + [["AGM_Morphine",10],["AGM_Bandage",20],["AGM_Epipen",5],["AGM_Bloodbag",5]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Captives")) then
		{
			_uniformItems = _uniformItems + [["AGM_CableTie",5]];
		};
		_uniformAmmo = [["30Rnd_9x21_Mag",9],["11Rnd_45ACP_Mag",9]];
		_uniformItems = _uniformItems + [["SmokeShell",10],["SmokeShellGreen",2],["SmokeShellRed",2]];
		if (isClass (configFile >> "CfgPatches" >> "SUP_flash")) then
		{
			_uniformItems = _uniformItems + [["SUPER_flash",10]];
		};
		if (isClass (configFile >> "CfgPatches" >> "AGM_Grenades")) then
		{
			_uniformItems = _uniformItems + [["AGM_HandFlare_Green",2],["AGM_HandFlare_Red",2]];
		};
	};
};





/*******************************************************
 *                                                     *
 *                 DO NOT EDIT BELOW                   *
 *                                                     *
 *******************************************************/





if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then
{
	if (_isMedic) then
	{
		_unit setVariable ["AGM_IsMedic", true, true];
	}
	else
	{
		_unit setVariable ["AGM_IsMedic", false, true];
	};
};
if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
{
	if (_isMedic) then
	{
		_unit setVariable ["ACE_Medical_medicClass", 1, true];
	}
	else
	{
		_unit setVariable ["ACE_Medical_medicClass", 0, true];
	};
};
if (isClass (configFile >> "CfgPatches" >> "AGM_Explosives")) then
{
	if (_isExSpec) then
	{
		_unit setVariable ["AGM_IsEOD", true, true];
	}
	else
	{
		_unit setVariable ["AGM_IsEOD", false, true];
	};
};
if (isClass (configFile >> "CfgPatches" >> "AGM_GForces")) then
{
	if (_isPilot) then
	{
		_unit setVariable ["AGM_GForceCoef", 0.55, true];
	}
	else
	{
		_unit setVariable ["AGM_GForceCoef", 1.0, true];
	};
};
if (isClass (configFile >> "CfgPatches" >> "ace_gforces")) then
{
	if (_isPilot) then
	{
		_unit setVariable ["ACE_GForceCoef", 0.55, true];
	}
	else
	{
		_unit setVariable ["ACE_GForceCoef", 1.0, true];
	};
};
switch (_side) do
{
	case str(blufor):
	{
		if (count _bUniformItems > 0) then
		{
			_uniformItems = _uniformItems + _bUniformItems;
		};
		if (count _bVestItems > 0) then
		{
			_vestItems = _vestItems + _bVestItems;
		};
		if (count _bBackpackItems > 0) then
		{
			_backpackItems = _backpackItems + _bBackpackItems;
		};
	};
	case str(opfor):
	{
		if (count _oUniformItems > 0) then
		{
			_uniformItems = _uniformItems + _oUniformItems;
		};
		if (count _oVestItems > 0) then
		{
			_vestItems = _vestItems + _oVestItems;
		};
		if (count _oBackpackItems > 0) then
		{
			_backpackItems = _backpackItems + _oBackpackItems;
		};
	};
	case str(independent):
	{
		if (count _iUniformItems > 0) then
		{
			_uniformItems = _uniformItems + _iUniformItems;
		};
		if (count _iVestItems > 0) then
		{
			_vestItems = _vestItems + _iVestItems;
		};
		if (count _iBackpackItems > 0) then
		{
			_backpackItems = _backpackItems + _iBackpackItems;
		};
	};
};
if (_uniform == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_uniform = _bUniform;
		};
		case str(opfor):
		{
			_uniform = _oUniform;
		};
		case str(independent):
		{
			_uniform = _iUniform;
		};
	};
};
if (_vest == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_vest = _bVest;
		};
		case str(opfor):
		{
			_vest = _oVest;
		};
		case str(independent):
		{
			_vest = _iVest;
		};
	};
};
if (_backpack == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_backpack = _bBackpack;
		};
		case str(opfor):
		{
			_backpack = _oBackpack;
		};
		case str(independent):
		{
			_backpack = _iBackpack;
		};
	};
};
if (_goggles == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_goggles = _bGoggles;
		};
		case str(opfor):
		{
			_goggles = _oGoggles;
		};
		case str(independent):
		{
			_goggles = _iGoggles;
		};
	};
};
if (_helmet == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_helmet = _bHelmet;
		};
		case str(opfor):
		{
			_helmet = _oHelmet;
		};
		case str(independent):
		{
			_helmet = _iHelmet;
		};
	};
};
if (_binocular == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_binocular = _bBinocular;
		};
		case str(opfor):
		{
			_binocular = _oBinocular;
		};
		case str(independent):
		{
			_binocular = _iBinocular;
		};
	};
};
if (_weapon == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_weapon = _bWeapon;
		};
		case str(opfor):
		{
			_weapon = _oWeapon;
		};
		case str(independent):
		{
			_weapon = _iWeapon;
		};
	};
};
if (count _weaponAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_weaponAmmo = _bWeaponAmmo;
		};
		case str(opfor):
		{
			_weaponAmmo = _oWeaponAmmo;
		};
		case str(independent):
		{
			_weaponAmmo = _iWeaponAmmo;
		};
	};
};
if (_pistol == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_pistol = _bPistol;
		};
		case str(opfor):
		{
			_pistol = _oPistol;
		};
		case str(independent):
		{
			_pistol = _iPistol;
		};
	};
};
if (count _pistolAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_pistolAmmo = _bPistolAmmo;
		};
		case str(opfor):
		{
			_pistolAmmo = _oPistolAmmo;
		};
		case str(independent):
		{
			_pistolAmmo = _iPistolAmmo;
		};
	};
};
if (_launcher == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_launcher = _bLauncher;
		};
		case str(opfor):
		{
			_launcher = _oLauncher;
		};
		case str(independent):
		{
			_launcher = _iLauncher;
		};
	};
};
if (count _launcherAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_launcherAmmo = _bLauncherAmmo;
		};
		case str(opfor):
		{
			_launcherAmmo = _oLauncherAmmo;
		};
		case str(independent):
		{
			_launcherAmmo = _iLauncherAmmo;
		};
	};
};
if (count _uniformAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_uniformAmmo = _bUniformAmmo;
		};
		case str(opfor):
		{
			_uniformAmmo = _oUniformAmmo;
		};
		case str(independent):
		{
			_uniformAmmo = _iUniformAmmo;
		};
	};
};
if (count _vestAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_vestAmmo = _bVestAmmo;
		};
		case str(opfor):
		{
			_vestAmmo = _oVestAmmo;
		};
		case str(independent):
		{
			_vestAmmo = _iVestAmmo;
		};
	};
};
if (count _backpackAmmo == 0) then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_backpackAmmo = _bBackpackAmmo;
		};
		case str(opfor):
		{
			_backpackAmmo = _oBackpackAmmo;
		};
		case str(independent):
		{
			_backpackAmmo = _iBackpackAmmo;
		};
	};
};
if (_silencer == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_silencer = _bSilencer;
		};
		case str(opfor):
		{
			_silencer = _oSilencer;
		};
		case str(independent):
		{
			_silencer = _iSilencer;
		};
	};
};
if (_laser == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_laser = _bLaser;
		};
		case str(opfor):
		{
			_laser = _oLaser;
		};
		case str(independent):
		{
			_laser = _iLaser;
		};
	};
};
if (_optic == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_optic = _bOptic;
		};
		case str(opfor):
		{
			_optic = _oOptic;
		};
		case str(independent):
		{
			_optic = _iOptic;
		};
	};
};
if (_bipod == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_bipod = _bBipod;
		};
		case str(opfor):
		{
			_bipod = _oBipod;
		};
		case str(independent):
		{
			_bipod = _iBipod;
		};
	};
};
if (_radio == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_radio = _bRadio;
		};
		case str(opfor):
		{
			_radio = _oRadio;
		};
		case str(independent):
		{
			_radio = _iRadio;
		};
	};
};
if (_nv == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_nv = _bNv;
		};
		case str(opfor):
		{
			_nv = _oNv;
		};
		case str(independent):
		{
			_nv = _iNv;
		};
	};
};
if (_gps == "") then
{
	switch (_side) do
	{
		case str(blufor):
		{
			_gps = _bGps;
		};
		case str(opfor):
		{
			_gps = _oGps;
		};
		case str(independent):
		{
			_gps = _iGps;
		};
	};
};

if (count _uniformAmmo != 0) then
{
	_uniformItems = _uniformItems + _uniformAmmo;
};
if (count _vestAmmo != 0) then
{
	_vestItems = _vestItems + _vestAmmo;
};
if (count _backpackAmmo != 0) then
{
	_backpackItems = _backpackItems + _backpackAmmo;
};

if (daytime > 5 && daytime < 15) then
{
	_nv = "";
	_laser = "acc_flashlight";
};

if (_watch != "") then
{
	_linkedItems = _linkedItems + [_watch];
};
if (_radio != "") then
{
	_linkedItems = _linkedItems + [_radio];
};
if (_compass != "") then
{
	_linkedItems = _linkedItems + [_compass];
};
if (_gps != "") then
{
	_linkedItems = _linkedItems + [_gps];
};
if (_nv != "") then
{
	_linkedItems = _linkedItems + [_nv];
};
if (_map != "") then
{
	_linkedItems = _linkedItems + [_map];
};

if (!_silenced) then
{
	_silencer = "";
	_pistolSilencer = "";
};
if (_silencer != "") then
{
	_weaponAttachements = _weaponAttachements + [_silencer];
};
if (_laser != "") then
{
	_weaponAttachements = _weaponAttachements + [_laser];
};
if (_optic != "") then
{
	_weaponAttachements = _weaponAttachements + [_optic];
};
if (_bipod != "") then
{
	_weaponAttachements = _weaponAttachements + [_bipod];
};
if (_pistolLaser != "") then
{
	_pistolAttachements = _pistolAttachements + [_pistolLaser];
};
if (_pistolSilencer != "") then
{
	_pistolAttachements = _pistolAttachements + [_pistolSilencer];
};
if (_pistolOptic != "") then
{
	_pistolAttachements = _pistolAttachements + [_pistolOptic];
};

[_unit,_uniform,_vest,_backpack,_goggles,_helmet,_weapon,_weaponAmmo,_weaponAttachements,_pistol,_pistolAmmo,_pistolAttachements,_launcher,_launcherAmmo,_binocular,_binocularAmmo,_uniformItems,_vestItems,_backpackItems,_linkedItems,_insignia,_radioConfig] spawn CODI_Loadout_fnc_equip;