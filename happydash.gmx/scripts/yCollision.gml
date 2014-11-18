if (state != DEAD)
{
    repeat(round(abs(yVel)))
    {
        if (place_free(x,y+sign(yVel))
            && (!collision_line(bbox_left,bbox_bottom+sign(yVel),bbox_right,bbox_bottom+sign(yVel),objPlatform,false,true) || yVel < 0))
                y += sign(yVel);
        else
            yVel = 0;
    }
} else
    y += yVel;
