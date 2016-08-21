var file;

var ds;

ds[0] = ds_grid_create(1,1);
ds[1] = ds_grid_create(1,1);
ds_grid_clear(ds[0],0);
ds_grid_clear(ds[1],0);

if (file_exists(argument0))
    file = file_text_open_read(argument0);
else
{
    show_debug_message("File " + string(argument0) + " doesn't exist");
    exit;
}

var f,i,j,w,h, layer, l;

layer = 0;

i = 0;j = 0; l = 0;

w = 1;
h = 1;

while (!file_text_eof(file))
{
    f = file_text_read_string(file);

    if (w == 1 && string_pos('width="',f) != 0)
    {
        var str = string_copy(f,string_pos('width="',f)+7,5);
        w = real(string_digits(str));
        ds_grid_resize(ds[0],w,h);
        ds_grid_resize(ds[1],w,h);
    }
    if (h == 1 && string_pos('height="',f) != 0)
    {
        var str = string_copy(f,string_pos('height="',f)+8,5);
        h = real(string_digits(str));
        ds_grid_resize(ds[0],w,h);
        ds_grid_resize(ds[1],w,h);
    }
    
    if (string_pos('<tile gid=',f) != 0)
    {
        ds_grid_add(ds[l],i,j,real(string_digits(f))-1);
        i++;
        if (i >= w)
        {
            i = 0;
            j++;
        }

        if (j >= h)
        {
            l++;
            j = 0;
            if (l > 1) break; //only 2 layers: fg and obj
        }
    }
    
    file_text_readln(file);
}

file_text_close(file);
return ds;
