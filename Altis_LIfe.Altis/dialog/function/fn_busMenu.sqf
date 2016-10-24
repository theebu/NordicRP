/*
    File: fn_busMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initializes the bus selection menu.
*/
private["_busCfg","_bus","_ctrl"];
disableSerialization;


if (!(createDialog "life_bus_selection")) exitWith {[] call life_fnc_busMenu;};
(findDisplay 98500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_busCfg = [playerSide] call life_fnc_busPointCfg;

_ctrl = ((findDisplay 98500) displayCtrl 98510);
{
    _ctrl lnbAddRow[(_busCfg select _ForEachIndex) select 1,(_busCfg select _ForEachIndex) select 0,""];
    _ctrl lnbSetPicture[[_ForEachIndex,0],(_busCfg select _ForEachIndex) select 2];
    _ctrl lnbSetData[[_ForEachIndex,0],(_busCfg select _ForEachIndex) select 0];
} forEach _busCfg;

_bus = _busCfg select 0; //First option is set by default

[((findDisplay 98500) displayCtrl 98502),1,0.1,getMarkerPos (_bus select 0)] call life_fnc_setMapPosition;
_busCost = ((player distance getMarkerPos (_bus select 0)) / 10);
_busCost = round _busCost;
life_bus_point = _bus;
life_bus_cost = _busCost;

ctrlSetText[98501,format["%2: %1",_busCost,"Ticket Cost: $"]];

(findDisplay 98500) displaySetEventHandler ["KeyDown","if ((_this select 1) isEqualTo 1) then {closeDialog 0;}"];