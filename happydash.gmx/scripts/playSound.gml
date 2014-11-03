if (!global.mute)
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
    {
        if (!audio_is_playing(argument0))
            audio_play_sound(argument0,0,false);
    } else
    {
        if (!sound_isplaying(argument0))
            sound_play(argument0);
    }
}
