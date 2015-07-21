_firer = _this select 0; // Wer hat gefeuert
_weapon = _this select 1; // Welche Waffe wurde benutzt. Granatenwerfen ist Waffe "Throw"
_ammo = _this select 4; // Welche Munition/Rauchgranate wurde benutzt
_projectile = _this select 6; // Das Projektil an sich. Für Positionsbestimmung

//Bedingung prüfen, ob eine zulässige Rauchgranate geworfen wurde.
if (!((_ammo == "SmokeShellYellow" AND _weapon == "Throw") OR (_ammo == "SmokeShellRed" AND _weapon == "Throw") OR (_ammo == "SmokeShellBlue" AND _weapon == "Throw"))) exitWith{};
exitVar = 0;
sleep 5; 
_projectilePos = getPos _projectile;
if (supply_ammo >= max_supply_ammo AND _ammo == "SmokeShellBlue") then 
	{
	_text = format["%1, hier Hauptquartier. Keine Munition mehr verfügbar. Ende.",name _firer];
	[[_text,""],"Com_fnc_sideChat",true,false] spawn BIS_fnc_MP;
	//[West,"HQ"] sideChat format["%1, hier Hauptquartier. Keine Munition mehr verfügbar. Ende.",name _firer];
	exitVar = 1;
	};
	
if (supply_explosives >= max_supply_explosives AND _ammo == "SmokeShellYellow") then 
	{
	[West,"HQ"] sideChat format["%1, hier Hauptquartier. Keine Raketen verfügbar. Ende.",name _firer];
	exitVar = 1;
	};
	
if (max_supply_medical >= supply_medical AND _ammo == "SmokeShellRed") then 
	{
	[West,"HQ"] sideChat format["%1, hier Hauptquartier. Kein medizinischer Nachschub mehr verfügbar. Ende.",name _firer];
	exitVar = 1;
	};
if (exitVar == 1) exitWith {};
	
//Supply in Progress setzen. Wenn Supply in Progress == 1 wird das Script um 90 Sekunden verzögert.
if (isNil "SupplyInProgress") then
	{
	SupplyInProgress = 0;
	publicVariable "SupplyInProgress";
	};

if (SupplyInProgress > 0) then 
	{
	_projectilePos =getPos _projectile;
	_text = format["%1, hier Hauptquartier. Helikopter ist noch unterwegs. Bitte warten!",name _firer];
	[[_text,""],"Com_fnc_sideChat",true,false] spawn BIS_fnc_MP;
	};
	
while {SupplyInProgress > 0} do
	{
	sleep 5;
	};



_supplyMsg = {
	_supply = _this select 0;
	_type = _this select 1;
	_name = _this select 2;
	_firer = _this select 3;
	_firer sideChat format ["Hauptquartier, hier %1. Nachschub angefordert, kommen.",_name]; 
	sleep 6;
	[West,"HQ"] sideChat format ["%1, hier Hauptquartier. Helikopter mit Nachschub auf dem Weg.",_name];
	sleep 8;
	_text1 = format ["%3, hier Hauptquartier. Noch %1 Anforderungen %2 verbleibend. Hauptquartier Ende.", _supply, _type,_name];
	[West,"HQ"] sideChat _text1;
	};

//Variablen verwalten und hint sowie Radio Chats erzeugen.
if (_ammo == "SmokeShellYellow") then 
	{ 
	hint "Rucksackladungen angefordert";
	supply_explosives = supply_explosives +1;
	publicVariable "supply_explosives";
	
	_supplyRemain = max_supply_explosives - supply_explosives;
	_playerName = name _firer;
	[_supplyRemain,"Munition für Raketenwerfer",_playerName,_firer] spawn _supplyMsg; 
	SupplyinProgress = SupplyInProgress + 1;
	publicVariable "SupplyInProgress";
	};
	
if (_ammo == "SmokeShellRed") then 
	{ 
	hint "Medizinischen Nachschub angefordert";
	supply_medical = supply_medical +1;
	publicVariable "supply_medical";
	
	_supplyRemain = max_supply_medical - supply_medical;
	_playerName = name _firer;
	[_supplyRemain,"medizinischer Nachschub",_playerName,_firer] spawn _supplyMsg;
	SupplyinProgress = SupplyInProgress + 1;
	publicVariable "SupplyInProgress";
	};
	
if (_ammo == "SmokeShellBlue") then 
	{ 
	supply_ammo = supply_ammo +1;
	publicVariable "supply_ammo";
	hint "Munitionsnachschub angefordert";
	
	_supplyRemain = max_supply_ammo - supply_ammo;
	_playerName = name _firer;
	[_supplyRemain,"für Munition",_playerName,_firer] spawn _supplyMsg;
	SupplyinProgress = SupplyInProgress + 1;
	publicVariable "SupplyInProgress";
	};

//Heli und russischen Pilot erzeugen am Marker "helim"
_heli = createVehicle ["RHS_UH1Y_d", getMarkerPos "helim", [], 0, "FLY"];
_group = createGroup east;
_pilot = _group createUnit ["rhs_msv_driver", getMarkerPos "helim", [], 0, "FORM"];
_pilot moveInDriver _heli;
_pilot allowFleeing 0;

//Dem Heli Wegpunkte geben
_wp = (group _heli) addWaypoint [_projectilePos, 0]; 
_wp1 = (group _heli) addWaypoint [getMarkerPos "helim", 0];


//Sobald der Heli an der Rauchgranate angekommen ist, gehts weiter
waitUntil 
	{	
	sleep 1;
	_dis = _heli distance _projectilePos;
	//hint str _dis;
	_heli distance _projectilePos < 150;
	};
	
sleep 1.5;

//Fallschirm und Kiste 10m unter dem Heli erzeugen und aneinanderhängen
_para = createVehicle ["B_Parachute_02_F", [0,0,250], [], 0, ""];
_para setPosATL (_heli modelToWorld[0,0,-10]);
_veh = createVehicle ["B_supplyCrate_F", [0,0,40], [], 0, ""];
_veh attachTo [_para,[0,0,0]];
_veh allowDamage false;
ClearWeaponCargoGlobal _veh; 
ClearMagazineCargoGlobal _veh; 
ClearItemCargoGlobal _veh;
ClearBackpackCargoGlobal _veh;
 
//Kiste beladen
if (_ammo == "SmokeShellYellow") then 
	{	
	_veh addItemCargoGlobal ["SatchelCharge_Remote_Mag",5];
	_veh addItemCargoGlobal ["rhs_m136_hp_mag",4];
	_veh addItemCargoGlobal ["rhs_fim92_mag",4];
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
 
 if (_ammo == "SmokeShellBlue") then 
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
	_veh addItemCargoGlobal ["Titan_AT",4];
	}; 
 
//hubschrauber und Pilot löschen 
sleep 60;
{_heli deleteVehicleCrew _x;} forEach (crew _heli);
deleteVehicle _heli;
SupplyInProgress = 0;
publicVariable "SupplyInProgress";