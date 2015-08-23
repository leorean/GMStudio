var data = argument0;

var w = ds_grid_width(data);
var h = ds_grid_height(data);
var t = 0;

if (room_width!=w*TILE || room_height!=h*TILE)
{
    room_set_width(room,w*TILE);
    room_set_height(room,h*TILE);
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
                //if (place_free(i*TILE,j*TILE))
                instance_create(i*TILE,j*TILE,objCamStop);
            break;
            case 2: //player
                var p = instance_create(i*TILE,j*TILE-TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(view_xview[0],view_yview[0],objCamera);
            break;
            case 3: //ladder
                instance_create(i*TILE,j*TILE,objLadder);
            break;
            default: //tiles
                if (in(t,48,658))
                {
                    tile_add(sprTiles,((t+1) mod 47)*TILE/* + (t div 48))*TILE*/
                        ,((t+1) div 47)*TILE
                        ,TILE,TILE,i*TILE,j*TILE,50);
                    instance_create(i*TILE,j*TILE,objSolid);
                }    
            break;
        }
    }
}
