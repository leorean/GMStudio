segment = argument0;
a = argument1;
b = argument2;

var t,s,w,h;
w = WIDTH/TILE;
h = HEIGHT/TILE;
for (i = 0; i<w; i += 1)
    for (j = 0; j<h; j+=1)
    {
        s = floor(ds_grid_get(segment,i,j));
        if (in(s,0,4*TILE)) //the first 4 rows in the tileset are reserved for normal blocks
        {
            t = instance_create(a+i*TILE,b+j*TILE,objBlock);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);
        }
        else if (s == 65) //spikes
        {
            if (min(global.difficulty,15) > random(20))
            {
                var c;
                c = choose(true,false);
                
                if (c)
                    instance_create(a+i*TILE,b+j*TILE,objEnemySpike);
                else
                    instance_create(a+i*TILE,b+j*TILE,objEnemyAutoSpike);
                
            }
        }
        else if (s == 66) //platforms
        {
            t = instance_create(a+i*TILE,b+j*TILE,objPlatform);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);
        }
        else if (s == 67) //destroyable block
        {
            
            //RANDOM BLOCK SPAWNING
            var c,ct;
            c = irandom(100);
            if (c < 10)
                ct = 1;
            else if (c < 20)
                continue;
            else if (c <= 100)
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
            c = choose(true,false);
            if (c)
                instance_create(a+i*TILE,b+j*TILE,objEnemy1);
            else
                instance_create(a+i*TILE,b+j*TILE,objEnemy2);
            
        }
        else if (s == 70) //auto spikes
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemyAutoSpike);
        }/*
        else if (s == 71) //coinblock
        {
            t = instance_create(a+i*TILE,b+j*TILE,objDestroyBlock);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);
            t.type = 1;
        }
        else if (s == 72) //enemy type 2
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemy2);
        }*/

        //insert here
        else if (s >= 96) //background objects
        {
            t = instance_create(a+i*TILE,b+j*TILE,objTile);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);

        }        
    }
