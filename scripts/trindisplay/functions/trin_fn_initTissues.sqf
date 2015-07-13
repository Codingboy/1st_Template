private ["_gTisTot", "_pgAlv", "_rGAmb", "_gdiveTime", "_gtisK", "_gtisConst", "_percG", "_gPressure", "_gdPressure"];

_percG = _this select 0;
_gtisK = _this select 1;
_gPressure = _this select 2;
_gdPressure = _this select 3;
_gdiveTime = _this select 4;

_pgAlv = _percG *(_gPressure - 0.0567);
_rGAmb = ((_gdPressure /60) *_percG);
_gtisConst = (-_gtisK *(_gdiveTime/60));
_gTisTot = _pgAlv + _rGAmb *((_gdiveTime/60) -(1/_gtisK)) - (_pgAlv -0.736 - (_rGAmb/_gtisK)) *exp (_gtisConst);

_gTisTot

