
#define PLAYER_STATUS_NONE 0 

enum P_STATUS {
    action,
    mission,
}

new player_status[MAX_PLAYERS][P_STATUS];

setPlayerActionStatus(playerid,new_status) {
    player_status[playerid][action] = new_status;
}
getPlayerActionStatus(playerid) {
    return player_status[playerid][action];
}
setPlayerMissionStatus(playerid,new_status) {
    player_status[playerid][mission] = new_status;
}
getPlayerMissionStatus(playerid) {
    return player_status[playerid][mission];
}