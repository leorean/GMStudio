combo += 1;

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


