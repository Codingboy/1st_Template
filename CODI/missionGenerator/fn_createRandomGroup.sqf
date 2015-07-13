private["_units","_pos","_radius","_toBeSpawned","_actual","_rnd","_i","_finish","_probabillity","_side"];

_units = _this select 0;
_side = _this select 1;
_pos = _this select 2;
_radius = _this select 3;

_toBeSpawned = [];
{
	_actual = _x;
	_rnd = random 1;
	_i = 0;
	_finish = false;
	_probabillity = 0;
	while {_i+1 < count _actual && !_finish} do
	{
		_probabillity = _probabillity + (_actual select (_i+1));
		if (_rnd < _probabillity) then
		{
			_finish = true;
			_toBeSpawned = _toBeSpawned + [_actual select _i];
		};
		_i = _i + 2;
	};
}
forEach _units;
[_toBeSpawned, _side, _pos, _radius] call CODI_MissionGenerator_fnc_createGroup;