if (state != DEAD)
{

    if (abs(yVel) >= yGrav)
        checkNeeded = true;
    else
        checkNeeded = false;
    
    if (checkNeeded)
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

} else
    y += yVel;
