var filename,result,i,file;
filename = argument0;

if (file_exists(filename))
    file = file_text_open_read(filename);
else
{
    show_debug_message("File " + string(filename) + " doesn't exist");
    exit;
}

i = 0;
while (!file_text_eof(file))
{
    result[i] = file_text_read_string(file);
    if (string_pos("wave",result[i]) != 0)
    {
        global.maxWave++;
    }
    i++;
    file_text_readln(file);
}
    
file_text_close(file);

return result;