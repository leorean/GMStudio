if (!argument1) //play
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
        if (!audio_music_is_playing())
            audio_play_music(argument0,true);
    else if (audio_system() == audio_old_system)
        if (!sound_isplaying(argument0))
            sound_loop(argument0);
} else //stop
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
        if (audio_music_is_playing())
            audio_stop_music();
    else if (audio_system() == audio_old_system)
        if (sound_isplaying(argument0))
            sound_stop(argument0);
}
