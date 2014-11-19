var e;
e = argument0;

if (e.alive)
{
    t = instance_create(e.x,e.y,objEffectDust);
    t.type = 2;
    doCombo();
    if (real(e.object_index) == real(objEnemyAutoSpike))
    {
        e.alive = false;
        e.state = DEAD;
    }
    if (real(e.object_index) != real(objEnemyAutoSpike))
        e.state = DEAD;
    playSound(sfxEnemyDie,.9+random(.2));
        
}
/*if (real(e.object_index) == real(objEnemyAutoSpike))
{
    if (e.alive)
    {
        t = instance_create(e.x,e.y,objEffectDust);
        t.type = 2;
        doCombo();
    }
    e.alive = false;
    playSound(sfxEnemyDie,.9+random(.2));
} else
if (e.state != DEAD)
{
    t = instance_create(e.x,e.y,objEffectDust);
    t.type = 2;
    doCombo();
    e.state = DEAD;
    playSound(sfxEnemyDie,.95+random(.1));
}*/
