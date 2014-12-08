sg = argument0; //segment
a = argument1;
b = argument2;

var t,s,w,h;
w = WIDTH/TILE;
h = HEIGHT/TILE;

var powSpawned,itemSpawned;
powSpawned = false; itemSpawned = false;

for (i = 0; i<w; i += 1)
{
    for (j = 0; j<h; j+=1)
    {
        s = floor(ds_grid_get(sg,i,j));
        if (in(s,0,4*TILE) || s >= 176) //the first 4 rows in the tileset are reserved for normal blocks
        {
            //if (global.powerUp != 0)
            //{
                t = instance_create(a+i*TILE,b+j*TILE,objBlock);
                t.px = floor((s-1) mod TILE);
                t.py = floor((s-1) div TILE);
            /*} else
            {
                t = instance_create(a+i*TILE,b+j*TILE,objDestroyBlock);
                t.type = 0;
            }*/
        }
        else if (s == 65) //spikes
        {
            if (max(min(global.difficulty,50),2) > random(60))
                instance_create(a+i*TILE,b+j*TILE,objEnemySpike);
        }
        else if (s == 66 || s == 71) //platforms
        {
            if (choose(true,true,true,false))
            {
                t = instance_create(a+i*TILE,b+j*TILE,objPlatform);
                t.px = floor((s-1) mod TILE);
                t.py = floor((s-1) div TILE);
            }
        }
        else if (s == 67) //destroyable blocks
        {
            
            //RANDOM BLOCK SPAWNING
            var c,ct;
            c = irandom(1000);
            if (c < 15)//ITEM block
                ct = 2; 
            else if (c < 30)//POW block
                ct = 3;
            else if (c < 100)//coin block
                ct = 1;
            else if (c < 500)//no block
                continue;
            else
                ct = 0;//normal block
            
            if (ct == 2)
                if (!itemSpawned)
                    itemSpawned = true;
                else
                    ct = 0;

            if (ct == 3)
                if (!powSpawned)
                    powSpawned = true;
                else
                    ct = 0;

            
            t = instance_create(a+i*TILE,b+j*TILE,objDestroyBlock);
            t.type = ct;            
        }
        else if (s == 68) //coins
        {
            instance_create(a+i*TILE,b+j*TILE,objCoin);
        }
        else if (s == 69) //enemies
        {
            var c;
            c = choose(0,1,2);
            if (c == 0)
                instance_create(a+i*TILE,b+j*TILE,objEnemy1);
            if (c == 1)
                instance_create(a+i*TILE,b+j*TILE,objEnemy2);
            if (c == 2){}; //do nothing
           
        }
        else if (s == 70) //spikes and auto spikes
        {
            if (max(min(global.difficulty,50),2) > random(60))
            {
                var c;
                c = choose(true,false);
                
                if (c)
                    instance_create(a+i*TILE,b+j*TILE,objEnemySpike);
                else
                    instance_create(a+i*TILE,b+j*TILE,objEnemyAutoSpike);
            }

        }
        else if (s == 72) //flying enemy
        {
            if (choose(true,false,false))//(min(global.difficulty,20) > random(30))
                instance_create(a+i*TILE,b+j*TILE,objEnemy3);
        }
        else if (s == 73) //rotating spike
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemyRotator);
        }

        //insert here
        else if (s >= 96 && s < 176) //background objects
        {
            t = instance_create(a+i*TILE,b+j*TILE,objTile);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);

        }        
    }
}
//ADD SEGMENT-INDEPENDANT THINGS:

//ROTATOR OBSTACLES.
if (global.difficulty > 20)
{
    var ri, rx, ry;
    
    ri = 0;
    for (i = 0; i < 10; i+= 1)
        if (global.difficulty > 20 + i*5) //each 5 dif, more chance.
            ri += 1;
    
    repeat(ri)
    {
        rx = (2*TILE + random(WIDTH-2*TILE)) div TILE;
        ry = (2*TILE + random(HEIGHT-2*TILE)) div TILE;
        if (!place_free(a+rx*TILE,b+ry*TILE))
            instance_create(a+rx*TILE,b+ry*TILE,objEnemyRotator);
    }
}
//RANDOM ENEMY SPAWNING
/*
if (min(global.difficulty,2) > random(4))
{
    instance_create(WIDTH, 2*TILE+irandom(5)*TILE,objEnemy3);
}*/
