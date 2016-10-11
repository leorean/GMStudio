/* collide with coins */
instance_deactivate_object(objCoin);
instance_activate_region(x - global.coinRadius, y - global.coinRadius,
    2*global.coinRadius, 2*global.coinRadius, true);

for (i = 0; i < instance_number(objCoin); i++)
{
    var coin = instance_find(objCoin, i);
    var colCoin = collision_circle(x, y, 2*global.coinRadius, coin, false, true);
    if (colCoin && !colCoin.taken && !colCoin.delay)
    {
        colCoin.taken = true;
        colCoin.target = id;                
    }
}
instance_activate_object(objCoin);
