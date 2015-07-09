if (argument1) //play
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
    {
        if (!audio_is_playing(argument0))
            audio_play_sound(argument0,0,true);
    }
    else if (audio_system() == audio_old_system)
        if (!sound_isplaying(argument0))
            sound_loop(argument0); //NOT WORKING - because mp3??
} else //stop
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
        audio_stop_sound(argument0);
    else if (audio_system() == audio_old_system)
        sound_stop(argument0);
}