private["_pos","_dir","_grp","_rnd","_x","_y","_friendlySide"];

_pos = _this select 0;
_dir = _this select 1;
_friendlySide = _this select 2;

_grp = createGroup civilian;
CODI_MissionGenerator_scientist = _grp createUnit["C_scientist_F", _pos, [], 0, "CAN_COLLIDE"];
CODI_MissionGenerator_scientist setDir _dir;
CODI_MissionGenerator_scientist disableAI "MOVE";
CODI_MissionGenerator_scientist setUnitPos "UP";
CODI_MissionGenerator_scientist setVariable ["AGM_AllowUnconscious", true];

_rnd = random 100;
_dir = random 360;
_x = sin(_dir)*_rnd;
_y = cos(_dir)*_rnd;
[_friendlySide, ["CODI_MissionGenerator_tskScientist", "Nehmen Sie den Wissenschaftler fest und bringen Sie ihn in die Basis.", "Wissenschaftler festnehmen", "", [((getPos CODI_MissionGenerator_scientist) select 0) + _x, ((getPos CODI_MissionGenerator_scientist) select 1) + _y, 0], "created"]] call FHQ_TT_addTasks;

CODI_MissionGenerator_trgScientist = createTrigger["EmptyDetector",[0,0,0]];
CODI_MissionGenerator_trgScientist setTriggerStatements["!alive CODI_MissionGenerator_scientist", "['CODI_MissionGenerator_tskScientist', 'failed'] call FHQ_TT_setTaskState;", ""];
CODI_MissionGenerator_trgScientist setTriggerStatements["alive CODI_MissionGenerator_scientist && (getPos CODI_MissionGenerator_scientist) distance (getPos base) < 200", "['CODI_MissionGenerator_tskScientist', 'succeeded'] call FHQ_TT_setTaskState;", ""];