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
    
    global.mute = real(ini_read_string('Options','sfx','0'));
    global.wallet = real(ini_read_string('Shop','wallet','0'));
    ds_list_destroy(loadlist);
    ini_close();
}
