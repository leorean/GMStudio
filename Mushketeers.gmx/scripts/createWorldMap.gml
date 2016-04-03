//var data = argument0;
//ds_grid_clear(data,-1);

var w = ds_grid_width(argument0[2]);
var h = ds_grid_height(argument0[2]);
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
        obj = ds_grid_get(argument0[2],i,j);
        if (obj >= 0)
        {
            level = instance_create(i*TILE,j*TILE,objLevel);
            
            level.name = global.levelProps[obj,0];
            level.cleared = global.levelProps[obj,1];
            level.secretFound = global.levelProps[obj,2];
            
            if (obj == global.lastLevelVisited)
            {
                var worldMap = instance_create(level.x,level.y,objWorldMap);
                show_debug_message("level " + string(obj) + " found at: " + string(i) + ","+ string(j));
            }
        }
        //addTile(obj,i*TILE,j*TILE,LAYER_FG);
    }
}
