if (jumpPerformed < 2 || (global.powerUp == POW_2 && y > -2*TILE))
{
    if (global.powerUp != POW_2)
        jumpPerformed += 1;
        
    if(jumpPerformed == 2)
    {
        playSound(sfxJump,1.3);
        t = instance_create(x,y,objEffectDust);
        t.type = 1;
    } else
        playSound(sfxJump,1);
    
    jumpVel = 1.2;
    
    yVel = -jumpVel*jumpVelMax;
    state = JUMP;
}
