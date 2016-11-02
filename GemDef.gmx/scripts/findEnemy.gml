var a,b,c,d;
a = argument0;
b = argument1;
c = argument2;
d = argument3; //can find invisible?

var _found = noone;

for (i = 0; i < instance_number(objSlime); i++)
{
    var _t = instance_find(objSlime, i);
    if (point_distance(a, b, _t.x, _t.y) <= c && instance_exists(_t)
        && (!_t.invisible || d))
    {
        if (_found == noone || (_t.path_position >= _found.path_position))
            _found = _t;
    }
}

return _found;    
