#define script4

#define spawnSegment
// spawn segments
if (!collision_rectangle(0, -TILE, room_width, 0, objAny, false, true))
{
    for(i = 0; i < room_width; i+= TILE)
    {
        var b = choose(0, 0, 0, 1, 1, 1, 1, 2, 2, 2);
        switch(b)
        {
            case 0:
                break;
            case 1:
                instance_create(i, -TILE, objBlock);
                break;
            case 2:
                instance_create(i, -TILE, objPlatform);
                break;
        }
    }
}

/*var data = argument0;

var w = ds_grid_width(data);
var h = ds_grid_height(data);
var t = 0;

_h = h;

for (var i = 0; i<w; i ++)
for (var j = 0; j<h; j++)
{
    t = ds_grid_get(data,i,j);

    switch (t)
    {
        case 0:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
                        
            if (meters <= 20)
            {
                b.subType = choose(0, 1);
                b.maxHp = 2;
                b.hp = choose(1, 2);
            }
            else if (meters <= 40)
            {
                b.subType = choose(0, 1, 1, 2);
                b.maxHp = 1;
                b.hp = 1;
            }
            else if (meters <= 70)
            {
                b.subType = choose(0, 1, 2, 2);
                b.maxHp = 1;
                b.hp = 1;
            }
            else
            {            
                b.subType = choose(0, 1, 2, 3);
                if (b.subType == 0 || b.subType == 1)
                {
                    b.maxHp = 2;
                    b.hp = 2;
                }
            }
        break;
        case 2:
        case 3:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = t;
            break;
        case 4:        
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0);
        break;
        case 5:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1);
            break;
        case 6:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2);
            break;
        case 7:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2, 3);
            break;
        case 8:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2, 3, 4);
            break;
        case 9: //treasure
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 4;
            break;            
    };
}

return h;*/
