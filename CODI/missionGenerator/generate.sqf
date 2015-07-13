hint "exporting mission";
_commands = 'if (!isServer) exitWith{};' + format["    "];
_commands = _commands + format["    "];
_commands = 'private["_enemySide","_pos","_friendlySide"];' + format["    "];
_commands = _commands + format["    "];

_commands = _commands + '_friendlySide = opfor;' + format["    "];
_commands = _commands + '_enemySide = CODI_MissionGenerator_EnemySide;' + format["    "];
_commands = _commands + '_pos = _this select 0;' + format["    "];
_commands = _commands + '[_pos, 2000, 2000, 0] call CODI_MissionGenerator_fnc_moduleCoverMap;' + format["    "];

_commands = _commands + format["    "];
_atGroups = 0;
//_commands = _commands + "//at and aa groups" + format["    "];
{
	if  (markerColor _x == "colorred") then
	{
		_commands = _commands + format['[%1, _enemySide] call CODI_MissionGenerator_fnc_createRandomATGroup;', getMarkerPos _x] + format["    "];
		_atGroups = _atGroups + 1;
	};
	if  (markerColor _x == "colororange") then
	{
		_commands = _commands + format['[%1, _enemySide] call CODI_MissionGenerator_fnc_createRandomAAGroup;', getMarkerPos _x] + format["    "];
		_atGroups = _atGroups + 1;
	};
}
forEach allMapMarkers;

_commands = _commands + format["    "];
_scoutGroups = 0;
//_commands = _commands + "//scout groups" + format["    "];
{
	if  (markerColor _x == "coloryellow") then
	{
		_commands = _commands + format['[%1, _enemySide] call CODI_MissionGenerator_fnc_createRandomPatrolGroup;', getMarkerPos _x] + format["    "];
		_scoutGroups = _scoutGroups + 1;
	};
}
forEach allMapMarkers;

_commands = _commands + format["    "];
_infGroups = 0;
//_commands = _commands + "//normal infantry groups" + format["    "];
{
	if  (markerColor _x == "colorblue") then
	{
		_commands = _commands + format['[%1, _enemySide] call CODI_MissionGenerator_fnc_createRandomCityPatrolGroup;', getMarkerPos _x] + format["    "];
		_infGroups = _infGroups + 1;
	};
}
forEach allMapMarkers;

_commands = _commands + format["    "];
_mgs = 0;
//_commands = _commands + "//static weapons" + format["    "];
{
	_commands = _commands + format['[%1, %2, %3, _enemySide] call CODI_MissionGenerator_fnc_createMG;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
	_mgs = _mgs + 1;
}
forEach (allMissionObjects "O_HMG_01_high_F");
{
	_commands = _commands + format['[%1, %2, %3, _enemySide] call CODI_MissionGenerator_fnc_createMortar;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
	_mgs = _mgs + 1;
}
forEach (allMissionObjects "O_Mortar_01_F");

/*_commands = _commands + format["    "];
_commands = _commands + "//static infantry" + format["    "];
{
	if (typeOf _x != "O_officer_F" && typeOf _x != "SideOPFOR_F" && typeOf _x != "SideResistance_F" && typeOf _x != "SideBLUFOR_F" && _x != player && side _x != blufor && side _x != civilian) then
	{
		_commands = _commands + '_grp = createGroup opfor;' + format["    "];
		_commands = _commands + format['_unit = _grp createUnit["%1", %2, [], 0, "CAN_COLLIDE"];', typeOf _x, getPosATL _x] + format["    "];
		_commands = _commands + format['_unit setDir %1;', getDir _x] + format["    "];
		_commands = _commands + '_unit disableAI "MOVE";' + format["    "];
		_commands = _commands + '_unit setUnitPos "UP";' + format["    "];
	};
}
forEach allUnits;*/

_commands = _commands + format["    "];
//_commands = _commands + "//mines" + format["    "];
{
	_commands = _commands + format['[%1, _enemySide] call CODI_MissionGenerator_fnc_createATMine;', [(getPos _x) select 0, (getPos _x) select 1, 0]] + format["    "];
}
forEach allMines;

_commands = _commands + format["    "];
//_commands = _commands + "//high value targets" + format["    "];
{
	_commands = _commands + format['[%1, %2, _enemySide, _friendlySide] call CODI_MissionGenerator_fnc_createOfficer;', getPosATL _x, getDir _x] + format["    "];
}
forEach (allMissionObjects "O_officer_F");

_commands = _commands + format["    "];
//_commands = _commands + "//high value targets" + format["    "];
{
	_commands = _commands + format['[%1, %2, _friendlySide] call CODI_MissionGenerator_fnc_createScientist;', getPosATL _x, getDir _x] + format["    "];
}
forEach (allMissionObjects "C_scientist_F");

_commands = _commands + format["    "];
//_commands = _commands + "//warheads" + format["    "];
{
	_commands = _commands + format['[%1, %2, %3, _friendlySide, 60*60*4] call CODI_MissionGenerator_fnc_createBomb;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
}
forEach (allMissionObjects "Land_Device_assembled_F");

_commands = _commands + format["    "];
//_commands = _commands + "//radiotowers" + format["    "];
{
	_commands = _commands + format['[%1, %2, %3, _friendlySide] call CODI_MissionGenerator_fnc_createRadioTower;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
}
forEach (allMissionObjects "Land_TTowerBig_2_F");

_commands = _commands + format["    "];
//_commands = _commands + "//HQs" + format["    "];
{
	_commands = _commands + format['[%1, %2, %3, _friendlySide] call CODI_MissionGenerator_fnc_createHQ;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
}
forEach (allMissionObjects "Land_Cargo_HQ_V1_F");

_commands = _commands + format["    "];
//_commands = _commands + "//tanks" + format["    "];
{
	_commands = _commands + format['[%1, %2, %3, _friendlySide] call CODI_MissionGenerator_fnc_createTank;', getPosATL _x, vectorDir _x, vectorUp _x] + format["    "];
}
forEach (allMissionObjects "O_MBT_02_arty_F");

_commands = _commands + format["    "];
_commands = _commands + '[_friendlySide, ["Feindliche Kräfte", "Der Feind verfügt über statische HMGs, AT-Minen, Infantrie sowie AT- und AA-Werfer mit großer Reichweite. Mörser wurden bisher nicht bestätigt, können jedoch auch nicht ausgeschlossen werden."]] call FHQ_TT_addBriefing;' + format["    "];

_commands = _commands + format["    "];
_commands = _commands + format['[[%1, %2, %3, %4, _enemySide], "CODI_MissionGenerator_fnc_count", true, false] call BIS_fnc_MP;', _atGroups, _scoutGroups, _infGroups, _mgs] + format["    "];

copyToClipboard _commands;
hint "mission exported";