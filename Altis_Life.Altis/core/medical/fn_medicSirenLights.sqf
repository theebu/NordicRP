#include "..\..\script_macros.hpp"
/*
    File: fn_sirenLights.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Lets play a game! Can you guess what it does? I have faith in you, if you can't
    then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private ["_vehicle","_trueorfalse"];
_vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {}; //Bad entry!
if (!(typeOf _vehicle in ["C_Van_01_box_F","C_Offroad_01_red_F","B_MRAP_01_F","C_Heli_light_01_red_F","I_Heli_light_03_unarmed_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable ["lights",FALSE];

if (_trueorfalse) then {
    _vehicle setVariable ["lights",FALSE,TRUE];
} else {
    _vehicle setVariable ["lights",TRUE,TRUE];
    [_vehicle,0.22] remoteExec ["life_fnc_medicLights",RCLIENT];
};