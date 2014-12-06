if (!global.spawnSegment)
    x -= global.xSpeed;

if (x < WIDTH && !visible)
    visible = true;

if (x < -.5*WIDTH || y > 1.5*HEIGHT)
    instance_destroy();
