#include <a_samp>


// Libraries
#include <sscanf2>
#include <zcmd>
#include <streamer>
#include <YSI\y_timers>
#include <YSI_Coding\y_va>
#include <YSI_Coding\y_hooks>

// utiles
#include "./src/utils/msg.pwn"
#include <ui/info_box.inc>

// src
#include "./src/ui/colors.pwn"

// modules
#include "./src/player.pwn"
#include "./src/debug.pwn"
#include "./src/gym.pwn"

#include "../include/gl_common.inc"

new total_vehicles_from_files=0;

public OnGameModeInit() {
    loadStaticVehicles();
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid)) return 1;
	SetPlayerInterior(playerid,0);
	TogglePlayerClock(playerid,0);


	SetPlayerPos(playerid,2256.4272, -1261.3678, 26.1875);
	return 1;
}

loadStaticVehicles() {
	// LAS VENTURAS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/lv_gen.txt");
    
    // SAN FIERRO
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/sf_gen.txt");
    
    // LOS SANTOS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_law.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_airport.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_gen_inner.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/ls_gen_outer.txt");
    
    // OTHER AREAS
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/whetstone.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/bone.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/flint.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/tierra.txt");
    total_vehicles_from_files += LoadStaticVehiclesFromFile("vehicles/red_county.txt");
	printf("Total vehicles from files: %d",total_vehicles_from_files);
}
main()
{
	print("\n----------------------------------");
	print("SAMP Online");
	print("----------------------------------\n");
}

