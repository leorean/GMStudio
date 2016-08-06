var a,b,c,d;
a = argument0; //x
b = argument1; //y
c = argument2; //maximum range
d = argument3; //maximum number of enemies

var found, result, f; //array of all result instances
found = 0;
result = noone;
f = 0;
for (i = 0; i < instance_number(objNpc); i++)
{
    found[i] = noone;
    result[i] = noone;
}

for (i = 0; i < instance_number(objNpc); i++)
{
    var t;
    t = instance_find(objNpc, i);
    if (instance_exists(t) && t != self && t.state != INFECTED)
    {
        if ((abs(abs(t.x) - abs(a)) <= c)
            && (abs(abs(t.y) - abs(b)) <= c)) 
        {
            found[f] = t;
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
        return noone;
} else
    return noone;

    
