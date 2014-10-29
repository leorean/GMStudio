var a,b,w,h;
a = argument0;
b = argument1;
w = argument2-TILE;
h = argument3-TILE;

for (i = 0; i <= w;i+=TILE)
for (j = 0; j <= h;j+=TILE)
{
    var row, col;
    row = 1;
    col = 1;
    if (i == 0) && (j == 0)
    {row = 0; col = 0}
    else if (i == w) && (j == 0)
    {row = 2; col = 0}
    else if (i == 0) && (j == h)
    {row = 0; col = 2}
    else if (i == w) && (j == h)
    {row = 2; col = 2}
    else if (i == 0)
    {row = 0; col = 1}
    else if (i == w)
    {row = 2; col = 1}
    else if (j == 0)
    {row = 1; col = 0}
    else if (j == h)
    {row = 1; col = 2}

    draw_sprite_part(global.sprHud,-1,row*TILE,5*TILE+col*TILE,TILE,TILE,a+i,b+j);
}
