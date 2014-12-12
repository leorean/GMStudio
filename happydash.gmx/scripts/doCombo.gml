var pitch, c;

global.player.combo += 1;
global.player.alarm[1] = global.player.alarm1;
global.player.jumpPerformed = 0;

global.maxCombo = max(global.maxCombo, global.player.combo);

if (true)
{
    global.addScore += global.player.combo*10;
    var i;
    i = 0;
    repeat(min((global.player.combo+1) div 3,3)) // not so many coins!
    {
        c = instance_create(x+TILE,y,objCoin);
        c.spawn = true;
    }
    if (global.player.combo == 10)
        playSound(sfxApplause,1);
    else if (global.player.combo mod 10 == 0)
        playSound(sfxApplauseBig,1);
    else
        playSound(sfxCombo,1+min(global.player.combo*.07,.7));

}

if (global.player.state == ATTACK)
global.player.pow = global.player.maxPow;//min(global.player.pow + global.player.maxPow*.5, global.player.maxPow);//min(global.player.pow + 1.5*TILE, global.player.maxPow);