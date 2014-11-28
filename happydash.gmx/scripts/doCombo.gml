var pitch, c;

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
    if (global.player.combo == 10)
    {
        playSound(sfxApplause,1);
        //instance_create(0,0,objEffectCombo);
    }
    else if (global.player.combo mod 10 == 0)
    {
        playSound(sfxApplauseBig,1);
        //instance_create(0,0,objEffectCombo);
    }
    else
        playSound(sfxCombo,1+min(global.player.combo*.07,.7));

}
global.player.pow = min(global.player.pow + TILE, global.player.maxPow);
