var data = argument0;

var w = ds_grid_width(data[0]);
var h = ds_grid_height(data[0]);
var obj = 0;

/*if (room_width!=w*TILE || room_height!=h*TILE)
{
    room_set_width(room,w*TILE);
    room_set_height(room,h*TILE);
    room_restart();
    exit;
}*/

for (var i = 0; i<w; i ++)
{
    for (var j = 0; j<h; j++)
    {
        obj = ds_grid_get(data[2],i,j);
        if (obj >= 0)
        {
            level = instance_create(i*TILE,j*TILE,objLevel);
        }
        //addTile(obj,i*TILE,j*TILE,LAYER_FG);
    }
}
