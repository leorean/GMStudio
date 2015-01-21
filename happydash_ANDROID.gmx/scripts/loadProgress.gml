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
    global.mode = real(ini_read_string('Options','mode',string(M.TUTORIALMODE)));

    global.wallet = real(ini_read_string('Shop','wallet','0'));

    global.unlockupgrades = real(ini_read_string('IAP','unlockUpgrades','0'));
    global.noads = real(ini_read_string('IAP','noAds','0'));
    
    global.maxLevelReached = real(ini_read_string('Progress','maxLevelReached','0'));
    global.playthrough = real(ini_read_string('Progress','playThrough','0'));
    
    //global.ach[0] = real(ini_read_string('Achievement','ach0','0'));
    
    global.saveVersion = real(ini_read_string('Save','version','0'));
    
    global.upgrade[UPGRADE.upHealth, UPGRADE.TIER] = real(ini_read_string('Tier','upHealth','0'));
    global.upgrade[UPGRADE.upJump, UPGRADE.TIER] = real(ini_read_string('Tier','upJump','0'));
    global.upgrade[UPGRADE.upMagnet, UPGRADE.TIER] = real(ini_read_string('Tier','upMagnet','0'));
    global.upgrade[UPGRADE.upDash, UPGRADE.TIER] = real(ini_read_string('Tier','upDash','0'));
    global.upgrade[UPGRADE.upBlockChance, UPGRADE.TIER] = real(ini_read_string('Tier','upBlockChance','0'));
    global.upgrade[UPGRADE.upPowerUpTime, UPGRADE.TIER] = real(ini_read_string('Tier','upPowerUpTime','0'));
    global.upgrade[UPGRADE.upComboCooldown, UPGRADE.TIER] = real(ini_read_string('Tier','upComboCooldown','0'));
    global.upgrade[UPGRADE.upSuperDash, UPGRADE.TIER] = real(ini_read_string('Tier','upSuperDash','0'));
    global.upgrade[UPGRADE.upPowerUpNew, UPGRADE.TIER] = real(ini_read_string('Tier','upPowerUpNew','0'));
    global.upgrade[UPGRADE.upBlockNew, UPGRADE.TIER] = real(ini_read_string('Tier','upBlockNew','0'));

    global.upgrade[UPGRADE.upHealth, UPGRADE.LOCKED] = real(ini_read_string('Locked','upHealth',string(true)));
    global.upgrade[UPGRADE.upJump, UPGRADE.LOCKED] = real(ini_read_string('Locked','upJump',string(true)));
    global.upgrade[UPGRADE.upMagnet, UPGRADE.LOCKED] = real(ini_read_string('Locked','upMagnet',string(true)));
    global.upgrade[UPGRADE.upDash, UPGRADE.LOCKED] = real(ini_read_string('Locked','upDash',string(true)));
    global.upgrade[UPGRADE.upBlockChance, UPGRADE.LOCKED] = real(ini_read_string('Locked','upBlockChance',string(true)));
    global.upgrade[UPGRADE.upPowerUpTime, UPGRADE.LOCKED] = real(ini_read_string('Locked','upPowerUpTime',string(true)));
    global.upgrade[UPGRADE.upComboCooldown, UPGRADE.LOCKED] = real(ini_read_string('Locked','upComboCooldown',string(true)));
    global.upgrade[UPGRADE.upSuperDash, UPGRADE.LOCKED] = real(ini_read_string('Locked','upSuperDash',string(true)));

    if (room == SHOP)
    {
        //UNLOCK CERTAIN UPGRADES
        unlockUpgrades();

        /*for (i = 0; i < UPGRADE.SIZE; i+=1)
        {
            item[i].tier = global.upgrade[i,UPGRADE.TIER];
            item[i].locked = global.upgrade[i,UPGRADE.LOCKED];
        }*/
    }

    ini_close();
}
