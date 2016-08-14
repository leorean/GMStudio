
var _rnds =  -1;
var _spwn =  noone;

while (!instance_exists(_spwn))
{
    _rnds = irandom(instance_number(objSpawn));
    _spwn = instance_find(objSpawn, _rnds);
}

var _spwnp = instance_create(_spwn.x - lengthdir_x(TILE,_spwn.angle),
    _spwn.y - lengthdir_y(TILE,_spwn.angle), objNpc);
_spwnp.angle = _spwn.angle;
