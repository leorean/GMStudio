var w,h,a,b,dir,steps,ind;

//set width and height of the maze
w = argument0;
h = argument1;

steps = 10;

//clear room array
for (i = 0; i < w; i++)
    for (j = 0; j < h; j++)
    {
        data = array(0,0,0,0,0);
        global.rooms[i,j] = data;
    }

//choose a random starting point
a = 1 + irandom(w-3);
b = 1 + irandom(h-3);

global.rooms[a,b] = array(1,0,0,0,0);

next = array(0,0,0,0,0);

repeat(steps)
{

    //choose next room
    next = global.rooms[a,b];
    while(next[0] != 0)
    {
        //either search in horizontal or vertical direction
        if (choose(true,false))
            a = clamp(a-1+irandom(2),0,w-1);
        else
            b = clamp(b-1+irandom(2),0,h-1);
        next = global.rooms[a,b];
    }
    global.rooms[a,b] = array(1,0,0,0,0);

        

}
/*
data = array(1,(dir == DOWN),(dir==UP),(dir==LEFT),(dir==RIGHT));
global.rooms[a,b] = data;

a = min(max(a + sign(dir)*(dir == LEFT || dir == RIGHT), 0), w-1);
b = min(max(b + sign(dir)*(dir == UP || dir == DOWN), 0), h-1);
*/





/*
//choose random direction and build random steps in that direction
repeat(steps)
{
    dir = choose(LEFT,RIGHT,UP,DOWN);
    var data;
    data = array(1,0,0,0,0);

    repeat(choose(1,2,3))
    {
        data[0] = ind;
        if (dir == UP) data[1] = 1;
        if (dir == DOWN) data[2] = 1;
        if (dir == LEFT) data[3] = 1;
        if (dir == RIGHT) data[4] = 1;

        global.rooms[a,b] = data;

        dataTmp = global.rooms[a,b];
                                
        a = min(max(a + sign(dir)*(dir == LEFT || dir == RIGHT), 0), w-1);
        b = min(max(b + sign(dir)*(dir == UP || dir == DOWN), 0), h-1);

        data[0] = ind;
        data[1] = (dataTmp[2]);
        data[2] = (dataTmp[1]);
        data[3] = (dataTmp[4]);
        data[4] = (dataTmp[3]);
        
        global.rooms[a,b] = data;
        
        //data = array(1,(dir == DOWN),(dir==UP),(dir==LEFT),(dir==RIGHT));
        
        if (aPrev != a && bPrev != b)
            ind += 1;

        aPrev = a;
        bPrev = b;
        
        
        if (a == 0 || b == 0 || a == w-1 || b == h-1) continue;
        
    }
    
    var t;
    t = global.rooms[a,b];
    
    while (t[0] == 0)
    {
        a = irandom(w-1);
        b = irandom(h-1);
    }
}*/
