private["_dist","_veh","_vehicles","_side"];
if (!isServer) exitWith{};

_side = _this select 0;

_veh = objNull;
_vehicles = [];

{
	if ((getPos _x) distance (getPos base) < 1500) then
	{
		_vehicles = _vehicles + [_x];
	};
}
forEach vehicles;

while {isNull _veh} do
{
	{
		if ((getPos _x) distance (getPos base) > 1500) then
		{
			_veh = _x;
		};
	}
	forEach _vehicles;
	sleep 10;
};
waitUntil{((getPosATL _veh) select 2 < 1) && ((speed _veh) < 1)};
sleep(60*60);

_dist = -1;
while {_dist < 500} do
{
	_dist = 100000;
	{
		if ((getPos _veh) distance (getPos _x) < _dist) then
		{
			_dist = (getPos _veh) distance (getPos _x);
		};
	}
	forEach (playableUnits + [player]);
	sleep (60*5);
};
switch (_side) do
{
	case opfor:
	{
		[["O_Soldier_TL_F","O_Soldier_F","O_Soldier_F","O_Soldier_F"], getPos _veh, 50] call CODI_MissionGenerator_fnc_createGroup;
	};
	case blufor:
	{
		[["B_Soldier_TL_F","B_Soldier_F","B_Soldier_F","B_Soldier_F"], getPos _veh, 50] call CODI_MissionGenerator_fnc_createGroup;
	};
	case independent:
	{
		[["I_Soldier_TL_F","I_Soldier_F","I_Soldier_F","I_Soldier_F"], getPos _veh, 50] call CODI_MissionGenerator_fnc_createGroup;
	};
};