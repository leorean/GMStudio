var _xv = argument0;
var _yv = argument1;

if (abs(_xv) > abs(_yv) + .2)
{
    if (_xv < .2)
        return LEFT;
    if (_xv > .2)
        return RIGHT;
}
if (abs(_xv) < abs(_yv) - .2)
{
    if (_yv < .2)
        return UP;
    if (_yv > .2)
        return DOWN;
}

return NONE;
