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
                //instance_create(i*TILE,j*TILE,objCamStop); //invisible
            break;
        }
        switch(fg)
        {
            case 0: //player
                var p = instance_create(i*TILE,j*TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(objPlayer.cx,objPlayer.cy,objCamera);
                
            break;
            case 1: //enemies
                instance_create(i*TILE,j*TILE,objEnemy);
            break;
            case 2: //collectables
                instance_create(i*TILE,j*TILE,objCollect);
                global.maxCollectables++;
            break;            
            default:
                if (fg>=32)
                    addTile(fg,i*TILE,j*TILE,LAYER_BG - 1);
                if (fg>=64)
                {
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                    instance_create(i*TILE,j*TILE,objSolid);
                }
            break;
        }
    }
}
