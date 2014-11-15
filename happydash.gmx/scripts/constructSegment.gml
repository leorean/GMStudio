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
                instance_create(a+i*TILE,b+j*TILE,objEnemySpike);
        }
        else if (s == 66) //platforms
        {
            if (choose(true,false))
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
            if (c < 500 && global.powerUp < 0)
                ct = 2; //POWER UP BLOCK
            else if (c < 100)
                ct = 1; //coin block
            else if (c < 300)
                continue;//no block
            else if (c <= 1000)
                ct = 0;//normal block
            
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
        else if (s == 72) //flying enemy
        {
            if (min(global.difficulty,20) > random(30))
                instance_create(a+i*TILE,b+j*TILE,objEnemy3);
        }

        //insert here
        else if (s >= 96) //background objects
        {
            t = instance_create(a+i*TILE,b+j*TILE,objTile);
            t.px = floor((s-1) mod TILE);
            t.py = floor((s-1) div TILE);

        }        
    }

//ADD SEGMENT-INDEPENDANT THINGS:
//RANDOM ENEMY SPAWNING
/*
if (min(global.difficulty,2) > random(4))
{
    instance_create(WIDTH, 2*TILE+irandom(5)*TILE,objEnemy3);
}*/
