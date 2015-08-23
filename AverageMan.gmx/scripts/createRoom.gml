var data = argument0;

var w = ds_grid_width(data);
var h = ds_grid_height(data);
var t = 0;

if (room_width!=w*TILE || room_height!=h*TILE)
{
    room_set_width(TEST,w*TILE);
    room_set_height(TEST,h*TILE);
    room_restart();
    exit;
}

for (var i = 0; i<w; i ++)
{
    for (var j = 0; j<h; j++)
    {
        t = ds_grid_get(data,i,j);
        
        switch(t)
        {
            case 1: //camStop
                instance_create(i*TILE,j*TILE,objCamStop);
            break;
            case 2: //player
                var p = instance_create(i*TILE,j*TILE-TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                p.starty = y;
                p.y = view_yview[0]-2*TILE;
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(view_xview[0],view_yview[0],objCamera);
                
            break;
            case 48: //1st tile
                instance_create(i*TILE,j*TILE,objSolid);
            break;
        }
    }
}
