var arg = argument0;
var ret = "";

if (arg div 1000 < 1)
    ret = string(floor(arg));
else if (arg div 1000 < 1000)
    ret = string_format(arg/1000,0,3)+"k";//string_format(arg,4,3)+"";
else if (arg div 1000 < power(1000,2))
    ret = string_format(arg/power(1000,2),0,3)+"M";
else if (arg div 1000 < power(1000,3))
    ret = string_format(arg/power(1000,3),0,3)+"B";
else if (arg div 1000 < power(1000,4))
    ret = string_format(arg/power(1000,4),0,3)+"T";

ret = string_replace(ret,".",",");

show_debug_message(global.c);

return ret;


