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
            case 0: //camStop
                //if (place_free(i*TILE,j*TILE))
                instance_create(i*TILE,j*TILE,objCamStop);
            break;
            case 1: //player
                var p = instance_create(i*TILE,j*TILE-TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(view_xview[0],view_yview[0],objCamera);
            break;
            case 2:
                instance_create(i*TILE,j*TILE,objHole);
            break;
            default:
                if (in(t,47,93)) //ladders
                {
                    instance_create(i*TILE,j*TILE,objLadder);
                    tile_add(sprTiles,(t % 47)*TILE
                        ,(t div 47)*TILE
                        ,TILE,TILE,i*TILE,j*TILE,50);
                }
                if (t >= 141) //solid and background tiles
                    tile_add(sprTiles,(t % 47)*TILE
                        ,(t div 47)*TILE
                        ,TILE,TILE,i*TILE,j*TILE,50);
                
                if (in(t,141,657)) //solid tiles                       
                    instance_create(i*TILE,j*TILE,objSolid);   
            break;
        }
    }
}
