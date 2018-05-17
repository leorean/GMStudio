var str,explode,i,c,arr;

str = argument0;
explode = argument1;
c = 0;

for(i = 0; i < string_count(explode, str)+1; i++)
    arr[i] = "";

for (i = 1; i <= string_length(str); i++)
{
    if (string_char_at(str,i) != explode)
        arr[c] += string_char_at(str,i);
    else
        c++;
}

//for (i = 0; i < array_length_1d(arr);i++) show_debug_message(arr[i]);
return arr;
