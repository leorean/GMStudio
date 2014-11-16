repeat(5)
    spawnParticle(x+TILE*.5,y+TILE*.5,COLOR_POO);

var pitch;
pitch = max(min(1 + combo/30,1.5),1);
//playSound(sfxCombo,pitch);
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
    repeat(min(combo-1,30)) // not more than 30 coins!!
    {
        c = instance_create(x+TILE+2*xVel,y,objCoin);
        c.spawn = true;
    }
}
pow = min(pow + TILE, maxPow);

