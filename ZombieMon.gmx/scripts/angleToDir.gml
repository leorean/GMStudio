var _a = argument0;

if (in(_a, 135, 225))
    return LEFT;
if (in(_a, 225, 315))
    return DOWN;
if (in(_a, 45, 135))
    return UP;
if (in(_a+360, 315, 405))
    return RIGHT;

