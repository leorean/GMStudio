if (!global.mute)
{
    //check which audio system is being used (new system doesn't work in HTML5)
    if (audio_system() == audio_new_system)
    {
//if (argument1)
        audio_sound_pitch(argument0,argument1);
        audio_play_sound(argument0,0,false);
    } 
    else if (audio_system() == audio_old_system)
    {
        if (!sound_isplaying(argument0))
            sound_play(argument0);
        else
        {
            sound_stop(argument0);
            sound_play(argument0);
        }
    }
} else
{
    if (audio_system() == audio_new_system)
    {
        audio_stop_sound(argument0);
    }
    else if (audio_system() == audio_old_system)
    {
        if (sound_isplaying(argument0))
            sound_stop(argument0);
    }
}
