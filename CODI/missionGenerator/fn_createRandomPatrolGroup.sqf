private["_pos","_radius","_side"];

_pos = _this select 0;
_side = _this select 1;

_radius = 250;
switch (_side) do
{
	case opfor:
	{
		[[["O_recon_TL_F",1],["O_recon_M_F",0.5,"O_recon_F",0.5]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
	case blufor:
	{
		[[["B_recon_TL_F",1],["B_recon_M_F",0.5,"B_recon_F",0.5]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
	case independent:
	{
		[[["I_Soldier_TL_F",1],["I_Soldier_M_F",0.5,"I_soldier_F",0.5]], _side, _pos, _radius] call CODI_MissionGenerator_fnc_createRandomGroup;
	};
};