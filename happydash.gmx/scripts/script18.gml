if (!global.mute)
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
    {
        if (!audio_music_is_playing())
            audio_play_music(argument0,true);
    } else
        if (!sound_isplaying(argument0))
            sound_loop(argument0);
} else
{
    if (audio_system() == audio_new_system)
        if (audio_music_is_playing())
            audio_stop_music();
}
