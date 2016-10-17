/*
##################### DYNAMIC MARKET SCRIPT #####################
### AUTHOR: RYAN TT.                                          ###
### STEAM: www.steamcommunity.com/id/ryanthett                ###
###                                                           ###
### DISCLAIMER: THIS SCRIPT CAN BE USED ON EVERY SERVER ONLY  ###
###             WITH THIS HEADER / NOTIFICATION               ###
#################################################################
*/

// ███████████████████████████████████████████████████████████████████████
// █████████████████ DYNAMIC MARKET BASIC CONFIGURATION ██████████████████
// ███████████████████████████████████████████████████████████████████████

DYNMARKET_Serveruptime         = 04;   // Serveruptime after restart in hours
DYNMARKET_UseExternalDatabase  = true; // Should the script use the External Database?
DYNMARKET_PriceUpdateInterval  = 01;   // After how many minutes should the price be updated?
DYNMARKET_CreateBackups        = true; // Should the server save write the prices regulary into the Database? If false, it will save the prices before Server-restart?
DYNMARKET_CreateBackupInterval = 03;   // After how many updates (PriceUpdateIntervals) should the prices be saved into the Database?
DYNMARKET_UserNotification     = false; // Should the user be informed with a hint whenever the prices got updated?

// █████████████████ USER NOTIFICATION TEXTS  █████████████████

DYNMARKET_UserNotification_Text =
[
	"Your prices have been updated!",
	"The new prices are being calculated by the server..."
];

// █████████████████ ITEM GROUP CONFIGURATION █████████████████

DYNMARKET_Items_Groups =
[
	["Legal",
		[
			["apple",-1,80,130],
			["peach",-1,100,150]
		],
		0.5
	],
	["Illegal",
		[
			["heroin_processed",-1,4500,5500],
			["marijuana",-1,1500,2500],
			["cocaine_processed",-1,2500,3500],
			["turtle_raw",-1,2000,6000],
			["goldbar",-1,80000,150000]
		],
		0.5
	],
	["minerals",
		[
			["copper_refined",-1,1300,2000],
			["iron_refined",-1,2000,3000],
			["salt_refined",-1,600,1100],
			["glass",-1,500,900],
			["cement",-1,2000,3000],
			["diamond_cut",-1,3000,4500],
			["oil_processed",-1,3000,5000]
		],
		0.5
	],
	["hunting",
		[
			["sheep_raw",-1,300,1000],
			["goat_raw",-1,400,1100]
		],
		0.5
	],
	["fish",
		[
			["tuna_raw",-1,900,1400],
			["ornate_raw",-1,200,800],
			["mackerel_raw",-1,300,800],
			["mullet_raw",-1,500,850],
			["salema_raw",-1,200,950],
			["catshark_raw",-1,1100,2500]
		],
		0.5
	]
];

// █████████████████    ALL SELLABLE ITEMS    █████████████████

DYNMARKET_Items_ToTrack        =
[
	["apple",105],
	["peach",110],
	["rabbit_raw",250],
	["ornate_raw",450],
	["mackerel_raw",450],
	["salema_raw",500],
	["tuna_raw",1200],
	["mullet_raw",600],
	["catshark_raw",1500],
	["turtle_soup",200],
	["hen_raw",200],
	["rooster_raw",210],
	["sheep_raw",210],
	["goat_raw",155],

	["goldbar",95000],
	["blastingcharge",100000],

	["oil_processed",4000],
	["copper_refined",1800],
	["iron_refined",2500],
	["salt_refined",800],
	["glass",750],
	["diamond_cut",3500],
	["cement",2500],

	


	["turtle_raw",6000],
	["heroin_processed",5000],
	["marijuana",2000],
	["cocaine_processed",3000]
];

//███████████████████████████████████████████████████████████████████████
//██████████████████ DO NOT MODIFY THE FOLLOWING CODE! ██████████████████
//███████████████████████████████████████████████████████████████████████

DYNMARKET_Items_CurrentPriceArr = [];
DYNMARKET_sellarraycopy = DYNMARKET_Items_ToTrack;
DYNMARKET_Serveruptime = (DYNMARKET_Serveruptime * 3600) - 300;
{
	_currentArray = _x;
	DYNMARKET_Items_CurrentPriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach DYNMARKET_Items_ToTrack;
publicVariable "DYNMARKET_UserNotification";
publicVariable "DYNMARKET_UserNotification_Text";
if (DYNMARKET_UseExternalDatabase) then {[1] call TON_fnc_HandleDB;};
DYNMARKET_UpdateCount = 0;
if (DYNMARKET_UseExternalDatabase) then {
	[] spawn {
		sleep DYNMARKET_Serveruptime;
		diag_log "### DYNMARKET >> CURRENT PRICES ARE BEING WRITTEN TO THE DATABASE    ###";
		diag_log "### DYNMARKET >> AS PLANNED, AWAITING RESULT...                      ###";
		[0] call TON_fnc_HandleDB;
	};
};
sleep 5;
[] call TON_fnc_sleeper;
