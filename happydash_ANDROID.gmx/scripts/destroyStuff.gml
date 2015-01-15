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

return false;