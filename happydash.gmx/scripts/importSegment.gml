//file = argument0;

ds = ds_grid_create(WIDTH/TILE,HEIGHT/TILE);
ds_grid_clear(ds,-1);

file = file_text_open_read(argument0);

var data, f,i,j;

data = false;
i = 0;j = 0;

while (!file_text_eof(file))
{
    f = file_text_read_string(file);
    if (!data) //find tile data beginning
    {
        if (string_pos('<data>',string(f)) != 0)
        {
            data = true; //found data segment in file
        }
            file_text_readln(file);
    }
    else //handle tile data
    {
        ds_grid_add(ds,i,j,floor(real(string_digits(f))+1));
        i += 1;
        if (i >= WIDTH/TILE)
        {
            i = 0;
            j += 1;
        }
        file_text_readln(file);
        if (j >= HEIGHT/TILE)
            break;
    }
}

file_text_close(file);
return ds;

