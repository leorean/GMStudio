var t = instance_create(argument0.x + 8, argument0.y - 8, objText);
t.text = argument1;

if (argument0.onGround)
{
    argument0.xVel = sign(argument0.x - x) * .5;
    argument0.yVel = -.5;
}
argument0.hp = max(argument0.hp - argument1, 0);
