if (!global.spawnSegment)
    x -= global.xSpeed;

if (x < WIDTH)
    visible = true;

if (x < -2*TILE || y > 2*TILE)
    instance_destroy();
