offset_y = 0;
host = self;
next_rope = instance_create(x,y + offset_y, objRope);

attach = physics_joint_distance_create(host,next_rope,host.x,host.y,next_rope.x,next_rope.y,false);

with (next_rope)
{
    parent = other.id;
}
