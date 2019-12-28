

#define PLAYER_ACTION_GYM 1

#define N_OF_GYM 1
#define GYM_MACHINE_SIZE 3

#define GYM_AREA_RUN 0
#define GYM_AREA_BELL 1
#define GYM_AREA_BIKE 2


static const Float:gym_running_machine[][] = {
    {773.4922, -2.6016, 999.6719,356.8584, 0.0000, 0.0000}
};
static const Float:gym_barbell[][] = {
    {773.8984, 1.4531, 999.6719,356.8584, 0.0000, -1.5708}
};
static const Float:gym_bike[][] = {
    {772.1719, 9.4141, 999.6797,356.8584, 0.0000, -1.5708}
};




new gym_area_runing_machine[N_OF_GYM];
new gym_area_bar_bell[N_OF_GYM];
new gym_area_bike[N_OF_GYM];

gym_init() {
    
    // Create dection areas
    for(new i = 0; i < N_OF_GYM; i++) {
        gym_area_runing_machine[i] = CreateDynamicSphere(gym_running_machine[i][0],gym_running_machine[i][1],gym_running_machine[i][2],GYM_MACHINE_SIZE);
        gym_area_bar_bell[i] = CreateDynamicSphere(gym_barbell[i][0],gym_barbell[i][1],gym_barbell[i][2],GYM_MACHINE_SIZE);
        gym_area_bike[i] = CreateDynamicSphere(gym_area_bike[i][0],gym_area_bike[i][1],gym_area_bike[i][2],GYM_MACHINE_SIZE);
    }
    
}

hook OnPlayerEnterDynamicArea(playerid, areaid) {
    new area = gym_area_id(areaid);
}

stock gym_area_id(areaid) {
    for(new i = 0; i < N_OF_GYM; i++) { 
        if(areaid == gym_area_runing_machine[i]) return GYM_AREA_RUN;
    }
}