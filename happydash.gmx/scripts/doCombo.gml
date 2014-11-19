repeat(5)
    spawnParticle(x+TILE*.5,y+TILE*.5,COLOR_POO);

var pitch;
pitch = max(min(1 + global.player.combo/30,1.5),1);
//playSound(sfxCombo,pitch);
global.player.combo += 1;

global.maxCombo = max(global.maxCombo, global.player.combo);

if (true)
{
    global.addScore += global.player.combo*10;
    var i;
    i = 0;
    repeat(min(global.player.combo-1 div 3,10)) // not so many coins!
    {
        c = instance_create(x+TILE/*+2*xVel*/,y,objCoin);
        c.spawn = true;
    }
}
global.player.pow = min(global.player.pow + TILE, global.player.maxPow);

