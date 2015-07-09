if (os_type == os_android || os_type == os_ios)
{
    if (!global.noads)
    {
        /*if (!instance_exists(global.ad))
            global.ad = instance_create(0,0,objAD);
        else
        {
            with(objAD)
                instance_destroy();
        }*/
        with(objAD)
            instance_destroy();
        global.ad = instance_create(0,0,objAD);
    } else
    {
        with(objAD) instance_destroy();
    }
}