global.B1 = ds_grid_create(WIDTH div TILE, HEIGHT div TILE);
global.B2 = ds_grid_create(WIDTH div TILE, HEIGHT div TILE);

for (i = 0; i < WIDTH div TILE; i++)
for (j = 0; j < HEIGHT div TILE; j++)
{
    var b = instance_place(i * TILE, j * TILE, objBlock);
    var val = noone;
    if (instance_exists(b) && !b.falling)
        val = b;

    ds_grid_add(global.B1, i, j, val);
    ds_grid_add(global.B2, i, j, 0);
}

var startBlock = noone;
var dir = 0; var itx; var ity;
for (i = 0; i < ds_grid_width(global.B1); i++)
{
    startBlock = ds_grid_get(global.B1, i, 0);
    if(instance_exists(startBlock))
    {
        itx = i;
        ity = 0;
        break;
    }
}
if (startBlock == noone) 
{
    show_debug_message("no starting point found!");
    return -1;
}

markBlock(itx, ity);

for (i = 0; i < ds_grid_width(global.B1); i++)
for (j = 0; j < ds_grid_height(global.B1); j++)
{
}
/*
while (true)
{
    if (dir == 0 && itx < ds_grid_width(blocks) 
    && instance_exists(ds_grid_get(blocks, itx+1, ity))
    && ds_grid_get(blocks, itx+1, ity).marked == false)
    {
        itx ++;
        var b = ds_grid_get(blocks, itx, ity);
        b.marked = true;
    } else dir = (dir + 1) % 4;
    
}*/

ds_grid_destroy(global.B1);
ds_grid_destroy(global.B2);
