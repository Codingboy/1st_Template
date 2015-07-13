private["_units","_pos","_radius","_grp","_x","_y","_lead","_unit","_i","_side"];

_units = _this select 0;
_side = _this select 1;
_pos = _this select 2;
_radius = _this select 3;

_grp = createGroup _side;
_x = -2;
_y = 0;
_lead = objNull;
_i = 0;
while {count _units > _i} do
{
	_unit = _grp createUnit[_units select _i, [(_pos select 0)+_x,(_pos select 1)+_y,0], [], 0, "NONE"];
	if (isNull _lead) then
	{
		_lead = _unit;
	};
	_i = _i + 1;
	_x = _x + 2;
	if (_x > 2) then
	{
		_x = -2;
		_y = _y + 2;
	};
};
if (random 1 < 0.5) then
{
	_grp enableIRLasers true;
};
[_grp, getPos _lead, _radius, 10, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;
{
	if (surfaceIsWater(waypointPosition _x)) then
	{
		deleteWaypoint _x;
	};
}
forEach waypoints _grp;
if (isClass (configFile >> "CfgPatches" >> "ALiVE_sys_profile")) then
{
	[false, [_grp], []] call ALIVE_fnc_createProfilesFromUnitsRuntime;
};