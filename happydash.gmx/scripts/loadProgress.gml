/*
var file, loadlist;
blub = "";

if (file_exists(global.saveFile))
    file = file_text_open_read(global.saveFile);
else
    exit;

loadlist = ds_list_create();

while(!file_text_eof(file))
{
    f = file_text_read_real(file);
    ds_list_add(loadlist,f);
    file_text_readln(file);
}

global.scores[0] = ds_list_find_value(loadlist,0);
global.scores[1] = ds_list_find_value(loadlist,1);
global.scores[2] = ds_list_find_value(loadlist,2);
global.scores[3] = ds_list_find_value(loadlist,3);
global.scores[4] = ds_list_find_value(loadlist,4);

ds_list_destroy(loadlist);

file_text_close(file);
