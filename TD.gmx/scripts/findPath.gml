if (argument0 == noone)
    exit;

var list = ds_queue_create();

with(objPath) { dist = 0; visited = false; }

ds_queue_enqueue(list,argument0);
argument0.visited = true;

while (ds_queue_size(list) > 0)
{
    var cur = ds_queue_dequeue(list);
    var neighbours = getNeighbours(cur);

    for (var i = 0; i < array_length_1d(neighbours); i++)
    {
        var next = neighbours[i];
        
        if (next == noone) continue;
        
        if (!next.visited)
        {
            ds_queue_enqueue(list,next);
            next.dist = 1 + cur.dist;
            next.visited = true;
        }
    }
    //show_debug_message("size: "+string(ds_queue_size(list)));
}

//show_debug_message("------------");
ds_queue_destroy(list);



