private["_pos","_dirVector","_upVector","_rnd","_dir","_x","_y","_friendlySide"];

_pos = _this select 0;
_dirVector = _this select 1;
_upVector = _this select 2;
_friendlySide = _this select 3;

CODI_MissionGenerator_tank = createVehicle["O_MBT_02_arty_F", _pos, [], 0, "CAN_COLLIDE"];
CODI_MissionGenerator_tank setVectorDirAndUp[_dirVector, _upVector];
CODI_MissionGenerator_tank lock true;

_rnd = random 100;
_dir = random 360;
_x = sin(_dir)*_rnd;
_y = cos(_dir)*_rnd;
[_friendlySide, ["CODI_MissionGenerator_tskTank", "Zerstören Sie den Panzerprototypen.", "Panzerprototyp zerstören", "", [((getPos CODI_MissionGenerator_tank) select 0) + _x, ((getPos CODI_MissionGenerator_tank) select 1) + _y, 0], "created"]] call FHQ_TT_addTasks;

CODI_MissionGenerator_trgTank = createTrigger["EmptyDetector",[0,0,0]];
CODI_MissionGenerator_trgTank setTriggerStatements["!alive CODI_MissionGenerator_tank", "['CODI_MissionGenerator_tskTank', 'succeeded'] call FHQ_TT_setTaskState;", ""];