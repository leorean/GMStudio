for (var j = argument0; j < argument0 + global.segHeight*TILE; j += TILE)
{
    var platforms = 0;
    for(var i = 0; i < room_width; i+= TILE)
    {
        if (place_meeting(i, j, objAny))
            continue;
          
        var b = choose(0, 0, 0, 1, 1, 1, 1, 1, 2, 2);
        switch(b)
        {
            case 0:
                if (choose(0,0,0,0,0,1) == 1)
                    instance_create(i, j, objCoin);
                break;
            case 1:
                var b = instance_create(i, j, objBlock);
                b.type = choose(0,0,0,0,0,0,0,0,0,0,0,0,1);
                break;
            case 2:
                instance_create(i, j, objPlatform);
                platforms++;
                break;
        }
    }
    while (platforms < 2)
    {
        var k = irandom(room_width/TILE) * TILE;
        var b = instance_place(k, j, objAny);        
        if (instance_exists(b))
        {
            if (object_get_name(b) == "objPlatform")
                continue;
            else
            {
                with(b) instance_destroy();
                instance_create(k, j, objPlatform);
                platforms++;
            }
        }
    }
}
