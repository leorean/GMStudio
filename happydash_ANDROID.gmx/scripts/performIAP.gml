if (os_type != os_android)
    exit;

var val = ds_map_find_value(iap_data, "type");
switch(val)
{
    //one-time purchases like noads or unlock stuff
    case iap_ev_purchase:
        var map = ds_map_create();
        var purchase_id = ds_map_find_value(iap_data, "index");
        iap_purchase_details(purchase_id, map);
        if (ds_map_find_value(map, "status") == iap_purchased)
        {
            var product_id = ds_map_find_value(map, "product");
            ds_map_replace(global.purchaseMap, product_id, 1);
            switch(product_id)
            {
            case "noads":
                global.noads = true;
            break;
                case "coinpack1":
                iap_consume(product_id);
            break;
            }
        }
        ds_map_destroy(map);
    break;
    //consumables
    case iap_ev_consume:
        var product_id = ds_map_find_value(iap_data, "product");
        if ds_map_find_value(iap_data, "consumed")
        {
            ds_map_replace(global.purchaseMap, product_id, 0);
            global.wallet += 2000;
        }
    break;
}
