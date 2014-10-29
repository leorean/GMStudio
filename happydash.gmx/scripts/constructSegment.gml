segment = argument0;
a = argument1;
b = argument2;
/*
platformHeight = (1+choose(1,2))*TILE;

for (i = 0; i< WIDTH; i += TILE)
    for (j = 0; j< HEIGHT; j+=TILE)
    {
        if (j >= (HEIGHT - platformHeight))
            instance_create(a+i,b+j,objBlockDefault);  
    }
*/

//segment = importSegment("seg1.txt");

var t,s;

for (i = 0; i<WIDTH/TILE; i += 1)
    for (j = 0; j<HEIGHT/TILE; j+=1)
    {
        s = real(ds_grid_get(segment,i,j));
        if (in(s,0,4*TILE)) //the first 4 rows in the tileset are reserved for normal blocks
        {
            t = instance_create(a+i*TILE,b+j*TILE,objBlock);
            t.px = (s-1) mod TILE;
            t.py = (s-1) div TILE;
        }
        else if (s == 65) //spikes
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemySpike);
        }
        else if (s == 66) //platforms
        {
            t = instance_create(a+i*TILE,b+j*TILE,objPlatform);
            t.px = (s-1) mod TILE;
            t.py = (s-1) div TILE;
        }
        else if (s == 67) //destroyable block
        {
            t = instance_create(a+i*TILE,b+j*TILE,objDestroyBlock);
            t.px = (s-1) mod TILE;
            t.py = (s-1) div TILE;
            t.type = 0;
        }
        else if (s == 68) //coins
        {
            instance_create(a+i*TILE,b+j*TILE,objCoin);
        }
        else if (s == 69) //enemy type 1
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemy1);
        }
        else if (s == 70) //auto spikes
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemyAutoSpike);
        }
        else if (s == 71) //coinblock
        {
            t = instance_create(a+i*TILE,b+j*TILE,objDestroyBlock);
            t.px = (s-1) mod TILE;
            t.py = (s-1) div TILE;
            t.type = 1;
        }
        else if (s == 72) //enemy type 2
        {
            instance_create(a+i*TILE,b+j*TILE,objEnemy2);
        }

        //insert here
        else if (s >= 96) //background objects
        {
            t = instance_create(a+i*TILE,b+j*TILE,objTile);
            t.px = (s-1) mod TILE;
            t.py = (s-1) div TILE;

        }



    }
