var data = argument0;

var w = ds_grid_width(data[0]);
var h = ds_grid_height(data[0]);
var fg = 0;
var bg = 0;
var obj = 0;

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
        obj = ds_grid_get(data[2],i,j);
        fg = ds_grid_get(data[1],i,j);
        bg = ds_grid_get(data[0],i,j);

        if (bg > 0) //bg tiles
            addTile(bg,i*TILE,j*TILE,LAYER_BG);

        switch (obj)
        {
            case 0: //camStop
                instance_create(i*TILE,j*TILE,objCamStop); //invisible
            break;
        }
        switch(fg)
        {
            case 1: //player
                var p = instance_create(i*TILE+.5*TILE,j*TILE-TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(view_xview[0],view_yview[0],objCamera);
                
            break;
            case 2: //holes
                instance_create(i*TILE,j*TILE,objHole); //invisible
            break;
            case 3: //TODO: doors
                var k = j;
                while (!instance_place(i*TILE,k*TILE-TILE,objSolid))
                    k -= 1;
                instance_create(i*TILE+.5*TILE,k*TILE,objDoor);
            break;
            default:
                if (in(fg,47,57)) //ladders
                {
                    instance_create(i*TILE,j*TILE,objLadder);
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                }
                if (in(fg,58,93)) //platforms
                {
                    instance_create(i*TILE,j*TILE,objPlatform);
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                }
                if (in(fg,94,140)) //spikes
                {
                    instance_create(i*TILE,j*TILE,objEnemy);
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                }
                if (fg >= 141) //solid tiles
                {
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                    instance_create(i*TILE,j*TILE,objSolid);
                }
                    
            break;
        }
    }
}
