private["_unit","_radioConfig","_radio","_callsign","_ftl","_sl","_pl","_sr","_lr","_src","_srac","_emergencyChannel","_slfreq","_freq","_i"];

_unit = [_this, 0, player] call BIS_fnc_param;
_radioConfig = [_this, 1, ""] call BIS_fnc_param;

if (isNil "TFAR_currentUnit") then
{
	TFAR_currentUnit = player;
};
_callsign = groupId (group _unit);
_ftl = false;
_sl = false;
_pl = false;
if (leader (group _unit) == _unit) then
{
	if (_callsign in CODI_Loadout_Callsign_Platoon) then
	{
		_pl = true;
	}
	else
	{
		if (_callsign in CODI_Loadout_Callsign_Fireteam) then
		{
			_ftl = true;
		}
		else
		{
			_sl = true;
		};
	};
};
_sr = [];
_lr = [];
_src = 0;
_srac = 0;
_emergencyChannel = "112";
if (_ftl && (call TFAR_fnc_haveLRRadio)) then
{
	_ftl = false;
	_sl = true;
};
if (!_ftl && !_sl && !_pl) then
{
	_slfreq = "";
	{
		if (count _x == 3) then
		{
			if (_callsign in (_x select 2)) then
			{
				_slfreq = _x select 1;
			};
		};
	}
	forEach CODI_Loadout_Radio;
	{
		if ((_x select 0) == _callsign) then
		{
			_freq = _x select 1;
			_sr = [_freq,_emergencyChannel,_slfreq,format["%1.4",_freq],format["%1.5",_freq],format["%1.6",_freq],format["%1.7",_freq],format["%1.8",_freq]];
		};
	}
	forEach CODI_Loadout_Radio;
	_src = 0;
	_srac = 1;
};
if (_ftl) then
{
	_slfreq = "";
	{
		if (count _x == 3) then
		{
			if (_callsign in (_x select 2)) then
			{
				_slfreq = _x select 1;
			};
		};
	}
	forEach CODI_Loadout_Radio;
	{
		if ((_x select 0) == _callsign) then
		{
			_freq = _x select 1;
			_sr = [_freq,_emergencyChannel,_slfreq,format["%1.4",_freq],format["%1.5",_freq],format["%1.6",_freq],format["%1.7",_freq],format["%1.8",_freq]];
		};
	}
	forEach CODI_Loadout_Radio;
	_src = 0;
	_srac = 2;
};
if (_sl) then
{
	_ftlfreq = [];
	_fireteams = [];
	{
		if ((_x select 0) == _callsign) then
		{
			_freq = _x select 1;
			_fireteams = [];
			if (count _x >= 3) then
			{
				_fireteams = _x select 2;
			};
			{
				_fireteam = _x;
				{
					if ((_x select 0) == _fireteam) then
					{
						_ftlfreq = _ftlfreq + [_x select 1];
					};
				}
				forEach CODI_Loadout_Radio;
			}
			forEach _fireteams;
			_sr = [_freq,_emergencyChannel];
			{
				_sr = _sr + [_x];
			}
			forEach _ftlfreq;
		};
	}
	forEach CODI_Loadout_Radio;
	_src = 0;
	_srac = 1;
	_lr = ["31","32","33","34","35","36","37"];
};
if (_pl) then
{
	_lr = ["31","32","33","34","35","36","37"];
};
if (_radioConfig != "NONE") then
{
	TF_dd_frequency = "32.0";
	waitUntil {call TFAR_fnc_haveSwRadio};
	_radio = call TFAR_fnc_activeSwRadio;
	_i = 1;
	{
		[_radio, _i, _x] call TFAR_fnc_setChannelFrequency;
		_i = _i + 1;
	}
	forEach _sr;
	[_radio, 2] call TFAR_fnc_setSwStereo;
	[_radio, _src] call TFAR_fnc_setSwChannel;
	[_radio, 1] call TFAR_fnc_setAdditionalSwStereo;
	[_radio, _srac] call TFAR_fnc_setAdditionalSwChannel;
	if (call TFAR_fnc_haveLRRadio) then
	{
		_radio = call TFAR_fnc_activeLrRadio;
		_i = 1;
		{
			[_radio, _i, _x] call TFAR_fnc_setChannelFrequency;
			_i = _i + 1;
		}
		forEach _lr;
		[_radio select 0, _radio select 1, 2] call TFAR_fnc_setLrStereo;
	};
};