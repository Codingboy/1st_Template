private["_obj","_value","_variable"];

_obj = _this select 0;
_variable = _this select 1;
_value = _this select 2;

player setVariable[_variable, _value];