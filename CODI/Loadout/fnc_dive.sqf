/**
Equips a unit with diveequipment. Reequips the unit with its original loadout if vest is dropped.
@param _units: unit that shall be equipped with a diveequipment
@note may be executed on server or client but for easiest use, call it on client.
@example:
[player] execVM "CODI\Loadout\fnc_dive.sqf";
[player] spawn CODI_Loadout_fnc_dive;
*/
private["_backpack","_items","_unit","_goggles"];

_unit = _this select 0;

_uniformItems = uniformItems _unit;
_vestItems = vestItems _unit;
_uniform = uniform _unit;
_vest = vest _unit;
_goggles = goggles _unit;
removeUniform _unit;
removeVest _unit;
removeGoggles _unit;
switch (side _unit) do
{
	case opfor:
	{
		_unit forceAddUniform "U_O_Wetsuit";
		_unit addVest "V_RebreatherIR";
		_unit addGoggles "G_O_Diving";
	};
	case blufor:
	{
		_unit forceAddUniform "U_B_Wetsuit";
		_unit addVest "V_RebreatherB";
		_unit addGoggles "G_B_Diving";
	};
	case independent:
	{
		_unit forceAddUniform "U_I_Wetsuit";
		_unit addVest "V_RebreatherIA";
		_unit addGoggles "G_I_Diving";
	};
};
while {vest _unit != "" && ((getPosASL _unit) select 2) >= 0} do
{
	sleep 10;
};
while {vest _unit != "" && ((getPosASL _unit) select 2) < 0} do
{
	sleep 10;
};
removeUniform _unit;
removeVest _unit;
removeGoggles _unit;
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addGoggles _goggles;
{
	_unit addItemToUniform _x;
}
forEach _uniformItems;
{
	_unit addItemToVest _x;
}
forEach _vestItems;