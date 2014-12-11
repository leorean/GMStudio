var e;
e = argument0;

if (e.alive)
{
    doCombo();
    e.alive = false;
    
    playSound(sfxEnemyDie,.9+random(.2));       
}
