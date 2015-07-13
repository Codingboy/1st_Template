_narcRunScript = _this select 0;
_narcRunEffect = _this select 1;
_narcAffDiver = _this select 2;
_narcAffDiverDam = _this select 3;
_narcRunTimes = 0;

scopeName "narcMainLoop";
while {_narcRunScript == "true"} do
{
//player sideChat "Running Script";
scopeName "narcSecLoop";
if (_narcRunEffect == "true") then
{
_narcRunTimes = _narcRunTimes + 1;
//player sideChat "Running Effect";
_narcColor = ppEffectCreate ["colorCorrections", 1001];
_narcBlur = ppEffectCreate ["radialBlur", 1002];
_narcDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_narcChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];
sleep 4;
titleText ["","BLACK IN",4];
_narcColor ppEffectEnable true;
_narcColor ppEffectAdjust [1, 1, 0, [0.6,0.3,0.3,0.2], [0,1,0,0.5], [0,0,0,0]]; 
_narcColor ppEffectCommit 4;
_narcBlur ppEffectEnable true;
_narcBlur ppEffectAdjust [0.01,0.01,0.03,0.03];
_narcDynBlur ppEffectEnable true;
_narcDynBlur ppEffectAdjust [0.5];
_narcChroma ppEffectEnable true;
_narcChroma ppEffectAdjust [0.15,0.15,true];
_narcChroma ppEffectCommit 4;
_narcBlur ppEffectCommit 4;
_narcDynBlur ppEffectCommit 4;
_narcAffDiver setDamage ((getDammage _narcAffDiver) + _narcAffDiverDam);
sleep 4;
titleText ["","BLACK OUT",4];
sleep 4;
titleText ["","BLACK IN",4];
ppEffectDestroy _narcBlur;
ppEffectDestroy _narcDynBlur;
ppEffectDestroy _narcChroma;
ppEffectDestroy _narcColor;
sleep 4;
};
if (_narcRunTimes > 0) then
	{	
		_narcRunEffect = "false";
		_narcRunTimes = 0;
		//player sideChat "Breaking Loop";
		breakTo "narcMainLoop";			
	};



};