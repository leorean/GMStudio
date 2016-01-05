if (!invincible)
{
        global.hp = max(global.hp - 1, 0);
        if (global.hp > 0)
        {
            yVel = -2;
            xVel = -2;
            invincible = invincibleTimer;
            hurt = true;
            playSound(sfxHurt,1);
            repeat(10)
                spawnParticle(x+random(TILE),y+random(TILE),COLOR_FLESH);
        }
    // else
    //    alive = false;
    //enemy = noone;
}
