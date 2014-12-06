var e,a,b;
a = argument0;
b = argument1;

e = instance_create(a,b,objEffectDust);
e.type = 3;
e.depth = depth-1;
e.xVel = -1+random(2);
e.yVel = -1+random(2);
