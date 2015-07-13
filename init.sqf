tf_no_auto_long_range_radio = true;
TF_give_personal_radio_to_regular_soldier = false;
TF_give_microdagr_to_soldier = false;
tf_same_sw_frequencies_for_side = false;
tf_same_lr_frequencies_for_side = false;

call compile preprocessFileLineNumbers "fhqtt2.sqf";

call compile preprocessFileLineNumbers "CODI\Loadout\init.sqf";
call compile preprocessFileLineNumbers "CODI\missionGenerator\init.sqf";

[] call compile preprocessFileLineNumbers "CSSA3\CSSA3_init.sqf";

getGasTot = compile preprocessFileLineNumbers "scripts\trindisplay\functions\trin_fn_gasCalc.sqf";
getTisTot = compile preprocessFileLineNumbers "scripts\trindisplay\functions\trin_fn_initTissues.sqf";