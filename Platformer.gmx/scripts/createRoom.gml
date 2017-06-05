var data = argument0;

var w = ds_grid_width(data[0]);
var h = ds_grid_height(data[0]);
var fg = 0;
var bg = 0;
var obj = 0;

// how many indices one row in the tileset has
var rowSize = (background_get_width(sprTiles)/TILE);
var colSize = (background_get_height(sprTiles)/TILE);

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
            case 0: //player
                var p = instance_create(i*TILE,j*TILE,objPlayer);
                view_xview[0] = (p.x div (WIDTH+TILE)) * (WIDTH+TILE);
                view_yview[0] = (p.y div (HEIGHT+TILE)) * (HEIGHT+TILE);
                
                global.spawnx = p.x;
                global.spawny = p.y;
                
                with(global.camera) instance_destroy();
                global.camera = instance_create(objPlayer.x, objPlayer.y, objCamera);
                
            break;
            case 1: //checkpoint
                //instance_create(i*TILE,j*TILE,objCheckpoint);
            break;
            case 2: //collectables
                //instance_create(i*TILE,j*TILE,objCollect);
                //global.maxCollectables++;
            break;
            case 3: //coins
                //instance_create(i*TILE,j*TILE,objCoin);
            break;
            case 4: //spikes up
            case 5: //spikes down
            case 6: //spikes left
            case 7: //spikes right
            case 8: //spikes around
                instance_create(i*TILE,j*TILE,objEnemy);
                addTile(obj,i*TILE,j*TILE,LAYER_FG);
            break;
            case 9: //secret
                //instance_create(i*TILE,j*TILE,objSecret);
            break;
        }
        switch(fg)
        {
            case -1:
            case 0:
            break;
            case rowSize: //platform
                addTile(fg,i*TILE,j*TILE,LAYER_FG);
                instance_create(i*TILE,j*TILE,objPlatform);
            break;
            /*case 2 * rowSize:
                addTile(fg,i*TILE,j*TILE,LAYER_FG);
                instance_create(i*TILE,j*TILE,objSlopeL);
            break;
            case 73:
                addTile(fg,i*TILE,j*TILE,LAYER_FG);
                instance_create(i*TILE,j*TILE,objSlopeR);
            break;*/
            default:
                        
                if (fg >= 2* rowSize && fg < 3 * rowSize)
                {   
                             
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                    
                    var sl = (fg - 2*rowSize) % 6;
                    switch(sl)
                    {
                        case 0:
                            instance_create(i*TILE,j*TILE,objSlopeL);
                        break;
                        case 2:
                            instance_create(i*TILE,j*TILE,objSlopeR);
                        break;
                        case 4:
                            instance_create(i*TILE,j*TILE,objSlopeLL);
                        break;
                        case 5:
                            instance_create(i*TILE,j*TILE,objSlopeRR);
                        break;
                        default: break;
                    }
                }
                // grass etc
                else if (fg >= 4*rowSize && fg < 5*rowSize)
                    addTile(fg,i*TILE,j*TILE,LAYER_BG - 1);
                else // normal blocks
                {
                    addTile(fg,i*TILE,j*TILE,LAYER_FG);
                    instance_create(i*TILE,j*TILE,objBlock);
                }
            break;
        }
    }
}
