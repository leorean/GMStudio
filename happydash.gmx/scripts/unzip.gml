var file, number, data, f,i,j,r,ds;

if (file_exists(argument0))
    file = file_text_open_read(argument0);


for (s = 0; s <= argument1; s++)
{
    r[s] = ds_grid_create(WIDTH/TILE+1,HEIGHT/TILE+1);
    ds_grid_clear(r[s],-1);
}

number = -1;
data = false;
i = 0;j = 0;

while (!file_text_eof(file))
{
    f = file_text_read_string(file);

    if (number == -1) //CATCH HEAD
    {
        if (string_pos('SEGNUM',string(f)) != 0)
            number = floor(real(string_digits(f)));
        show_debug_message(number);
        file_text_readln(file);
    }
    else
    {    
        if (string_pos('<data>',string(f)) != 0)
            data = true; //found data segment in file
    
        if (data)//handle tile data
        {
            ds_grid_add(r[number],i,j,floor(real(string_digits(f))+1));
            i += 1;
            if (i >= WIDTH/TILE)
            {
                i = 0;
                j += 1;
            }
            
            if (j >= HEIGHT/TILE) || (string_pos('/data>',string(f)) != 0)
            {
                number = -1;
                data = false;
                i = 0; j = 0;
            }
        }
    }
    
    
}

file_text_close(file);
return r;
