_DCSRunScript = _this select 0;
_DCSRunEffect = _this select 1;
_DCSAffDiver = _this select 2;
_DCSAffDiverDam = _this select 3;
_DCSRunTimes = 0;

scopeName "DCSMainLoop";
while {_DCSRunScript == "true"} do
{
//player sideChat "Running Script";
scopeName "DCSSecLoop";
if (_DCSRunEffect == "true") then
{
_DCSRunTimes = _DCSRunTimes + 1;
//player sideChat "Running Effect";
_DCSColor = ppEffectCreate ["colorCorrections", 1001];
_DCSBlur = ppEffectCreate ["radialBlur", 1002];
_DCSDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_DCSChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",1];
sleep 1;
titleText ["","BLACK IN",1];
_DCSColor ppEffectEnable true;
_DCSColor ppEffectAdjust [1, 1, 0, [1.0,0.0,0.0,0.2], [0,1,0,0.5], [0,0,0,0]]; 
_DCSColor ppEffectCommit 1;
_DCSBlur ppEffectEnable true;
_DCSBlur ppEffectAdjust [0.001,0.001,0.15,0.15];
_DCSDynBlur ppEffectEnable true;
_DCSDynBlur ppEffectAdjust [0.5];
_DCSChroma ppEffectEnable true;
_DCSChroma ppEffectAdjust [0.09,0.09,true];
_DCSChroma ppEffectCommit 1;
_DCSBlur ppEffectCommit 1;
_DCSDynBlur ppEffectCommit 1;
_DCSAffDiver setDamage ((getDammage _DCSAffDiver) + _DCSAffDiverDam);
sleep 1;
titleText ["","BLACK OUT",1];
sleep 1;
titleText ["","BLACK IN",1];
ppEffectDestroy _DCSBlur;
ppEffectDestroy _DCSDynBlur;
ppEffectDestroy _DCSChroma;
ppEffectDestroy _DCSColor;
sleep 1;
};
if (_DCSRunTimes > 0) then
	{	
		_DCSRunEffect = "false";
		_DCSRunTimes = 0;
		//player sideChat "Breaking Loop";
		breakTo "DCSMainLoop";			
	};



};