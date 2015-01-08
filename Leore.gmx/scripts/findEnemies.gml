var a,b,c,d;
a = argument0;
b = argument1;
c = argument2;
d = argument3;

var found, result, f; //array of all result instances
found = 0;
result = -1;
f = 0;
for (i = 0; i < instance_number(objEnemy); i++)
{
    found[i] = noone;
    result[i] = noone;
}

for (i = 0; i < instance_number(objEnemy); i++)
{
    var t;
    t = instance_find(objEnemy,i);
    if (instance_exists(t))
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
        return -1;
} else
    return -1;

    
