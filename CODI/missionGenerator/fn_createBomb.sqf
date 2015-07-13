private["_pos","_dirVector","_upVector","_rnd","_dir","_x","_y","_friendlySide","_time"];
_pos = _this select 0;
_dirVector = _this select 1;
_upVector = _this select 2;
_friendlySide = _this select 3;
_time = _this select 4;

nukepos = createVehicle["Land_Device_assembled_F", _pos, [], 0, "CAN_COLLIDE"];
nukepos setVectorDirAndUp[_dirVector, _upVector];

_rnd = random 100;
_dir = random 360;
_x = sin(_dir)*_rnd;
_y = cos(_dir)*_rnd;
[_friendlySide, ["CODI_MissionGenerator_tskBomb", "Zerstören Sie die Atombombe.", "Atombombe zerstören", "", [((getPos nukepos) select 0) + _x, ((getPos nukepos) select 1) + _y, 0], "created"]] call FHQ_TT_addTasks;

CODI_MissionGenerator_trgBomb = createTrigger["EmptyDetector",[0,0,0]];
CODI_MissionGenerator_trgBomb setTriggerStatements["!alive nukepos", "['CODI_MissionGenerator_tskBomb', 'succeeded'] call FHQ_TT_setTaskState;", ""];

[_time] spawn
{
	private["_time"];
	_time = _this select 0;
	_pos = getPos nukepos;
	sleep (_time);
	if (!isNil "nukepos") then
	{
		if (_pos distance (getPos nukepos) < 10) then
		{
			if (alive nukepos) then
			{
				deleteVehicle CODI_MissionGenerator_trgBomb;
				[[[],"nuke\nukeIt.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;
				['CODI_MissionGenerator_tskBomb', 'failed'] call FHQ_TT_setTaskState;
			};
		};
	};
};