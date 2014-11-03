if (!global.mute)
{
    if (sound_isplaying(argument0))
        sound_stop(argument0);
    
    sound_play(argument0);
}
