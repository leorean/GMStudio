var destroyBlock, enemy, livingEnemy;
destroyBlock = noone;
enemy = noone;
livingEnemy = noone;

destroyBlock = instance_place(x,y,objDestroyBlock);
if (instance_exists(destroyBlock))
{
    destroyBlock.state = DEAD;
    doCombo();
    return true;
}
enemy = instance_place(x,y,objEnemy);
if (instance_exists(enemy))
{
    killEnemy(enemy);
    return true;
}
/*
livingEnemy = instance_place(x,y,objLivingEnemy);
if (instance_exists(livingEnemy))
{
    killEnemy(livingEnemy);
    return true;
}else
enemy = instance_place(x,y,objEnemy);
if (instance_exists(enemy))
{
    with(enemy)
    {
        instance_create(x,y,objEffectDust);
        playSound(sfxDestroyBlock,1);
        instance_destroy();
    }
    return true;
}*/
    return false;
