private["_dist","_veh","_count","_pos","_grp","_grps","_side"];
if (!isServer) exitWith{};
_veh = _this select 0;
_dist = _this select 1;
_side = _this select 2;

[getPos _veh, 150, 50, 500, 50, 5] spawn CODI_MissionGenerator_fnc_mortar;

_grps = allGroups;
_grp = [];
_pos = [((getPos _veh) select 0),((getPos _veh) select 1)+1*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;//0
};
_pos = [((getPos _veh) select 0)+0.383*_dist,((getPos _veh) select 1)+0.924*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)+0.707*_dist,((getPos _veh) select 1)+0.707*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)+0.924*_dist,((getPos _veh) select 1)+0.383*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)+1*_dist,((getPos _veh) select 1),((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;//90
};
_pos = [((getPos _veh) select 0)+0.924*_dist,((getPos _veh) select 1)-0.383*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)+0.707*_dist,((getPos _veh) select 1)-0.707*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)+0.383*_dist,((getPos _veh) select 1)-0.924*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0),((getPos _veh) select 1)-1*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;//180
};
_pos = [((getPos _veh) select 0)-0.383*_dist,((getPos _veh) select 1)-0.924*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)-0.707*_dist,((getPos _veh) select 1)-0.707*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)-0.924*_dist,((getPos _veh) select 1)-0.383*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)-1*_dist,((getPos _veh) select 1),((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;//270
};
_pos = [((getPos _veh) select 0)-0.924*_dist,((getPos _veh) select 1)+0.383*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)-0.707*_dist,((getPos _veh) select 1)+0.707*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
_pos = [((getPos _veh) select 0)-0.383*_dist,((getPos _veh) select 1)+0.924*_dist,((getPos _veh) select 2)];
if (!surfaceIsWater _pos) then
{
	//[_pos, _side] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;
};
{
	if (!(_x in _grps)) then
	{
		_grp = _grp + [_x];
	}
}
forEach allGroups;
{
	if (side (leader _x) == _side) then
	{
		while {(count (waypoints _x)) > 0} do
		{
			deleteWaypoint ((waypoints _x) select 0);
		};
		_count = count (waypoints _x);
		_x addWaypoint [getPos _veh, _count];
		[_x, _count] setWaypointBehaviour "AWARE";
		[_x, _count] setWaypointFormation "LINE";
		[_x, _count] setWaypointSpeed "FULL";
		[_x, _count] setWaypointType "MOVE";
		//[_x, _count] setWaypointType "SAD";
		_x setCurrentWaypoint [_x, _count];
	};
}
forEach _grp;