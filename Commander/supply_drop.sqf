_ammo = _this select 4;
_projectile = _this select 6;

if (!((_ammo == "SmokeShellYellow" AND supply_explosives < max_supply_explosives) OR (_ammo == "SmokeShellRed" AND supply_medical < max_supply_medical) OR (_ammo == "SmokeShellBlue" AND supply_ammo < max_supply_ammo))) exitWith{};

if (_ammo == "SmokeShellYellow") then 
	{ 
	hint "Rucksackladungen angefordert";
	supply_explosives = supply_explosives +1;
	publicVariable "supply_explosives";
	};
	
if (_ammo == "SmokeShellRed") then 
	{ 
	supply_medical = supply_medical +1;
	publicVariable "supply_medical";
	hint "Medizinischen Nachschub angefordert";
	};
	
if (_ammo == "SmokeShellBlue") then 
	{ 
	supply_ammo = supply_ammo +1;
	publicVariable "supply_ammo";
	hint "Munitionsnachschub angefordert";
	};

_heli = createVehicle ["RHS_UH1Y_d", getMarkerPos "helim", [], 0, "FLY"];
_group = createGroup east;
_pilot = _group createUnit ["rhs_msv_driver", getMarkerPos "helim", [], 0, "FORM"];
_pilot moveInDriver _heli;

sleep 5;
_wp = (group _heli) addWaypoint [getPos _projectile, 0]; 
_wp = [group _heli, 0] setWaypointCombatMode "BLUE";
_projectile_pos = getPos _projectile;
waitUntil 
{
	sleep 1;
	_dis = _heli distance _projectile_pos;
	hint str _dis;
	_heli distance _projectile_pos < 100;
};
_para = createVehicle ["B_Parachute_02_F", [0,0,250], [], 0, ""];
_para setPosATL (_heli modelToWorld[0,0,-10]);
_veh = createVehicle ["B_supplyCrate_F", [0,0,40], [], 0, ""];
_veh attachTo [_para,[0,0,0]];
_veh allowDamage false;
ClearWeaponCargoGlobal _veh; 
ClearMagazineCargoGlobal _veh; 
ClearItemCargoGlobal _veh;
ClearBackpackCargoGlobal _veh;
 
if (_ammo == "SmokeShellYellow") then 
	{	
	_veh addItemCargoGlobal ["SatchelCharge_Remote_Mag",5];
	};
 
 if (_ammo == "SmokeShellRed") then 
	{	
	_veh addItemCargoGlobal ["ACE_MapTools",2];
	_veh addItemCargoGlobal ["ACE_RangeTable_82mm",2];
	_veh addItemCargoGlobal ["ACE_CableTie",10];
	_veh addItemCargoGlobal ["ACE_EarPlugs",5];
	_veh addItemCargoGlobal ["ACE_fieldDressing",25];
	_veh addItemCargoGlobal ["ACE_packingBandage",25];
	_veh addItemCargoGlobal ["ACE_elasticBandage",25];
	_veh addItemCargoGlobal ["ACE_tourniquet",5];
	_veh addItemCargoGlobal ["ACE_morphine",25];
	_veh addItemCargoGlobal ["ACE_atropine",20];
	_veh addItemCargoGlobal ["ACE_epinephrine",20];
	_veh addItemCargoGlobal ["ACE_salineIV_250",15];
	_veh addItemCargoGlobal ["ACE_salineIV_500",10];
	_veh addItemCargoGlobal ["ACE_quikclot",25];
	_veh addItemCargoGlobal ["ACE_bodyBag",5];
	};
 
 if (_ammo == "SmokeShellBlue" AND supply_ammo < max_supply_ammo) then 
	{
	_veh addItemCargoGlobal ["30Rnd_556x45_Stanag",24];
	_veh addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",9];
	_veh addItemCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",9];
	_veh addItemCargoGlobal ["rhsusf_100Rnd_762x51",9];
	_veh addItemCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",3];
	_veh addItemCargoGlobal ["20Rnd_762x51_Mag",3];
	_veh addItemCargoGlobal ["rhs_mag_m67",4];
	_veh addItemCargoGlobal ["1Rnd_HE_Grenade_shell",14];
	_veh addItemCargoGlobal ["SmokeShell",4];
	}; 
 
 
 
 
