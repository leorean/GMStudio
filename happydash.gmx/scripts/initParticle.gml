var _obj;
_obj = argument2;

_obj.active = true;
_obj.depth = PLAYERDEPTH-1;
_obj.xVel = -2+random(4);
_obj.yVel = -3+random(2);
_obj.yGrav = .1;
_obj.size = 1+random(1);
_obj.alarm[0] = 2*FPS;
_obj.color = argument3;
_obj.x = argument0;
_obj.y = argument1;


