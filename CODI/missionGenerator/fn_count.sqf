_atGroups = _this select 0;
_scoutGroups = _this select 1;
_infGroups = _this select 2;
_mgs = _this select 3;
_side = _this select 4;
_groups = [];
_countUnits = 0;
_countGroups = 0;
{
	if (side _x == _side) then
	{
		_countUnits = _countUnits + 1;
		if ((group _x) in _groups) then
		{
			
		}
		else
		{
			_countGroups = _countGroups + 1;
			_groups = _groups + [group _x];
		};
	};
}
forEach allUnits;

hint format["Befehl %1-%2-%3-%4-%5 ausgegeben", _atGroups, _scoutGroups, _infGroups, _mgs, _countUnits];