var argx = argument0;
var argy = argument1;

for (var i = 0; i < 360; i += 20)
{
    var e = instance_create(argx,argy,objEffect);
    e.xVel = lengthdir_x(3,i);
    e.yVel = lengthdir_y(3,i);
    e.fSpeed = .1;
}
/*for (var i = -1; i <=1; i+= .5)
for (var j = -1; j <=1; j+= .5)
{
    if (i != j || (i != 0 && j != 0))
    {
        var e = instance_create(argx,argy,objEffect);
        e.xVel = i*1.5;
        e.yVel = j*1.5;
        e.fSpeed = .1;
    }
}*/
