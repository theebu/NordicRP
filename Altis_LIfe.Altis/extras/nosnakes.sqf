/*
Repentz for Psychos Insane Asylum
*/

waitUntil {
	{
		if(agent _x isKindOf "Snake_random_F") then {deleteVehicle agent _x};
	} forEach agents;
	sleep 10;
	false;
};