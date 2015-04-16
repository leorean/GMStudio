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
        if (in(tar.cx,a-r,a+r) && in(tar.cy,b-r,b+r))
        /*var angle = point_direction(tar.cx,tar.cy,a,b);
        if (abs(tx-cx)<=abs(lengthdir_x(r,angle))
        && abs(ty-cy)<=abs(lengthdir_y(r,angle)))*/
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
        for (i = 0; i < array_length_1d(found); i++)
            result[i] = found[i];
        return result;
    } else
        return -1;
} else
    return -1;

    
