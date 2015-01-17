if (os_type != os_android)
{
    global.noads = true;
    exit;
}

var map_create = true;
if file_exists("iap_data.json")
{
    global.purchaseMap = ds_map_secure_load("iap_data.json");
    
    //WARNING: WHEN PURCHASING, MAKE SURE TO SET THESE GLOBALS TOO!!!
    if ds_exists(global.purchaseMap, ds_type_map)
    {
        if ds_map_exists(global.purchaseMap, "noads")
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "noads") == 0)
                global.noads = false;
            else
                global.noads = true;
        }
        if ds_map_exists(global.purchaseMap, "unlockupgrades")
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "unlockupgrades") == 0)
                global.unlockupgrades = false;
            else
                global.unlockupgrades = true;
        }
    }
}

if (map_create) // if no save file is found, we create one.
{
    global.purchaseMap = ds_map_create();
    var product1 = "noads";
    ds_map_add(global.purchaseMap, product1, 0);
    //ds_map_add(global.purchaseMap, product2, 0);
    ds_map_secure_save(global.purchaseMap, "iap_data.json");
}

//++++
//TODO: IF THIS CHANGES IN GOOGLE PLAY CONFIGURATION, ALSO CHANGE HERE!!!!
var productList = ds_list_create();

var pNoAds = ds_map_create();
ds_map_add(pNoAds, "id", "noads"); //the id from google play
ds_map_add(pNoAds, "title", "No Ads!");
ds_map_add(pNoAds, "description", "Get rid of ads permanently!");
//ds_map_add(pNoAds, "type", "Durable");

var pUnlockUpgrades = ds_map_create();
ds_map_add(pUnlockUpgrades, "id", "unlockupgrades"); //the id from google play
ds_map_add(pUnlockUpgrades, "title", "Unlock all Upgrades!");
ds_map_add(pUnlockUpgrades, "description", "Instantly unlock every upgrade in the game! But you still have to upgrade them!");
//ds_map_add(pNoAds, "type", "Durable");

pCoinpack1 = ds_map_create();
ds_map_add(pCoinpack1, "id", "coinpack1");
ds_map_add(pCoinpack1, "title", "1000 Coins!");
ds_map_add(pCoinpack1, "description", "A small sackful of coins.");
//ds_map_add(pCoinpack1, "type", "Consumable");

pCoinpack2 = ds_map_create();
ds_map_add(pCoinpack2, "id", "coinpack2");
ds_map_add(pCoinpack2, "title", "3000 Coins!");
ds_map_add(pCoinpack2, "description", "A medium sackful of coins.");
//ds_map_add(pCoinpack2, "type", "Consumable");

pCoinpack3 = ds_map_create();
ds_map_add(pCoinpack3, "id", "coinpack3");
ds_map_add(pCoinpack3, "title", "6000 Coins!");
ds_map_add(pCoinpack3, "description", "A big sackful of coins.");
//ds_map_add(pCoinpack3, "type", "Consumable");

ds_list_add(productList, pNoAds);
ds_list_add(productList, pUnlockUpgrades);
ds_list_add(productList, pCoinpack1);
ds_list_add(productList, pCoinpack2);
ds_list_add(productList, pCoinpack3);

//VERY IMPORTANT
iap_activate(productList);

ds_map_destroy(pNoAds);
ds_map_destroy(pCoinpack1);
ds_map_destroy(pCoinpack2);
ds_map_destroy(pCoinpack3);
ds_map_destroy(pUnlockUpgrades);

ds_list_destroy(productList);