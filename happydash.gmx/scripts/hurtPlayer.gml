if (!invincible)
{
        global.hp = max(global.hp - 1, 0);
        if (global.hp > 0)
        {
            yVel = -2;
            xVel = -2;
            invincible = invincibleTimer;
        }
    // else
    //    alive = false;
    //enemy = noone;
}
