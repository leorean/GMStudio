if (real(enemy.object_index) == real(objEnemyAutoSpike))
{
    if (enemy.alive)
    {
        t = instance_create(enemy.x,enemy.y,objEffectDust);
        t.type = 2;
        doCombo();
    }
    enemy.alive = false;
} else
if (enemy.state != DEAD)
{
    t = instance_create(enemy.x,enemy.y,objEffectDust);
    t.type = 2;
    doCombo();
    enemy.state = DEAD;
}
