var file = file_text_open_read(argument0);
var waves;
var ind = 0;

while (!file_text_eof(file))
{
    var _ = file_text_read_string(file);
    
    args = splitString(_, ",");
    //show_debug_message(args);
    var line = 0; var lineInd = 0;
    for (i = 0; i < array_length_1d(args); i++)
    {
        var args1 = splitString(args[i], ":");
        for (j = 0; j < real(args1[0]); j++)
            line[lineInd++] = real(args1[1]);
    }
    file_text_readln(file);
    waves[ind++] = line;
}

file_text_close(file);

return waves; 
