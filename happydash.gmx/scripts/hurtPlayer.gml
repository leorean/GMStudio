if (!invincible)
{
        hp = max(hp - 1, 0);
        if (hp > 0)
        {
            yVel = -2;
            xVel = -2;
            invincible = invincibleTimer;
        }
    // else
    //    alive = false;
    //enemy = noone;
}