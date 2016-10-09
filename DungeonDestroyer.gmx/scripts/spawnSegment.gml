var data = argument0;

var w = ds_grid_width(data);
var h = ds_grid_height(data);
var t = 0;

global.segSize = h;

for (var i = 0; i<w; i ++)
for (var j = 0; j<h; j++)
{
    t = ds_grid_get(data,i,j);

    switch (t)
    {
        case 0:
        case 1:
        case 2:
        case 3:        
            var b = instance_create(i*TILE,-h*TILE + j*TILE,objBlock);
            b.type = t;
        break;
    };
}
