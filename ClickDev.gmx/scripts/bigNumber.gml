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
    ret = string(arg);//string_format(arg,0,3)+"";
else if (arg < power(1000,2))
    ret = string_format(arg/power(1000,1),0,3)+"k";
else if (arg < power(1000,3))
    ret = string_format(arg/power(1000,2),0,3)+"mil.";
else if (arg < power(1000,4))
    ret = string_format(arg/power(1000,3),0,3)+"bil.";
else if (arg < power(1000,5))
    ret = string_format(arg/power(1000,4),0,3)+"tril.";
else if (arg < power(1000,6))
    ret = string_format(arg/power(1000,5),0,2)+"quad.";
else if (arg < power(1000,7))
    ret = string_format(arg/power(1000,6),0,2)+"quint.";
else if (arg < power(1000,8))
    ret = string_format(arg/power(1000,7),0,2)+"quint.";
else if (arg < power(1000,9))
    ret = string_format(arg/power(1000,8),0,2)+"sxt.";
else if (arg < power(1000,10))
    ret = string_format(arg/power(1000,9),0,2)+"sept.";
else if (arg < power(1000,11))
    ret = string_format(arg/power(1000,10),0,2)+"oct.";
else if (arg < power(1000,12))
    ret = string_format(arg/power(1000,11),0,2)+"non.";
else// if (arg < power(1000,13))
    ret = string_format(arg/power(1000,12),0,2)+"dec.";
    
ret = string_replace(ret,".",",");

return ret;
