if (jumpPerformed < global.maxJumps || (global.powerUp == POW_2 && y > -2*TILE))
{

    playSound(sfxJump,1 + .3*jumpPerformed);
    if (global.powerUp != POW_2)
        jumpPerformed += 1;
        
    if(true)//jumpPerformed > 1)
    {
        t = instance_create(x+xVel,y+yVel,objEffectDust);
        t.yVel = .5;
        t.type = 1;
    }
    jumpVel = 1.2;
    
    yVel = -jumpVel*jumpVelMax;
    state = JUMP;
} else
    if (state == ATTACK)
        state = JUMP;
