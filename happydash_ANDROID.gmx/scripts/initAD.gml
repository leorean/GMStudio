if (os_type == os_android)
{
    if (instance_exists(global.ad))
    {
        with(objAD)
            instance_destroy();
        global.ad = noone;
    }
    if (!instance_exists(global.ad) && !global.noads)
        global.ad = instance_create(0,0,objAD);
}
