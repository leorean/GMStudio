global.wallet += global.coinsCollected;

global.maxLevelReached = max(global.maxLevelReached,global.level);

//a thousand miles achievement
var dstnc;
dstnc = max(min(floor(global.distance*.01),100),0);
postAchievement("CgkIsq60qNAMEAIQFQ",dstnc,true);

saveProgress();
loadProgress();
unlockUpgrades();
