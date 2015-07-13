_friendlySide = _this select 0;

{
	_unit = _x;
	{
		_unit removeSimpleTask _x;
	}
	forEach simpleTasks _unit;
}
forEach playableUnits;
if (!isNil "CODI_MissionGenerator_radioTower") then
{
	deleteVehicle CODI_MissionGenerator_trgRadioTower;
	deleteVehicle CODI_MissionGenerator_radioTower;
};
if (!isNil "CODI_MissionGenerator_tank") then
{
	deleteVehicle CODI_MissionGenerator_trgTank;
	deleteVehicle CODI_MissionGenerator_tank;
};
if (!isNil "CODI_MissionGenerator_scientist") then
{
	deleteVehicle CODI_MissionGenerator_trgScientist;
	deleteVehicle CODI_MissionGenerator_scientist;
};
if (!isNil "CODI_MissionGenerator_officer") then
{
	deleteVehicle CODI_MissionGenerator_trgOfficer;
	deleteVehicle CODI_MissionGenerator_officer;
};
if (!isNil "CODI_MissionGenerator_hq") then
{
	deleteVehicle CODI_MissionGenerator_trgHQ;
	deleteVehicle CODI_MissionGenerator_hq;
};
if (!isNil "nukepos") then
{
	if (!isNil "CODI_MissionGenerator_trgBomb") then
	{
		deleteVehicle CODI_MissionGenerator_trgBomb;
	};
	deleteVehicle nukepos;
};
{
	if (side _x != _friendlySide) then
	{
		deleteVehicle _x;
	}
	else
	{
		if (!canMove _x) then
		{
			deleteVehicle _x;
		};
	};
}
forEach vehicles;
{
	deleteVehicle _x;
}
forEach allDead;
//_start = diag_tickTime;
//{
//	deleteVehicle _x;
//}
//forEach nearestObjects [getPos base, ["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated","TimeBombCore","SmokeShell"], 20000];
//hint format ["Server cleanup took %1 seconds",diag_tickTime - _start];