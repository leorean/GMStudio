if (!global.spawnSegment)
    x -= global.xSpeed;

if (x < WIDTH && !visible)
    visible = true;

if (x < -WIDTH*.5 || y > HEIGHT+TILE)
    instance_destroy();
