global.wallet += global.coinsCollected;

global.maxLevelReached = max(global.maxLevelReached,global.level);

saveProgress();
loadProgress();
unlockUpgrades();