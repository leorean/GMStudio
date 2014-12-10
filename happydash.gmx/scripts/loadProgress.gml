if (file_exists(working_directory + global.saveFile))
{
    ini_open(working_directory + global.saveFile);
    
    var file, loadlist;
    loadlist = ds_list_create();
    
    for (i = 0; i < global.scoreCount; i+=1)
        ds_list_add(loadlist,real(ini_read_string('Score','score'+string(i),'0')));
    
    ds_list_sort(loadlist,false);
    
    for (i = 0; i < global.scoreCount; i+=1)
        global.scores[i] = ds_list_find_value(loadlist,i);
    
    ds_list_destroy(loadlist);

    global.mute = real(ini_read_string('Options','sfx','0'));
    global.wallet = real(ini_read_string('Shop','wallet','0'));
    
    global.upgrade[UPGRADE.upHealth, UPGRADE.TIER] = real(ini_read_string('Tier','Health','0'));
    global.upgrade[UPGRADE.upJump, UPGRADE.TIER] = real(ini_read_string('Tier','Jump','0'));
    global.upgrade[UPGRADE.upMagnet, UPGRADE.TIER] = real(ini_read_string('Tier','Magnet','0'));
    global.upgrade[UPGRADE.upDash, UPGRADE.TIER] = real(ini_read_string('Tier','Dash','0'));
    global.upgrade[UPGRADE.upItemChance, UPGRADE.TIER] = real(ini_read_string('Tier','ItemChance','0'));
    global.upgrade[UPGRADE.upPowerUpTime, UPGRADE.TIER] = real(ini_read_string('Tier','PowerUpTime','0'));
    global.upgrade[UPGRADE.upComboCooldown, UPGRADE.TIER] = real(ini_read_string('Tier','ComboCooldown','0'));
    global.upgrade[UPGRADE.upSuperDash, UPGRADE.TIER] = real(ini_read_string('Tier','SuperDash','0'));

    global.upgrade[UPGRADE.upHealth, UPGRADE.LOCKED] = real(ini_read_string('Locked','Health',string(true)));
    global.upgrade[UPGRADE.upJump, UPGRADE.LOCKED] = real(ini_read_string('Locked','Jump',string(true)));
    global.upgrade[UPGRADE.upMagnet, UPGRADE.LOCKED] = real(ini_read_string('Locked','Magnet',string(true)));
    global.upgrade[UPGRADE.upDash, UPGRADE.LOCKED] = real(ini_read_string('Locked','Dash',string(true)));
    global.upgrade[UPGRADE.upItemChance, UPGRADE.LOCKED] = real(ini_read_string('Locked','ItemChance',string(true)));
    global.upgrade[UPGRADE.upPowerUpTime, UPGRADE.LOCKED] = real(ini_read_string('Locked','PowerUpTime',string(true)));
    global.upgrade[UPGRADE.upComboCooldown, UPGRADE.LOCKED] = real(ini_read_string('Locked','ComboCooldown',string(true)));
    global.upgrade[UPGRADE.upSuperDash, UPGRADE.LOCKED] = real(ini_read_string('Locked','SuperDash',string(true)));

    if (room == SHOP)
    {
        for (i = 0; i < UPGRADE.SIZE; i+=1)
        {
            item[i].tier = global.upgrade[i,UPGRADE.TIER];
            item[i].locked = global.upgrade[i,UPGRADE.LOCKED];
        }
    }

    ini_close();
}
