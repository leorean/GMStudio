if (os_type != os_android)
    exit;

if (iap_status() == iap_status_available)
{
    var prod = argument0;
    if (ds_map_find_value(global.purchaseMap, prod) == 0)
    {
        iap_acquire(prod, "");
    }
}
else
    show_message_async("Unavailable. Please try again!");