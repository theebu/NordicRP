/*
    File: fn_spawnPointSelected.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_busCfg","_bus"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,0,[0]] call BIS_fnc_param;

_busCfg = [playerSide] call life_fnc_busPointCfg;
_bus = _busCfg select _selection;

[((findDisplay 98500) displayCtrl 98502),1,0.1,getMarkerPos (_bus select 0)] call life_fnc_setMapPosition;
_busCost = ((player distance getMarkerPos (_bus select 0)) / 10);
_busCost = round _busCost;
life_bus_point = _bus;
life_bus_cost = _busCost;
ctrlSetText[98501,format["%2: %1",_busCost,"Ticket Cost: $"]];