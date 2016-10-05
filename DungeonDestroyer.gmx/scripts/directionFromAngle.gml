var _a = argument0 % 360;

var _ = NONE;

if (in(_a, 135, 225))
    _ = LEFT;
if (in(_a, 225, 315))
    _ = DOWN;
if (in(_a, 45, 135))
    _ = UP;
if (in(_a, 315, 360) || in(_a, 0, 45))
    _ = RIGHT;

return _;
