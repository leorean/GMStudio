global.pool[global.poolIndex].x = argument0;
global.pool[global.poolIndex].y = argument1;

with(global.pool[global.poolIndex])
{
    event_perform(ev_create, 0);
    color = argument2;
}

global.poolIndex = (global.poolIndex+1) % (array_length_1d(global.pool) - 1);

return global.pool[(global.poolIndex + (array_length_1d(global.pool) - 1))
 % (array_length_1d(global.pool) - 1)];
