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
        if (instance_exists(_b) && _b.y >= TILE) _b.marked = true;
    }
}
