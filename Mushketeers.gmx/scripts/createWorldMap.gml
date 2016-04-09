var w = ds_grid_width(argument0[2]);
var h = ds_grid_height(argument0[2]);
var obj = 0;
var lvlNext = noone;

for (var i = 0; i<w; i ++)
{
    for (var j = 0; j<h; j++)
    {
        obj = ds_grid_get(argument0[2],i,j);
        if (obj >= 0)
        {
            
            //first level can be played:
            global.levelProps[0,3] = true;
            
            //TEST:
//            global.levelProps[1,1] = true;
//            global.levelProps[2,1] = true;
            
            //next level can be played if current level is cleared
            if (global.levelProps[obj,1])
                global.levelProps[obj+1,3] = true;
            
            level = instance_create(i*TILE,j*TILE,objLevel);
            
            level.name = global.levelProps[obj,0];
            level.lvlid = obj;
            level.cleared = global.levelProps[obj,1];
            level.secretFound = global.levelProps[obj,2];
            level.canBePlayed = global.levelProps[obj,3];

            if (obj == global.currentLevel)
            {
                var worldMap = instance_create(level.x,level.y,objWorldMap);
                worldMap.target = level;
                with(worldMap)
                    worldPlayer = instance_create(x,y,objWorldPlayer);
                worldMap.worldPlayer.target = level;
                
                //show_debug_message("level " + string(obj) + " found at: " + string(i) + ","+ string(j));
            }
            
            //get next level for player
            if (obj == global.nextLevel)
            {
                show_debug_message("setting next level to: "+string(obj));
                lvlNext = level;
            }
        }
    }
}

if (instance_exists(lvlNext))
{
    worldMap.worldPlayer.target = lvlNext;
    worldMap.target = lvlNext;
}
