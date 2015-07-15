while {backpack player == ""} do 
	{
		sleep 6;
	};
	
removeAllPrimaryWeaponItems player;
player addPrimaryWeaponItem "ACE_optic_Hamr_PIP";
if ((typeOf player) == "first_Squadleader" OR (typeOf player) == "first_Teamleader") then {
	player addItemToBackpack "SmokeShellBlue";
	player addItemToBackpack "SmokeShellBlue";
	player addItemToBackpack "SmokeShellYellow";
	player addItemToBackpack "SmokeShellYellow";
	player addItemToBackpack "SmokeShellRed";
	player addItemToBackpack "SmokeShellRed";
	};
	
if ((typeOf player) == "first_Medic" OR (typeOf player) == "first_CFR") then {
	player addItemToBackpack "ACE_personalAidKit";
	player addItemToBackpack "ACE_personalAidKit";
	player addItemToBackpack "ACE_personalAidKit";
	player addItemToBackpack "ACE_personalAidKit";
	player addItemToBackpack "ACE_surgicalKit";
	player addItemToBackpack "ACE_surgicalKit";
	};
