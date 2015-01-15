var m; //maxSegments
m = argument1;

var i; //index
i = 0;

var input, output; //the files to read/write into

if (file_exists(argument0))
    file_delete(argument0);

output = file_text_open_write(argument0);

for (i = 0; i <= m; i++)
{
    if (file_exists(string(i)+".tmx"))
        input = file_text_open_read(string(i)+".tmx");
    
    //WRITE HEAD
    file_text_write_string(output,"<<<SEGNUM" + string(i));
    file_text_writeln(output);
        
    if (file_exists(input))
        file_text_open_read(input);
    
    while (!file_text_eof(input))
    {
        f = file_text_read_string(input);
        
        file_text_write_string(output,f);
        file_text_writeln(output);
        
        file_text_readln(input);
    }
    
    //WRITE END
    file_text_write_string(output,"<<<SEGEND");
    file_text_writeln(output);
    
    file_text_close(input);
    
}

    file_text_close(output);