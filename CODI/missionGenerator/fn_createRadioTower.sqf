private["_pos","_dirVector","_upVector","_rnd","_dir","_x","_y","_friendlySide"];
_pos = _this select 0;
_dirVector = _this select 1;
_upVector = _this select 2;
_friendlySide = _this select 3;

CODI_MissionGenerator_radioTower = createVehicle["Land_TTowerBig_2_F", _pos, [], 0, "CAN_COLLIDE"];
CODI_MissionGenerator_radioTower setVectorDirAndUp[_dirVector, _upVector];

_rnd = random 100;
_dir = random 360;
_x = sin(_dir)*_rnd;
_y = cos(_dir)*_rnd;
[_friendlySide, ["CODI_MissionGenerator_tskRadioTower", "Zerstören Sie den Funkturm.", "Funkturm zerstören", "", [((getPos CODI_MissionGenerator_radioTower) select 0) + _x, ((getPos CODI_MissionGenerator_radioTower) select 1) + _y, 0], "created"]] call FHQ_TT_addTasks;

CODI_MissionGenerator_trgRadioTower = createTrigger["EmptyDetector",[0,0,0]];
CODI_MissionGenerator_trgRadioTower setTriggerStatements["!alive CODI_MissionGenerator_radioTower", "['CODI_MissionGenerator_tskRadioTower', 'succeeded'] call FHQ_TT_setTaskState;", ""];