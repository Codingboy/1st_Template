private["_pos","_radius","_side"];

_pos = _this select 0;
_side = _this select 1;

_radius = 250;
switch (_side) do
{
	case opfor:
	{
		[["O_Soldier_TL_F","O_Soldier_AAT_F","O_Soldier_AT_F"], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createGroup;
	};
	case blufor:
	{
		[["B_Soldier_TL_F","B_Soldier_AAT_F","B_Soldier_AT_F"], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createGroup;
	};
	case independent:
	{
		[["I_Soldier_TL_F","I_Soldier_AAT_F","I_Soldier_AT_F"], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createGroup;
	};
};