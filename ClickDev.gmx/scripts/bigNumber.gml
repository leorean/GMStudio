var arg = argument0;
var ret = "";

/*
0 -> 999
1,000k -> 999,000k
1,000 mil. -> 999,000 mil

*/
//if (arg div 1000 < 1)
//    ret = string(floor(arg));
if (arg < power(1000,1))
    ret = string_format(floor(arg),0,0)+"";
else if (arg < power(1000,2))
    ret = string_format(arg/power(1000,1),0,3)+"k";
else if (arg < power(1000,3))
    ret = string_format(arg/power(1000,2),0,3)+"m";
else if (arg < power(1000,4))
    ret = string_format(arg/power(1000,3),0,3)+"b";
else if (arg < power(1000,5))
    ret = string_format(arg/power(1000,4),0,3)+"t";
    
ret = string_replace(ret,".",",");

return ret;


