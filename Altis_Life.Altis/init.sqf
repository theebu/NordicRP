/*
    File: init.sqf
    Author: 
    
    Description:
    
*/
StartProgress = false;

[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "extras\nosnakes.sqf";
[] execVM "extras\fn_statusBar.sqf";

StartProgress = true;