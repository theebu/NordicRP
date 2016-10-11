#include "..\..\script_macros.hpp"
/*
    File: fn_spawnConfirm.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Spawns the player where he selected.
*/
private["_busCfg","_bus","_busPos"];
closeDialog 0;

if (life_bus_point isEqualTo []) then {
   
} else {

	if (CASH > life_bus_cost) then {
		cutText["","BLACK FADED"];
		0 cutFadeOut 9999999;
		_display = findDisplay 46;
		_control = _display ctrlCreate ["RscPicture", 22505];
		_control ctrlSetPosition [safezoneX,safezoneY,safeZoneW,safeZoneH]; // Not sure the position is correct
		_control ctrlCommit 0;
		_control ctrlSetText "path\to\picture.paa";
		sleep 10;
		cutText ["","BLACK IN"];
		player setPos (getMarkerPos (life_bus_point select 0));
		titleText[format["%2 %1",life_bus_point select 1,"Thank you for using Altis Bus Systems"],"BLACK IN"];
		CASH = CASH - life_bus_cost;
	}
	else
	{
		hintSilent "Not enough cash!";
	};
};