/*
if (_ammo == "SmokeShellRed" AND supply_medical < max_supply_medical) then {
 supply_medical = supply_medical +1;
 publicVariable "supply_medical";
 hint "Medizinischen Nachschub angefordert";
 sleep 19;
 _para = createVehicle ["B_Parachute_02_F", [0,0,250], [], 0, ""];
 _projectile setVectorUp [0,0,1];
 _para setPosATL (_projectile modelToWorld[0,0,100]);
 _veh = createVehicle ["B_supplyCrate_F", [0,0,80], [], 0, ""];
 _veh attachTo [_para,[0,0,0]];
 _veh allowDamage false;
 ClearWeaponCargoGlobal _veh; 
 ClearMagazineCargoGlobal _veh; 
 ClearItemCargoGlobal _veh;
 ClearBackpackCargoGlobal _veh;
 _veh addItemCargoGlobal ["ACE_MapTools",2];
 _veh addItemCargoGlobal ["ACE_RangeTable_82mm",2];
 _veh addItemCargoGlobal ["ACE_CableTie",10];
 _veh addItemCargoGlobal ["ACE_EarPlugs",5];
 _veh addItemCargoGlobal ["ACE_fieldDressing",25];
 _veh addItemCargoGlobal ["ACE_packingBandage",25];
 _veh addItemCargoGlobal ["ACE_elasticBandage",25];
 _veh addItemCargoGlobal ["ACE_tourniquet",5];
 _veh addItemCargoGlobal ["ACE_morphine",25];
 _veh addItemCargoGlobal ["ACE_atropine",20];
 _veh addItemCargoGlobal ["ACE_epinephrine",20];
 _veh addItemCargoGlobal ["ACE_salineIV_250",15];
 _veh addItemCargoGlobal ["ACE_salineIV_500",10];
 _veh addItemCargoGlobal ["ACE_quikclot",25];
 _veh addItemCargoGlobal ["ACE_bodyBag",5];
 };

if (_ammo == "SmokeShellBlue" AND supply_ammo < max_supply_ammo) then {
 supply_ammo = supply_ammo +1;
 publicVariable "supply_ammo";
 hint "Munitionsnachschub angefordert";
 sleep 22;
 _para = createVehicle ["B_Parachute_02_F", [0,0,250], [], 0, ""];
 _projectile setVectorUp [0,0,1];
 _para setPosATL (_projectile modelToWorld[0,0,100]);
 _veh = createVehicle ["B_supplyCrate_F", [0,0,80], [], 0, ""];
 _veh attachTo [_para,[0,0,0]];
 _veh allowDamage false;
 ClearWeaponCargoGlobal _veh; 
 ClearMagazineCargoGlobal _veh; 
 ClearItemCargoGlobal _veh;
 ClearBackpackCargoGlobal _veh;
 _veh addItemCargoGlobal ["30Rnd_556x45_Stanag",24];
 _veh addItemCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",9];
 _veh addItemCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",9];
 _veh addItemCargoGlobal ["rhsusf_100Rnd_762x51",9];
 _veh addItemCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",3];
 _veh addItemCargoGlobal ["20Rnd_762x51_Mag",3];
 _veh addItemCargoGlobal ["rhs_mag_m67",4];
 _veh addItemCargoGlobal ["1Rnd_HE_Grenade_shell",14];
 _veh addItemCargoGlobal ["SmokeShell",4];
 }; 
*/

 //hubschrauber löschen 
sleep 30;
{_heli deleteVehicleCrew _x;} forEach (crew _heli);
deleteVehicle _heli;