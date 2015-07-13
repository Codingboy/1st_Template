{
	lbAdd[2100, str(_x)];
}
forEach [blufor, opfor, independent];
{
	lbAdd[2101, _x];
}
forEach [
"AA",
"AAA",
//"AAGMG",
"AAHMG",
"AAR",
"AAT",
//"AGMG",
"AHMG",
"Ammo",
"AMortar",
"AT",
"Crew",
"Diver",
//"DiverExp",
//"DiverFTL",
"DM",
"Eng",
"ExSpec",
"FAC",
"freizeit",
"FTL",
"Gren",
"HeliCrew",
"HeliPilot",
"HMG",
"LAT",
//"Lite",
"LMG",
"Medic",
"MMG",
"Mortar",
"Para",
"Pilot",
"PL",
"Rifleman",
"SL",
"Sniper",
"Spotter",
"SS",
//"Survivor",
"UAV",
//"Unarmed",
"VR"
];
{
	lbAdd[2102, _x];
}
forEach ["flecktarn","tropentarn"];
lbSetCurSel[2100, 0];
lbSetCurSel[2101, 0];
lbSetCurSel[2102, 0];

CODI_Loadout_ClassSelector = _this select 0;