ini_open(working_directory + global.saveFile);

if (true)//(room == MAIN) //dont overwrite score with zeros?
{
    
    var savelist, file;
    savelist = ds_list_create();
    
    for (i = 0; i < global.scoreCount; i+=1)
    {
        //no dublicates!
        if (real(global.curScore) != real(global.scores[i]))
            ds_list_add(savelist, real(global.scores[i]));
    }
    
    ds_list_add(savelist, global.curScore);
    
    //sort in ascending order, remove weakest score to fill in the new score, then sort in descending order
    ds_list_sort(savelist,true);
    ds_list_delete(savelist,0);
    ds_list_sort(savelist,false);
    
    for (i = 0; i < global.scoreCount; i+=1)
    {
        ini_write_string('Score','score'+string(i),string(ds_list_find_value(savelist,i)));
    }

    ds_list_destroy(savelist);
}

//write options and shop

ini_write_string('Options','sfx',string(global.mute));
ini_write_string('Shop','wallet',string(global.wallet));

ini_write_string('Save','version',string(global.version));
    
ini_write_string('Progress','maxLevelReached',string(global.maxLevelReached));

ini_write_string('Tier','upHealth',string(global.upgrade[UPGRADE.upHealth,UPGRADE.TIER]));
ini_write_string('Tier','upJump',string(global.upgrade[UPGRADE.upJump,UPGRADE.TIER]));
ini_write_string('Tier','upMagnet',string(global.upgrade[UPGRADE.upMagnet,UPGRADE.TIER]));
ini_write_string('Tier','upDash',string(global.upgrade[UPGRADE.upDash,UPGRADE.TIER]));
ini_write_string('Tier','upBlockChance',string(global.upgrade[UPGRADE.upBlockChance,UPGRADE.TIER]));
ini_write_string('Tier','upPowerUpTime',string(global.upgrade[UPGRADE.upPowerUpTime,UPGRADE.TIER]));
ini_write_string('Tier','upComboCooldown',string(global.upgrade[UPGRADE.upComboCooldown,UPGRADE.TIER]));
ini_write_string('Tier','upSuperDash',string(global.upgrade[UPGRADE.upSuperDash,UPGRADE.TIER]));
ini_write_string('Tier','upPowerUpNew',string(global.upgrade[UPGRADE.upPowerUpNew,UPGRADE.TIER]));
ini_write_string('Tier','upBlockNew',string(global.upgrade[UPGRADE.upBlockNew,UPGRADE.TIER]));

ini_write_string('Locked','upHealth',string(global.upgrade[UPGRADE.upHealth,UPGRADE.LOCKED]));
ini_write_string('Locked','upJump',string(global.upgrade[UPGRADE.upJump,UPGRADE.LOCKED]));
ini_write_string('Locked','upMagnet',string(global.upgrade[UPGRADE.upMagnet,UPGRADE.LOCKED]));
ini_write_string('Locked','upDash',string(global.upgrade[UPGRADE.upDash,UPGRADE.LOCKED]));
ini_write_string('Locked','upBlockChance',string(global.upgrade[UPGRADE.upBlockChance,UPGRADE.LOCKED]));
ini_write_string('Locked','upPowerUpTime',string(global.upgrade[UPGRADE.upPowerUpTime,UPGRADE.LOCKED]));
ini_write_string('Locked','upComboCooldown',string(global.upgrade[UPGRADE.upComboCooldown,UPGRADE.LOCKED]));
ini_write_string('Locked','upSuperDash',string(global.upgrade[UPGRADE.upSuperDash,UPGRADE.LOCKED]));
ini_write_string('Locked','upPowerUpNew',string(global.upgrade[UPGRADE.upPowerUpNew,UPGRADE.LOCKED]));
ini_write_string('Locked','upBlockNew',string(global.upgrade[UPGRADE.upBlockNew,UPGRADE.LOCKED]));

ini_close();