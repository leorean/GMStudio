var ret, suff;

ret = string(real(argument0));

ret = string_format(real(ret),string_length(ret),2);

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
