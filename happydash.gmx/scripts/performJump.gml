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
