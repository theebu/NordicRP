#include "..\..\script_macros.hpp"
/*
    File: fn_busTravel.sqf
    Author: Blaster

    Description:
    Travel by bus!
*/

private["_vendor","_dest","_destInfo"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_dest = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR (_dest == "") OR (player distance _vendor > 10)) exitWith {};

//hint format["%1 %2",_vendor,_dest];
//sleep 3;
switch (_vendor) do 
	{
	case kavalaBus : 
		{
		    _destInfo = switch (_dest) do {
			case "kavalaAir" : {[5101.63, 10799.5, 0.00146103, 540];};
			case "athira" : {[13857.4, 18661.1, 0.00150871, 2360];};
			case "pygros" : {[16547.6, 12549.8, 0.00143886, 2600];};
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 4740];};
			case "airport" : {[14592.5, 16910.9, 0.0014286, 2340];};
			case "syrta" : {[8657.65, 18251.8, 0.00186157, 1500];};
			case "saltAir" : {[22996.4, 18891.6, 0.00140953, 4080];};
			case "malosAir" : {[22996.4, 18891.6, 0.00140953, 5420];};
			default {[];};
		};
	};
	case kavalaAirBus : 
	{
		_destInfo = switch (_dest) do {
			case "kavala" : {[3506.27,13018.8, 0.00137091, 540];};
			default {[];};
		};
	};
	case athiraBus : 
	{
		_destInfo = switch (_dest) do {
			case "kavala" : {[3506.27,13018.8, 0.00137091, 2360];};
			case "pygros" : {[16547.6, 12549.8, 0.00143886, 1340];};
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 2440];};
			case "airport" : {[14592.5, 16910.9, 0.0014286, 380];};
			case "syrta" : {[8657.65, 18251.8, 0.00186157, 1240];};
			case "athiraGarage" : {[14456.3,17768.2,0.00152206, 220];};
			default {[];};
		};
	};
	case athiraGarageBus : 
	{
		_destInfo = switch (_dest) do {			
			case "athira" : {[14456.3,17768.2,0.00152206, 220];};
			default {[];};
		};
	};
	case pygrosBus : 
	{
		_destInfo = switch (_dest) do {
			case "kavala" : {[3506.27,13018.8, 0.00137091, 2600];};
			case "athira" : {[13857.4, 18661.1, 0.00150871, 1340];};
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 2540];};
			case "airport" : {[14592.5, 16910.9, 0.0014286, 960];};
			case "saltAir" : {[22996.4, 18891.6, 0.00140953, 1800];};
			default {[];};
		};
	};
	case sofiaBus : 
	{
		_destInfo = switch (_dest) do {
			case "kavala" : {[3506.27,13018.8, 0.00137091, 4740];};
			case "athira" : {[13857.4, 18661.1, 0.00150871, 2440];};
			case "pygros" : {[16547.6, 12549.8, 0.00143886, 2540];};
			case "airport" : {[14592.5, 16910.9, 0.0014286, 2400];};
			case "saltAir" : {[22996.4, 18891.6, 0.00140953, 740];};
			case "malosAir" : {[26835.6,24593.1,0.0014457, 680];};
			default {[];};
		};
	};
	case airportBus : 
	{
		_destInfo = switch (_dest) do {
			case "athira" : {[13857.4, 18661.1, 0.00150871, 320];};
			case "pygros" : {[16547.6, 12549.8, 0.00143886, 960];};
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 2400];};
			case "syrta" : {[8657.65, 18251.8, 0.00186157, 1240];};
			default {[];};
		};
	};
	case syrtaBus : 
	{
		_destInfo = switch (_dest) do {
			case "kavala" : {[3506.27,13018.8, 0.00137091, 1500];};
			case "athira" : {[13857.4, 18661.1, 0.00150871, 1040];};
			case "airport" : {[14592.5, 16910.9, 0.0014286, 1240];};	
			default {[];};			
		};
	};
	case saltAirBus : 
	{
		_destInfo = switch (_dest) do {
			case "pygros" : {[16547.6, 12549.8, 0.00143886, 1800];};
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 740];};
			case "kavala" : {[3506.27,13018.8, 0.00137091, 4080];};
			default {[];};
		};
	};
	case malosAirBus : 
	{
		_destInfo = switch (_dest) do {
			case "sofia" : {[25713.4, 21386.1, 0.00147247, 680];};
			default {[];};
		};
	};
	default {[];};
};

//hint format["%1 %2 %3 %4",SEL(_destInfo,0), SEL(_destInfo,1), SEL(_destInfo,2), SEL(_destInfo,3)];
//sleep 3;

if((count [_destInfo]) == 0) exitWith {};
if(CASH < (_destInfo select 3)) exitWith {hint format[localize "STR_Bus_Cost",[_cost] call life_fnc_numberText];};


"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [0,0,0,0], [0,0,0,0], [1,1,1,1]]; 
"colorCorrections" ppEffectCommit 1; 
sleep 2;
CASH = CASH - (_destInfo select 3);
player setPos [(_destInfo select 0), (_destInfo select 1), (_destInfo select 2)];
"colorCorrections" ppEffectEnable false; 
hint "Thank you for using Altis Public Transportation!";