private["_pos","_mine","_side"];

_pos = _this select 0;
_side = _this select 1;

_mine = createMine["ATMine", _pos, [], 0];
_side revealMine _mine;
civilian revealMine _mine;