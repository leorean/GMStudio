if (os_is_network_connected())
{
    if(!achievement_login_status())
        achievement_login();
        
    if (achievement_available())
    {
        if (!argument2)
            achievement_post(argument0,argument1);
        else
            achievement_increment(argument0,argument1);
    } else
    {
        /*
            TODO: store achievement in queue
            have a persistent object check periodically
            if successfull, remove from queue
        */
    }
}
