private["_unit","_grp","_veh","_upVector","_dirVector","_pos"];

_pos = _this select 0;
_dirVector = _this select 1;
_upVector = _this select 2;
_side = _this select 3;

_veh = objNull;
switch (_side) do
{
	case opfor:
	{
		_veh = createVehicle["O_HMG_01_high_F", _pos, [], 0, "CAN_COLLIDE"];
	};
	case blufor:
	{
		_veh = createVehicle["B_HMG_01_high_F", _pos, [], 0, "CAN_COLLIDE"];
	};
	case independent:
	{
		_veh = createVehicle["I_HMG_01_high_F", _pos, [], 0, "CAN_COLLIDE"];
	};
};
_veh setVectorDirAndUp[_dirVector, _upVector];
_veh disableTIEquipment true;
_grp = createGroup _side;
_unit = objNull;
switch (_side) do
{
	case opfor:
	{
		_unit = _grp createUnit["O_Soldier_F", _pos, [], 0, "NONE"];
	};
	case blufor:
	{
		_unit = _grp createUnit["B_Soldier_F", _pos, [], 0, "NONE"];
	};
	case independent:
	{
		_unit = _grp createUnit["I_Soldier_F", _pos, [], 0, "NONE"];
	};
};
_unit moveInGunner _veh;
_unit setFormDir (getDir _veh);

if (isClass (configFile >> "CfgPatches" >> "ALiVE_sys_profile")) then
{
	[false, [_grp], [_veh]] call ALIVE_fnc_createProfilesFromUnitsRuntime;
};