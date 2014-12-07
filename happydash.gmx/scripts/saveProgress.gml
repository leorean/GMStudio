ini_open(working_directory + global.saveFile);

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

ini_write_string('Options','sfx',string(global.mute));
ini_write_string('Shop','wallet',string(global.wallet));

ds_list_destroy(savelist);
ini_close();
