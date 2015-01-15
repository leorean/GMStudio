if (!global.spawnSegment)
    x -= global.xSpeed;

if (x < WIDTH)
    visible = true;

if (x < -2*TILE || y > HEIGHT+2*TILE)
    instance_destroy();