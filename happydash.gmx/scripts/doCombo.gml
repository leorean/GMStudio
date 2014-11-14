repeat(5)
    spawnParticle(x+TILE*.5,y+TILE*.5,make_color_hsv(random(255),255,255));//make_color_rgb(49,33,27));

combo += 1;

global.maxCombo = max(global.maxCombo, combo);

if (true)
{
/*
    t = instance_create(cx,cy,objText);
    t.text = ":"+string(combo);
    t.fnt = global.fntCombo;
    t.color = make_color_hsv(max(50 - (combo*5),0),255,255);
*/
    global.addScore += combo*10;
    repeat(combo-1)
    {
        c = instance_create(x+TILE+2*xVel,y,objCoin);
        c.spawn = true;
    }
}
pow = min(pow + TILE, maxPow);

