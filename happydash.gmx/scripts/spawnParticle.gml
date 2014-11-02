var _x, _y, _color;

_x = argument0;
_y = argument1;
_color = argument2;

initParticle(_x,_y,global.particle[global.iParticle],_color);
global.iParticle = (global.iParticle + 1) mod (global.mParticle);
