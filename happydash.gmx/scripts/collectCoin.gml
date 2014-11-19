coin = instance_place(x+xVel,y+yVel,objCoin);
if (instance_exists(coin))
{
    if (!coin.alarm[0] && coin.magnet && coin.alive)
    {
            global.coins += 1;
            global.coinsCollected += 1;
            //each 5 segments, the coin is worth more!!
            global.addScore += (global.difficulty div 5);
            coin.alive = false;
            playSound(sfxCoin,1);//choose(1,1.025,1.05));
    }
}
coin = noone;

