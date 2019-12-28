
COMMAND:sound(playerid, params[]) {
    new sound_id;
    if(sscanf(params,"d",sound_id)) SendClientMessage(playerid,-1,"Usage:/sound [id]");
    SendFormattedMessageEx(playerid, COLOR_BLUE, "Player sound %d",sound_id);
    PlayerPlaySound(playerid, sound_id, 0.0, 0.0, 0.0);

    return 1;
}