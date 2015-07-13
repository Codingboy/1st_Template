private["_pos","_radius","_side"];

_pos = _this select 0;
_side = _this select 1;

_radius = 100;
switch (_side) do
{
	case opfor:
	{
		[[["O_Soldier_TL_F",1],["O_Soldier_AR_F",0.5,"O_soldier_M_F",0.5],["O_medic_F",0.5,"O_Soldier_LAT_F",0.25,"O_Soldier_F",0.25]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
	case blufor:
	{
		[[["B_Soldier_TL_F",1],["B_Soldier_AR_F",0.5,"B_soldier_M_F",0.5],["B_medic_F",0.5,"B_Soldier_LAT_F",0.25,"B_Soldier_F",0.25]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
	case independent:
	{
		[[["I_Soldier_TL_F",1],["I_Soldier_AR_F",0.5,"I_soldier_M_F",0.5],["I_medic_F",0.5,"I_Soldier_LAT_F",0.25,"I_Soldier_F",0.25]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
};