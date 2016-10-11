#include "..\..\script_macros.hpp"
/*
    File: fn_restrainAction.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Restrains the target.
*/
private ["_unit"];
_unit = cursorObject;
if (isNull _unit) exitWith {}; //Not valid
if (player distance _unit > 3) exitWith {};
if (_unit getVariable "restrained") exitWith {};
//if (side _unit isEqualTo west) exitWith {};
if (player isEqualTo _unit) exitWith {};

if (side player == civilian) then {
	if(life_inv_zipties < 1) exitWith { hintSilent "You dont have any zipties"; };
	life_inv_zipties = life_inv_zipties - 1;
	hintSilent "You have ziptied him";
};
if (!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff";

_unit setVariable ["restrained",true,true];
[player] remoteExec ["life_fnc_restrain",_unit];
[0,"STR_NOTF_Restrained",true,[_unit getVariable ["realname", name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];