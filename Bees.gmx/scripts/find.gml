/*
    find all instances t from point a,b within radius r and return an array of their id's
    if none are found, return -1
*/
var a,b,r,t;
a = argument0;
b = argument1;
r = argument2;
t = argument3;

var found, result, f; //array of all result instances
found = 0;
result = -1;
f = 0;
for (i = 0; i < instance_number(t); i++)
{
    found[i] = noone;
    result[i] = noone;
}

for (i = 0; i < instance_number(t); i++)
{
    var tar;
    tar = instance_find(t,i);
    if (instance_exists(tar))
    {
        /*
            TODO:
            calculate circular radius.
            x = length * cos (angle);
            y = length * sin (angle);

        */
        if (in(tar.x,a-r/2,a+r/2) && in(tar.y,b-r/2,b+r/2))
        {
            found[f] = tar;
            f++;
        }
    }
}

if (is_array(found))
{
    if (array_length_1d(found) > 0)
    {
        for (i = 0; i < min(array_length_1d(found),d); i++)
            result[i] = found[i];
        return result;   
    } else
        return -1;
} else
    return -1;

    
