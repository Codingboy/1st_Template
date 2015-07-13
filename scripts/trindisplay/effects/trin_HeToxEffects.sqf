_HeToxRunScript = _this select 0;
_HeToxRunEffect = _this select 1;
_HeToxAffDiver = _this select 2;
_HeToxRunTimes = 0;

scopeName "HeToxMainLoop";
while {_HeToxRunScript == "true"} do
{
//player sideChat "Running Script";
scopeName "HeToxSecLoop";
if (_HeToxRunEffect == "true") then
{
_HeToxRunTimes = _HeToxRunTimes + 1;
//player sideChat "Running Effect";
_HeToxColor = ppEffectCreate ["colorCorrections", 1001];
_HeToxBlur = ppEffectCreate ["radialBlur", 1002];
_HeToxDynBlur = ppEffectCreate ["DynamicBlur", 1003];
_HeToxChroma = ppEffectCreate ["chromAberration", 1004];
titleText ["","BLACK OUT",2];
sleep 4;
titleText ["","BLACK IN",4];
_HeToxColor ppEffectEnable true;
_HeToxColor ppEffectAdjust [1, 1, 0, [0.6,0.4,1.0,0.2], [0,1,0,0.5], [0,0,0,0]]; 
_HeToxColor ppEffectCommit 4;
_HeToxBlur ppEffectEnable true;
_HeToxBlur ppEffectAdjust [0.1,0.001,0.15,0.15];
_HeToxDynBlur ppEffectEnable true;
_HeToxDynBlur ppEffectAdjust [0.1];
_HeToxChroma ppEffectEnable true;
_HeToxChroma ppEffectAdjust [0.09,0.4,true];
_HeToxChroma ppEffectCommit 4;
_HeToxBlur ppEffectCommit 4;
_HeToxDynBlur ppEffectCommit 4;
sleep 4;
titleText ["","BLACK OUT",4];
sleep 4;
titleText ["","BLACK IN",4];
ppEffectDestroy _HeToxBlur;
ppEffectDestroy _HeToxDynBlur;
ppEffectDestroy _HeToxChroma;
ppEffectDestroy _HeToxColor;
sleep 4;
};
if (_HeToxRunTimes > 0) then
	{	
		_HeToxRunEffect = "false";
		_HeToxRunTimes = 0;
		//player sideChat "Breaking Loop";
		breakTo "HeToxMainLoop";			
	};



};