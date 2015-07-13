private ["_isMedic","_side","_binocular","_veh","_class","_unit","_visual","_uniform","_vest","_backpack","_goggles","_helmet","_weapon","_weaponAmmo","_weaponAttachements","_secondary","_secondaryAmmo","_secondaryAttachements","_launcher","_launcherAmmo","_uniformItems","_vestItems","_backpackItems","_linkedItems"];

_unit = _this select 0;
_class = _this select 1;
_visual = _this select 2;
_side = _this select 3;
_veh = _this select 4;

_uniform = uniform _unit;
_vest = vest _unit;
_backpack = backpack _unit;
_goggles = goggles _unit;
_helmet = headgear _unit;
_weapon = primaryWeapon _unit;
_weaponAmmo = primaryWeaponMagazine _unit;
_weaponAttachements = primaryWeaponItems _unit;
_secondary = handgunWeapon _unit;
_secondaryAmmo = handgunMagazine _unit;
_secondaryAttachements = handgunItems _unit;
_launcher = secondaryWeapon _unit;
_launcherAmmo = secondaryWeaponMagazine _unit;
_uniformItems = uniformItems _unit;
_tmp = [];
{
	_tmp = _tmp + [[_x, 1]];
}
forEach _uniformItems;
_uniformItems = _tmp;
_vestItems = vestItems _unit;
_tmp = [];
{
	_tmp = _tmp + [[_x, 1]];
}
forEach _vestItems;
_vestItems = _tmp;
_backpackItems = backpackItems _unit;
_tmp = [];
{
	_tmp = _tmp + [[_x, 1]];
}
forEach _backpackItems;
_backpackItems = _tmp;
_binocular = binocular _unit;
_linkedItems = assignedItems _unit;

if (_veh getVariable["umgezogen", false]) then
{
	[_unit,
	_veh getVariable["uniform",""],
	_veh getVariable["vest", ""],
	_veh getVariable["backpack", ""],
	_veh getVariable["goggles", ""],
	_veh getVariable["helmet", ""],
	_veh getVariable["weapon", ""],
	_veh getVariable["weaponammo", []],
	_veh getVariable["weaponattachements", []],
	_veh getVariable["secondary", ""],
	_veh getVariable["secondaryammo", []],
	_veh getVariable["secondaryattachements", []],
	_veh getVariable["launcher", ""],
	_veh getVariable["launcherammo", []],
	_veh getVariable["binocular", ""],
	"",
	_veh getVariable["uniformitems", []],
	_veh getVariable["vestitems", []],
	_veh getVariable["backpackitems", []],
	_veh getVariable["linkeditems", []],
	"MANW",
	""] spawn CODI_Loadout_fnc_equip;
}
else
{
	_isMedic = false;
	if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
	{
		if (_unit getVariable["AGM_IsMedic", false]) then
		{
			_isMedic = true;
		};
	};
	if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then
	{
		if ((_unit getVariable["ACE_Medical_medicClass", 0]) == 1) then
		{
			_isMedic = true;
		};
	};
	[_unit, _class, _visual, _side, false, false, _isMedic, false, false] call CODI_Loadout_fnc_loadouts;
	_veh setVariable["umgezogen", true];
};

_veh setVariable["uniform", _uniform];
_veh setVariable["vest", _vest];
_veh setVariable["backpack", _backpack];
_veh setVariable["goggles", _goggles];
_veh setVariable["helmet", _helmet];
_veh setVariable["weapon", _weapon];
_veh setVariable["weaponammo", _weaponAmmo];
_veh setVariable["weaponattachements", _weaponAttachements];
_veh setVariable["secondary", _secondary];
_veh setVariable["secondaryammo", _secondaryAmmo];
_veh setVariable["secondaryattachements", _secondaryAttachements];
_veh setVariable["launcher", _launcher];
_veh setVariable["launcherammo", _launcherAmmo];
_veh setVariable["binocular", _binocular];
_veh setVariable["uniformitems", _uniformItems];
_veh setVariable["vestitems", _vestItems];
_veh setVariable["backpackitems", _backpackItems];
_veh setVariable["linkeditems", _linkedItems];
