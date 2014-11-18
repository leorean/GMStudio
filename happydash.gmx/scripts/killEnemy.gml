var e;
e = argument0;

if (real(e.object_index) == real(objEnemyAutoSpike))
{
    if (e.alive)
    {
        t = instance_create(e.x,e.y,objEffectDust);
        t.type = 2;
        doCombo();
    }
    e.alive = false;
} else
if (e.state != DEAD)
{
    t = instance_create(e.x,e.y,objEffectDust);
    t.type = 2;
    doCombo();
    e.state = DEAD;
}
