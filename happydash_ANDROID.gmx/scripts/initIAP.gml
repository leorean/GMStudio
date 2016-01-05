if (os_type != os_android && os_type != os_ios)
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
        if (ds_map_exists(global.purchaseMap, "noads"))
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "noads") == 0)
                global.noads = false;
            else
                global.noads = true;
        }
        if (ds_map_exists(global.purchaseMap, "unlockupgrades"))
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "unlockupgrades") == 0)
                global.unlockupgrades = false;
            else
                global.unlockupgrades = true;
        }
        if (ds_map_exists(global.purchaseMap, "player1"))
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "player1") == 0)
                global.playerLocked[1] = true;
            else
                global.playerLocked[1] = false;
        }
        if (ds_map_exists(global.purchaseMap, "player2"))
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "player2") == 0)
                global.playerLocked[5] = true;
            else
                global.playerLocked[5] = false;
        }
        if (ds_map_exists(global.purchaseMap, "player3"))
        {
            map_create = false;
            if (ds_map_find_value(global.purchaseMap, "player3") == 0)
                global.playerLocked[4] = true;
            else
                global.playerLocked[4] = false;
        }
        if (ds_map_exists(global.purchaseMap, "coinpack1"))
            map_create = false;
        if (ds_map_exists(global.purchaseMap, "coinpack2"))
            map_create = false;
        if (ds_map_exists(global.purchaseMap, "coinpack3"))
            map_create = false;
    }
}

if (map_create) // if no save file is found, we create one.
{
    global.purchaseMap = ds_map_create();
    var product1 = "noads";
    var product2 = "unlockupgrades";
    var product3 = "coinpack1";
    var product4 = "coinpack2";
    var product5 = "coinpack3";
    var product6 = "player1";
    var product7 = "player2";
    var product8 = "player3";
    ds_map_add(global.purchaseMap, product1, 0);
    ds_map_add(global.purchaseMap, product2, 0);
    ds_map_add(global.purchaseMap, product3, 0);
    ds_map_add(global.purchaseMap, product4, 0);
    ds_map_add(global.purchaseMap, product5, 0);
    ds_map_add(global.purchaseMap, product6, 0);
    ds_map_add(global.purchaseMap, product7, 0);
    ds_map_add(global.purchaseMap, product8, 0);
    ds_map_secure_save(global.purchaseMap, "iap_data.json");
}

//++++
//TODO: IF THIS CHANGES IN GOOGLE PLAY CONFIGURATION, ALSO CHANGE HERE!!!!
var productList = ds_list_create();

var pNoAds = ds_map_create();
ds_map_add(pNoAds, "id", "noads");
var pUnlockUpgrades = ds_map_create();
ds_map_add(pUnlockUpgrades, "id", "unlockupgrades");
pCoinpack1 = ds_map_create();
ds_map_add(pCoinpack1, "id", "coinpack1");
pCoinpack2 = ds_map_create();
ds_map_add(pCoinpack2, "id", "coinpack2");
pCoinpack3 = ds_map_create();
ds_map_add(pCoinpack3, "id", "coinpack3");
pPlayer1 = ds_map_create();
ds_map_add(pPlayer1, "id", "player1");
pPlayer2 = ds_map_create();
ds_map_add(pPlayer2, "id", "player2");
pPlayer3 = ds_map_create();
ds_map_add(pPlayer3, "id", "player3");

ds_list_add(productList, pNoAds);
ds_list_add(productList, pUnlockUpgrades);
ds_list_add(productList, pCoinpack1);
ds_list_add(productList, pCoinpack2);
ds_list_add(productList, pCoinpack3);
ds_list_add(productList, pPlayer1);
ds_list_add(productList, pPlayer2);
ds_list_add(productList, pPlayer3);

//VERY IMPORTANT
iap_activate(productList);

ds_map_destroy(pNoAds);
ds_map_destroy(pUnlockUpgrades);
ds_map_destroy(pCoinpack1);
ds_map_destroy(pCoinpack2);
ds_map_destroy(pCoinpack3);
ds_map_destroy(pPlayer1);
ds_map_destroy(pPlayer2);
ds_map_destroy(pPlayer3);

ds_list_destroy(productList);
