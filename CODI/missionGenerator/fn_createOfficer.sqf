private["_pos","_dir","_grp","_rnd","_x","_y","_enemySide","_friendlySide"];

_pos = _this select 0;
_dir = _this select 1;
_enemySide = _this select 2;
_friendlySide = _this select 3;

_grp = createGroup _enemySide;
CODI_MissionGenerator_officer = objNull;
switch (_enemySide) do
{
	case opfor:
	{
		CODI_MissionGenerator_officer = _grp createUnit["O_officer_F", _pos, [], 0, "CAN_COLLIDE"];
	};
	case blufor:
	{
		CODI_MissionGenerator_officer = _grp createUnit["B_officer_F", _pos, [], 0, "CAN_COLLIDE"];
	};
	case independent:
	{
		CODI_MissionGenerator_officer = _grp createUnit["I_officer_F", _pos, [], 0, "CAN_COLLIDE"];
	};
};
CODI_MissionGenerator_officer setDir _dir;
CODI_MissionGenerator_officer disableAI "MOVE";
CODI_MissionGenerator_officer setUnitPos "UP";

_rnd = random 100;
_dir = random 360;
_x = sin(_dir)*_rnd;
_y = cos(_dir)*_rnd;
[_friendlySide, ["CODI_MissionGenerator_tskOfficer", "Töten Sie den Offizier.", "Offizier töten", "", [((getPos CODI_MissionGenerator_officer) select 0) + _x, ((getPos CODI_MissionGenerator_officer) select 1) + _y, 0], "created"]] call FHQ_TT_addTasks;

CODI_MissionGenerator_trgOfficer = createTrigger["EmptyDetector",[0,0,0]];
CODI_MissionGenerator_trgOfficer setTriggerStatements["!alive CODI_MissionGenerator_officer", "['CODI_MissionGenerator_tskOfficer', 'succeeded'] call FHQ_TT_setTaskState;", ""];