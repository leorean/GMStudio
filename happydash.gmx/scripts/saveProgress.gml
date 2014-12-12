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

ini_write_string('Tier','Health',string(global.upgrade[UPGRADE.upHealth,UPGRADE.TIER]));
ini_write_string('Tier','Jump',string(global.upgrade[UPGRADE.upJump,UPGRADE.TIER]));
ini_write_string('Tier','Magnet',string(global.upgrade[UPGRADE.upMagnet,UPGRADE.TIER]));
ini_write_string('Tier','Dash',string(global.upgrade[UPGRADE.upDash,UPGRADE.TIER]));
ini_write_string('Tier','ItemChance',string(global.upgrade[UPGRADE.upItemChance,UPGRADE.TIER]));
ini_write_string('Tier','PowerUpTime',string(global.upgrade[UPGRADE.upPowerUpTime,UPGRADE.TIER]));
ini_write_string('Tier','ComboCooldown',string(global.upgrade[UPGRADE.upComboCooldown,UPGRADE.TIER]));
ini_write_string('Tier','SuperDash',string(global.upgrade[UPGRADE.upSuperDash,UPGRADE.TIER]));

ini_write_string('Locked','Health',string(global.upgrade[UPGRADE.upHealth,UPGRADE.LOCKED]));
ini_write_string('Locked','Jump',string(global.upgrade[UPGRADE.upJump,UPGRADE.LOCKED]));
ini_write_string('Locked','Magnet',string(global.upgrade[UPGRADE.upMagnet,UPGRADE.LOCKED]));
ini_write_string('Locked','Dash',string(global.upgrade[UPGRADE.upDash,UPGRADE.LOCKED]));
ini_write_string('Locked','ItemChance',string(global.upgrade[UPGRADE.upItemChance,UPGRADE.LOCKED]));
ini_write_string('Locked','PowerUpTime',string(global.upgrade[UPGRADE.upPowerUpTime,UPGRADE.LOCKED]));
ini_write_string('Locked','ComboCooldown',string(global.upgrade[UPGRADE.upComboCooldown,UPGRADE.LOCKED]));
ini_write_string('Locked','SuperDash',string(global.upgrade[UPGRADE.upSuperDash,UPGRADE.LOCKED]));

ini_close();