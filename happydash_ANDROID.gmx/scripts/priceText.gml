var ret, suff;

var pos, prefix, suffix;
pos = string_pos(".",argument0);
if (pos == 0)
    pos = string_pos(",",argument0);
    
if (pos != 0)
{
    prefix = string_digits(string_copy(argument0,1,pos));
    suffix = string_digits(string_copy(argument0,pos,string_length(argument0)+1-pos));
    ret = prefix + "." + suffix;
}
else
{
    prefix = string_digits(argument0);
    suffix = "";
    ret = prefix;
}

switch (os_get_language())
{
    case "de":
    case "at":
    case "ch":
        suff = "EUR";
    break;
    case "gb":
        suff = "GBP";
    break;
    default:
        suff = "$";
    break;
}

return string(suff + " " + ret);
