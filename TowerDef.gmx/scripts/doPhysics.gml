var slopeL, slopeR;

//slopeR = collision_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_bottom+8,objSlopeR,true,true);
slopeL = collision_rectangle(x-2,bbox_bottom-1,x+2,bbox_bottom+3,objSlopeL,true,true);
slopeR = collision_rectangle(x-2,bbox_bottom-1,x+2,bbox_bottom+3,objSlopeR,true,true);

if (yVel >= 0)
{
    if (slopeR != noone)
    {
        var off, shift;
        off = (sprite_get_height(sprite_index) - sprite_get_bbox_bottom(sprite_index));
        shift = 
        max(min(floor(slopeR.y + h/2 - (.5*(slopeR.x+2*TILE-x))),
        slopeR.y + TILE - off), slopeR.y - h);
        if (y >= shift)
        {
            y = shift + 2;
            yVel = 2;
            onSlope = true;
        }
    }
    if (slopeL != noone)
    {
        var off, shift;
        off = (sprite_get_height(sprite_index) - sprite_get_bbox_bottom(sprite_index));
        shift = 
        max(min(floor(slopeL.y + h/2 - (.5*(x - slopeL.x))),
        slopeL.y + TILE - off), slopeL.y - h);
        //onGround = true;        
        if (y >= shift)
        {
            y = shift + 2;
            yVel = 2;
            onSlope = true;
        }
    }
} else
{
    onSlope = false;
    isJumped = true;
}

if (slopeL == noone && slopeR == noone) onSlope = false;
/*
if (slope != noone)
{
    onGround = true;
    yVel = 0;
    if (slope.object_index == objSlopeL)
        y = min(max(floor(slope.y - (1/2)*(cx - slope.x)),slope.y-TILE),slope.y);
    else if (slope.object_index == objSlopeR)
        y = min(max(floor(slope.y - (1/2)*(slope.x+2*TILE - cx)),slope.y-TILE),slope.y);
    else
        slope = noone;
} else
    yVel += yGrav;
*/

//SLOPE y-SHIFT downwards
/*
if (yVel >= 0)
{
    var s,d;
    s = false;
    d = 0;
    for (i = 0; i < 5; i++)
    {
        if (place_meeting(x+xVel,y+i,objSlopeL) || place_meeting(x+xVel,y+i,objSlopeR))
        {
            s = true;
            break;
        } else
            d++;
    }
    if (s) y += d;
}

//SLOPE y-SHIFT upwards
if (place_meeting(x+xVel,y,objSlopeL) || place_meeting(x+xVel,y,objSlopeR))
{
    var ys;
    ys = 0;
    while ((place_meeting(x+xVel,y-ys,objSlopeL) || place_meeting(x+xVel,y-ys,objSlopeR))&& ys <= abs(1*xVel)) ys += 1;
    if (place_meeting(x+xVel,y-1,objSlopeL) || place_meeting(x+xVel,y-1,objSlopeR))
    {
        while (!place_meeting(x+sign(xVel),y,objSlopeL) && !place_meeting(x+sign(xVel),y,objSlopeR)) x+=sign(xVel);
        xVel = 0;
    }
    else
        y -= ys;
}*/

//x-COLLISION
if (place_free(x+xVel,y))
    x += xVel;
else
    xVel = 0;

//Y-COLLISION
yVel += yGrav;
repeat(round(abs(yVel)))
{
    if (place_free(x,y+sign(yVel)) || onSlope)
    {
        y += sign(yVel);
    }
    else
        yVel = 0;
}