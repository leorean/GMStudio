//SLOPE y-SHIFT downwards
if (yVel >= 0)
{
    var s,d;
    s = false;
    d = 0;
    for (i = 0; i < 5; i++)
    {
        if (place_meeting(x+xVel,y+i,objSlope))
        {
            s = true;
            break;
        } else
            d++;
    }
    if (s) y += d;
}

//SLOPE y-SHIFT upwards
if (place_meeting(x+xVel,y,objSlope))
{
    ys = 0;
    while (place_meeting(x+xVel,y-ys,objSlope) && ys <= abs(1*xVel)) ys += 1;
    if (place_meeting(x+xVel,y-1,objSlope))
    {
        while (!place_meeting(x+sign(xVel),y,objSlope)) x+=sign(xVel);
        xVel = 0;
    }
    else
        y -= ys;
}

//x-COLLISION
if (place_free(x+xVel,y))
    x += xVel;
else
    xVel = 0;

//Y-COLLISION
yVel += yGrav;
repeat(round(abs(yVel)))
{
    if (place_free(x,y+sign(yVel)))
    {
        y += sign(yVel);
    }
    else
        yVel = 0;
}
