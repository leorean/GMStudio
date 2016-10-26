ds_grid_resize(global.B1, WIDTH div TILE, (HEIGHT div TILE) + global.segSize);
ds_grid_resize(global.B2, WIDTH div TILE, (HEIGHT div TILE) + global.segSize);

ds_grid_clear(global.B1, noone);
ds_grid_clear(global.B2, 0);

for (i = 0; i < WIDTH div TILE; i++)
for (j = 0; j < (HEIGHT div TILE) + global.segSize; j++)
{
    var b = instance_place(i * TILE, j * TILE, objBlock);
    if (instance_exists(b) && !b.falling && !b.broken)
    {
        ds_grid_set(global.B1, i, j, b);
    }
}

for (i = 0; i < ds_grid_width(global.B1); i++)
    markBlock(i, 0);

for (i = 0; i < ds_grid_width(global.B1); i++)
for (j = 0; j < ds_grid_height(global.B1); j++)
{
    if(ds_grid_get(global.B2, i, j) == 0)
    {
        var _b = ds_grid_get(global.B1, i, j);
        if (instance_exists(_b) && _b.y >= TILE
            && _b.type != 0 && _b.type != 1 && _b.type != 2) _b.marked = true;
    }
}

// un-mark blocks that have a ground!
for (i = 0; i < instance_number(objBlock); i++)
{
    var b = instance_find(objBlock, i);
    if (!b) break;
    if ((b.type == 0 || b.type == 1 || b.type == 2) && !b.broken)
    {    
        var by = b.y;    
        while (true)
        {
            by -= TILE;
            var top = instance_place(b.x, by, objBlock);
            if (!instance_exists(top))
                break;
            else
                top.marked = false;
        }
        
        by = b.y;    
        while (true)
        {
            by += TILE;
            var bot = instance_place(b.x, by, objBlock);
            if (!instance_exists(bot))
                break;
            else
                bot.marked = false;
        }
    }
}
