var savelist, file;
savelist = ds_list_create();

for (i = 0; i < global.scoreCount; i+=1)
{
    //no dublicates!
    if (global.curScore != global.scores[i])
        ds_list_add(savelist, global.scores[i]);
}

ds_list_add(savelist, global.curScore);

//sort in ascending order, remove weakest score to fill in the new score, then sort in descending order
ds_list_sort(savelist,true);
ds_list_delete(savelist,0);
ds_list_sort(savelist,false);

file = file_text_open_write(global.saveFile);
//saveStr = ds_list_write(savelist);

for (i = 0; i < global.scoreCount; i+=1)
{
    file_text_write_string(file,string(ds_list_find_value(savelist,i)));
    file_text_writeln(file);
}

ds_list_destroy(savelist);
file_text_close(file);


//UPDATE CHECKSUM!
//file_delete(global.checkFile);
file = file_text_open_write(global.checkFile);
file_text_write_string(file,string(md5File(global.saveFile))+string(md5(global.mdpw)));
file_text_writeln(file);
file_text_close(file);


