tf_no_auto_long_range_radio = true;
TF_give_personal_radio_to_regular_soldier = false;
TF_give_microdagr_to_soldier = false;
tf_same_sw_frequencies_for_side = false;
tf_same_lr_frequencies_for_side = false;

call compile preprocessFileLineNumbers "fhqtt2.sqf";

call compile preprocessFileLineNumbers "CODI\Loadout\init.sqf";
call compile preprocessFileLineNumbers "CODI\missionGenerator\init.sqf";

[] call compile preprocessFileLineNumbers "CSSA3\CSSA3_init.sqf";

getGasTot = compile preprocessFileLineNumbers "scripts\trindisplay\functions\trin_fn_gasCalc.sqf";
getTisTot = compile preprocessFileLineNumbers "scripts\trindisplay\functions\trin_fn_initTissues.sqf";

//Nachschub über Rauchgranaten und addAction für die Missionen
if (hasInterface AND ((typeOf player) == "first_Squadleader" OR (typeOf player) == "first_Teamleader")) then {
	player addEventHandler ["Fired", {_this execVM "commander\supply_drop.sqf"}];
	};

if (isServer) then {
 supply_explosives = 0;
 supply_medical = 0;
 supply_ammo = 0;
 max_supply_explosives = 2;
 max_supply_medical = 4;
 max_supply_ammo = 4;
 publicVariable "supply_explosives";
 publicVariable "supply_medical";
 publicVariable "supply_ammo";
 publicVariable "max_supply_explosives";
 publicVariable "max_supply_medical";
 publicVariable "max_supply_ammo";
 }; 
 
 //ViewDistance fest einstellen. Wert bei Bedarf anpassen
  if (hasInterface) then 
	{
	Com_ViewDistance = 1500;
	[Com_ViewDistance]execVM "Commander\viewDistance.sqf";
	};

if (hasInterface) then
{
	['Preload'] call BIS_fnc_arsenal;
	waitUntil {!isNull player};
	player addRating 99999999;
	[player, 25, 3000, 1.4, 0.32, 0.68, 0.00] execVM "scripts\trindisplay\diverstats.sqf";
	player addMPEventHandler["MPRespawn", {player addRating 99999999;[player, 25, 3000, 1.4, 0.32, 0.68, 0.00] execVM "scripts\trindisplay\diverstats.sqf";}];
};