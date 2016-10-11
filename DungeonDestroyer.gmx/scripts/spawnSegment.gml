var data = argument0;

var w = ds_grid_width(data);
var h = ds_grid_height(data);
var t = 0;

if (spawnOffset == -1)
{
    _h = 1;
}
else
{
    _h = h;
}

global.segSize = _h;
spawnOffset = h;

for (var i = 0; i<w; i ++)
for (var j = 0; j<h; j++)
{
    t = ds_grid_get(data,i,j);

    switch (t)
    {
        case 0:
        case 1:
        case 2:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = t;
            break;
        case 3:        
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0);
        break;
        case 4:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1);
            break;
        case 5:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2);
            break;
        case 6:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2, 3);
            break;
        case 7:
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 3;
            b.subType = choose(0, 1, 2, 3, 4);
            break;
        case 8: //treasure
            var b = instance_create(i*TILE,-_h*TILE + j*TILE,objBlock);
            b.type = 4;
            break;            
    };
}

exit;
