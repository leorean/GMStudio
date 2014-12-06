var e,a,b,o;
a = argument0;
b = argument1;
o = argument2;

e = instance_create(a,b,objEffectDust);
e.type = o;
e.depth = depth-1;
e.xVel = -1+random(2);
e.yVel = -1+random(2);
