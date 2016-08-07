var _c = argument0;
var _x = argument1;
var _y = argument2;

while ((_c div 2000) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 2000;
    _c -= 2000;
}
while ((_c div 500) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 500;
    _c -= 500;
}
while ((_c div 100) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 100;
    _c -= 100;
}
while ((_c div 50) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 50;
    _c -= 50;
}
while ((_c div 10) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 10;
    _c -= 10;
}
while ((_c div 5) > 0)
{
    var t = instance_create(_x, _y, objCoin);
    t.value = 5;
    _c -= 5;
}

