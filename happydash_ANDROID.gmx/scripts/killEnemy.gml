var e;
e = argument0;

if (e.alive)
{
    //kill enemy
    postAchievement("CgkIsq60qNAMEAIQBw",1);
    
    doCombo();
    e.alive = false;
    global.xp += 10;
    playSound(sfxEnemyDie,.9+random(.2));       
}
