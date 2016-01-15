if (argument0 == noone)
    exit;

var list = ds_list_create();
var visited = ds_list_create();

with(objPath) dist = 0;

ds_list_add(list,argument0);

while (ds_list_size(list) > 0)
{
    var cur = ds_list_find_value(list,0);
    var neighbours = getNeighbours(cur);
    ds_list_delete(list,0);
    
    for (var i = 0; i < array_length_1d(neighbours); i++)
    {
        var next = neighbours[i];
        if (ds_list_find_index(visited,next) == -1)
        {
            ds_list_add(list,next);
            next.dist = 1 + cur.dist;
            ds_list_add(visited,cur);
        }
    }
}

ds_list_destroy(list);
ds_list_destroy(visited);


