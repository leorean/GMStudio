for (i = 0; i < UPGRADE.SIZE; i+=1)
    global.upgrade[i,UPGRADE.LOCKED] = true;

if (true) //unlocked right away
{
    global.upgrade[UPGRADE.upMagnet,UPGRADE.LOCKED] = false;
    global.upgrade[UPGRADE.upDash,UPGRADE.LOCKED] = false;
    global.upgrade[UPGRADE.upBlockNew,UPGRADE.LOCKED] = false;

    if (global.upgrade[UPGRADE.upBlockNew,UPGRADE.TIER] >= 1)
        global.upgrade[UPGRADE.upBlockChance,UPGRADE.LOCKED] = false;
    
    if (global.upgrade[UPGRADE.upBlockNew,UPGRADE.TIER] >= 2)
        global.upgrade[UPGRADE.upPowerUpNew,UPGRADE.LOCKED] = false;
}
if (global.maxLevelReached >= 5) //if reached world 2
{
    global.upgrade[UPGRADE.upHealth,UPGRADE.LOCKED] = false;
    global.upgrade[UPGRADE.upComboCooldown,UPGRADE.LOCKED] = false;    
}
if (global.maxLevelReached >= 10) //if reached world 3
{
    global.upgrade[UPGRADE.upPowerUpTime,UPGRADE.LOCKED] = false;
    global.upgrade[UPGRADE.upJump,UPGRADE.LOCKED] = false;
}
if (global.maxLevelReached >= 15) //if reached world 3
{
    global.upgrade[UPGRADE.upSuperDash,UPGRADE.LOCKED] = false;
}
