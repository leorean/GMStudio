var sr_enemy = argument0;

//hp is dead, check rewards regarding enemy type
var value = 0;

switch(sr_enemy.object_index)
{
    case objEnemySoldier:
    case objEnemyDwarf:
    case objEnemySquid:
        value = 3;
    break;
    case objEnemyPotato:
    case objEnemyKnightRunner:
    case objEnemyBigSquid:
        value = 5;
    break;
    case objEnemyBlackKnight:
        value = 7;
    break;
    
}
repeat(value)
{
    var coll = instance_create(sr_enemy.x,sr_enemy.y,objCollectable);
    coll.type = T_COIN;
}

//spawn powerup
if (irandom(10) == 1)
    instance_create(TILE+random(WIDTH-2*TILE),-2*TILE,objPowerUp);

if (irandom(10) == 1)
{
    var coll = instance_create(sr_enemy.x,sr_enemy.y,objCollectable);
    coll.type = T_HP;
}
