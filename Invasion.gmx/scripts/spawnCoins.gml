var c_x = argument0;
var c_y = argument1;
var cnt = argument2;

/*
    V1 = 1,
    V2 = 5,
    V3 = 20,
    V4 = 50,
    V5 = 100,
    V6 = 500,
    V7 = 2000    
*/
repeat(cnt div coin.V7)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V7;
    cnt -= coin.V7;
}
repeat(cnt div coin.V6)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V6;
    cnt -= coin.V6;    
}
repeat(cnt div coin.V5)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V5;
    cnt -= coin.V5;
}
repeat(cnt div coin.V4)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V4;
    cnt -= coin.V4;    
}
repeat(cnt div coin.V3)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V3;
    cnt -= coin.V3;    
}
repeat(cnt div coin.V2)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V2;
    cnt -= coin.V2;    
}
repeat(cnt div coin.V1)
{
    var cn = instance_create(x,y,objCoin);
    cn.value = coin.V1;
    cnt -= coin.V1;    
}
