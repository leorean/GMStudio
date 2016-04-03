if (file_exists(working_directory + global.saveFile))
{
    ini_open(working_directory + global.saveFile);

    global.mute = ini_read_real('Options','mute',false);
    global.quality = ini_read_real('Options','quality', 2);

    global.lastLevelVisited = ini_read_real('Worldmap','lastLevelVisited',0);

    for (i = 0;i < 100; i++)
    {
        global.levelProps[i,1] = ini_read_real('Level'+string(i),'cleared',false);
        global.levelProps[i,2] = ini_read_real('Level'+string(i),'foundSecret',false);
        global.levelProps[i,3] = ini_read_real('Level'+string(i),'canBePlayed',false);
    }
    
    //global.levelProps[0,3] = true; //first level can be played!
    
    show_debug_message("loaded.");

    ini_close();
}
