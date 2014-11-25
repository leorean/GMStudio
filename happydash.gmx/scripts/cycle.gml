if (!global.spawnSegment)
    x -= global.xSpeed;

if (x < WIDTH && !visible)
    visible = true;

if (x < -TILE || y > HEIGHT+TILE)
    instance_destroy();