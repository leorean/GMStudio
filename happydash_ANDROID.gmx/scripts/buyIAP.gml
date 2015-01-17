if (os_type != os_android)
    exit;

if (iap_status() == iap_status_available)
{
    var product = argument0;
    if (ds_map_find_value(global.purchaseMap, product) == 0)
    {
        iap_acquire(product, "");
    }
}
else
    show_message_async("Store is not available. :(");
