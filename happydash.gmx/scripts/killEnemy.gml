var e;
e = argument0;

if (e.alive)
{
    doCombo();
    e.alive = false;
    global.xp += 5;
    playSound(sfxEnemyDie,.9+random(.2));       
}
