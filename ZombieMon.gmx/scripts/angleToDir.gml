var _a = argument0;

var _ = NONE;

if (in(_a, 135, 225))
    _ = LEFT;
if (in(_a, 225, 315))
    _ = DOWN;
if (in(_a, 45, 135))
    _ = UP;
if (in(_a+360, 315, 405))
    _ = RIGHT;

return _;
