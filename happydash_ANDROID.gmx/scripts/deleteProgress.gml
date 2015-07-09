if file_exists(working_directory + global.saveFile)
   file_delete(working_directory + global.saveFile);

//clear scores
for (i = 0; i < global.scoreCount; i+=1)
    global.scores[i] = 0;

for (i = 0; i < UPGRADE.SIZE; i+=1)
{
    global.upgrade[i, UPGRADE.TIER] = 0;
    global.upgrade[i, UPGRADE.LOCKED] = true;
}
        
global.wallet = 0;

global.maxLevelReached = 0;
global.playThrough = 0;
global.playerSelected = 0;
for (i = 0; i <= global.maxPlayerSelected; i++)
    global.playerLocked[i] = true;

global.unlockupgrades = false;
global.noads = false;