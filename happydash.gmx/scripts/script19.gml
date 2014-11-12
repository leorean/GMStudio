jumpPerformed += 1;
if(jumpPerformed == 2)
{
    playSound(sfxDoubleJump);
    t = instance_create(x,y,objEffectDust);
    t.type = 1;
} else
    playSound(sfxJump);

jumpVel = 1.2;

yVel = -jumpVel*jumpVelMax;
state = JUMP;
