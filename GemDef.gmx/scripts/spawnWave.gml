var i = 0;
var _ = -4*TILE;

var _count = 15 + (argument0 div 2) * 5 + (argument0 div 3) * 8;

for (i = 0; i < _count; i++)
{
    var s = instance_create(_, _, objSlime);
    
    s.type = min(i div 20, 3);
    s.delay = i * 40;
}

/*
switch(argument0)
{
    case 0:
        for (i = 0; i < 20; i++)
        {
            var s = instance_create(_, _, objSlime);
            s.type = 0;
            s.delay = i * 40;
        }
    break;
    case 1:
        for (i = 0; i < 30; i++)
        {
            var s = instance_create(_, _, objSlime);
            s.type = 0;
            s.delay = i * 40;
        }
    break;
    case 2:
        for (i = 0; i < 25; i++)
        {
            var s = instance_create(_, _, objSlime);
            s.type = i div 20;
            s.delay = i * 40;
        }
    break;
}*/
