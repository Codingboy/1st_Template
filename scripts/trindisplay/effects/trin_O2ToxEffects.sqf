_O2ToxRunScript = _this select 0;
_O2ToxRunEffect = _this select 1;
_O2ToxAffDiver = _this select 2;
_O2ToxAffDiverDam = _this select 3;
_O2ToxRunTimes = 0;

scopeName "O2ToxMainLoop";
while {_O2ToxRunScript == "true"} do
{
//player sideChat "Running Script";
scopeName "O2ToxSecLoop";
if (_O2ToxRunEffect == "true") then
{
_O2ToxRunTimes = _O2ToxRunTimes + 1;
//player sideChat "Running Effect";
_O2ToxColor = ppEffectCreate ["colorCorrections", 1001];
_O2ToxBlur = ppEffectCreate ["radialBlur", 1002];
_O2ToxDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_O2ToxChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];
sleep 4;
titleText ["","BLACK IN",4];
_O2ToxColor ppEffectEnable true;
_O2ToxColor ppEffectAdjust [1, 1, 0, [1.0,0.0,0.0,0.2], [0,1,0,0.5], [0,0,0,0]]; 
_O2ToxColor ppEffectCommit 4;
_O2ToxBlur ppEffectEnable true;
_O2ToxBlur ppEffectAdjust [0.001,0.001,0.15,0.15];
_O2ToxDynBlur ppEffectEnable true;
_O2ToxDynBlur ppEffectAdjust [0.5];
_O2ToxChroma ppEffectEnable true;
_O2ToxChroma ppEffectAdjust [0.09,0.09,true];
_O2ToxChroma ppEffectCommit 4;
_O2ToxBlur ppEffectCommit 4;
_O2ToxDynBlur ppEffectCommit 4;
_O2ToxAffDiver setDamage ((getDammage _O2ToxAffDiver) + _O2ToxAffDiverDam);
sleep 4;
titleText ["","BLACK OUT",4];
sleep 4;
titleText ["","BLACK IN",4];
ppEffectDestroy _O2ToxBlur;
ppEffectDestroy _O2ToxDynBlur;
ppEffectDestroy _O2ToxChroma;
ppEffectDestroy _O2ToxColor;
sleep 4;
};
if (_O2ToxRunTimes > 0) then
	{	
		_O2ToxRunEffect = "false";
		_O2ToxRunTimes = 0;
		//player sideChat "Breaking Loop";
		breakTo "O2ToxMainLoop";			
	};



};