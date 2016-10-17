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
		cutText["Please Wait....","BLACK FADED"];
		0 cutFadeOut 9999999;
		/*_display = findDisplay 46;
		_control = _display ctrlCreate ["RscPicture", 22505];
		_control ctrlSetPosition [safezoneX,safezoneY,safeZoneW,safeZoneH]; // Not sure the position is correct
		_control ctrlCommit 0;
		_control ctrlSetText "textures\nordic.jpg";*/
		sleep 10;
		cutText ["Thank you for using Altis Bus Systems","BLACK FADED"];
		player setPos (getMarkerPos (life_bus_point select 0));
		sleep 1;
		titleText["Thank you for using Altis Bus Systems","BLACK IN"];
		CASH = CASH - life_bus_cost;
	}
	else
	{
		hintSilent "Not enough cash!";
	};
};