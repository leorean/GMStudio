ini_open(working_directory + global.saveFile);

ini_write_real('Options','mute',global.mute);
ini_write_real('Options','quality',global.quality);

ini_write_real('Worldmap','currentLevel',global.currentLevel);

for (i = 0;i < 100; i++)
{
    ini_write_real('Level'+string(i),'cleared',global.levelProps[i,1]);
    //only overwrite secret if it has been found
    if (global.levelProps[i,2])
        ini_write_real('Level'+string(i),'foundSecret', true);
    ini_write_real('Level'+string(i),'canBePlayed',global.levelProps[i,3]);
}

show_debug_message("saved.");

ini_close();
