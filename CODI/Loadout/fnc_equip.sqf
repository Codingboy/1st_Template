private ["_radioConfig","_unit","_uniform","_vest","_backpack","_goggles","_helmet","_weapon","_weaponAmmo","_weaponAttachements","_secondary","_secondaryAmmo","_secondaryAttachements","_launcher","_launcherAmmo","_binocular","_binocularAmmo","_uniformItems","_vestItems","_backpackItems","_linkedItems","_insignia"];

_unit = _this select 0;

_uniform = _this select 1;
_vest = _this select 2;
_backpack = _this select 3;
_goggles = _this select 4;
_helmet = _this select 5;
_weapon = _this select 6;
_weaponAmmo = _this select 7;
_weaponAttachements = _this select 8;
_secondary = _this select 9;
_secondaryAmmo = _this select 10;
_secondaryAttachements = _this select 11;
_launcher = _this select 12;
_launcherAmmo = _this select 13;
_binocular = _this select 14;
_binocularAmmo = _this select 15;
_uniformItems = _this select 16;
_vestItems = _this select 17;
_backpackItems = _this select 18;
_linkedItems = _this select 19;
_insignia = _this select 20;
_radioConfig = _this select 21;

//make naked
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

//visual
if (_uniform != "") then
{
	_unit forceAddUniform _uniform;
};
if (_vest != "") then
{
	_unit addVest _vest;
};
if (_backpack != "") then
{
	_unit addBackpack _backpack;
};
if (_goggles != "") then
{
	_unit addGoggles _goggles;
};
if (_helmet != "") then
{
	_unit addHeadgear _helmet;
};

//weapon
if (_weapon != "") then
{
	{
		_unit addMagazine _x;
	}
	forEach _weaponAmmo;
	_unit addWeapon _weapon;
	if (count _weaponAttachements != 0) then
	{
		{
			_unit addPrimaryWeaponItem _x;
		}
		forEach _weaponAttachements;
	};
	if (isClass (configFile >> "CfgPatches" >> "AGM_SafeMode")) then
	{
		[_unit, currentWeapon _unit, currentMuzzle _unit] call AGM_SafeMode_fnc_lockSafety;
	};
	if (isClass (configFile >> "CfgPatches" >> "ace_safemode")) then
	{
		[_unit, currentWeapon _unit, currentMuzzle _unit] call ACE_SafeMode_fnc_lockSafety;
	};
};

//secondary
if (_secondary != "") then
{
	{
		_unit addMagazine _x;
	}
	forEach _secondaryAmmo;
	_unit addWeapon _secondary;
	if (count _secondaryAttachements != 0) then
	{
		{
			_unit addHandgunItem _x;
		}
		forEach _secondaryAttachements;
	};
};

//launcher
if (_launcher != "") then
{
	{
		_unit addMagazine _x;
	}
	forEach _launcherAmmo;
	_unit addWeapon _launcher;
};

//binocular
if (_binocular != "") then
{
	if (_binocularAmmo != "") then
	{
		_unit addMagazine _binocularAmmo;
	};
	_unit addWeapon _binocular;
};

//uniformitems
{
	for "_i" from 1 to (_x select 1) do {_unit addItemToUniform (_x select 0);};
} forEach _uniformItems;

//vestitems
{
	for "_i" from 1 to (_x select 1) do {_unit addItemToVest (_x select 0);};
} forEach _vestItems;

//backpackitems
{
	for "_i" from 1 to (_x select 1) do {_unit addItemToBackpack (_x select 0);};
} forEach _backpackItems;

//items
{
	_unit linkItem _x;
} forEach _linkedItems;

[_unit, _insignia] call bis_fnc_setUnitInsignia;
[_unit, _radioConfig] spawn CODI_Loadout_fnc_radio;