private ["_gPressure", "_gConc", "_boyleConst", "_gAta", "_gSol", "_gG", "_gMv", "_gTemp", "_gMol", "_gTot"];

_gPressure = _this select 0;
_gConc = _this select 1;
_boyleConst = _this select 2;
_gTemp = _this select 3;
_gMol = _this select 4;
_gAta = _this select 5;

//_gAta = _gPressure * _gConc;
_gSol = (_gAta /_boyleConst) *_gMol;
_gG = (_gSol - 0.0137) /_gMol;
_gMv = (_gG *0.0821 *_gTemp) *1000;
_gTot = _gMv *3.1248;

_gTot