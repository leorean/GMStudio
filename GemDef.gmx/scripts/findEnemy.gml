var a,b,c,d;
a = argument0;
b = argument1;
c = argument2;

var _found = noone;

for (i = 0; i < instance_number(objSlime); i++)
{
    var _t = instance_find(objSlime, i);
    if (point_distance(a, b, _t.x, _t.y) <= c)
    {
        if (_found == noone || (_t.path_position >= _found.path_position))
            _found = _t;
    }
}

return _found;    
