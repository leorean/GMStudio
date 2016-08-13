
var _rndx = -1;
var _rndy = -1;

var _rdir = choose(LEFT,RIGHT);

if (_rdir == LEFT)
{
    while(!place_free(0, _rndy) || _rndy < 0)
    {
        _rndx = -TILE;
        _rndy = TILE + irandom(room_height-2*TILE);
    }
}
if (_rdir == RIGHT)
{
    while(!place_free(room_width-TILE, _rndy) || _rndy < 0)
    {
        _rndx = room_width;
        _rndy = TILE + irandom(room_height-2*TILE);
    }
}
instance_create(_rndx, _rndy, objNpc);
