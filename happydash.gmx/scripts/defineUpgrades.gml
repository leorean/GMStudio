for (i = 0; i < UPGRADE.SIZE; i+=1)
{
    global.upgrade[i, UPGRADE.TIER] = 0;
    global.upgrade[i, UPGRADE.LOCKED] = true;
}

//UNLOCK CERTAIN UPGRADES
global.upgrade[UPGRADE.upHealth,UPGRADE.LOCKED] = false;
global.upgrade[UPGRADE.upJump,UPGRADE.LOCKED] = false;
global.upgrade[UPGRADE.upMagnet,UPGRADE.LOCKED] = false;
global.upgrade[UPGRADE.upDash,UPGRADE.LOCKED] = false;
global.upgrade[UPGRADE.upItemChance,UPGRADE.LOCKED] = false;

