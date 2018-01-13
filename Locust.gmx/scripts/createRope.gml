var lastRope = noone;
var nextRope = instance_create(x, y, objRope);
var joint = physics_joint_revolute_create(id, nextRope, x, y, 0, 0, 0, 0, 0, 0, false);

var damp = 1;
var fq = 30;

physics_joint_set_value(joint, phy_joint_damping_ratio, damp);
physics_joint_set_value(joint, phy_joint_frequency, fq);

nextRope.parent = id;

repeat(argument0)
{
    offy += 16;
    lastRope = nextRope;
    nextRope = instance_create(x, y+offy, objRope);
    
    joint = physics_joint_distance_create(lastRope, nextRope, lastRope.x, lastRope.y, nextRope.x, nextRope.y, false);        
    physics_joint_set_value(joint, phy_joint_damping_ratio, damp);
    physics_joint_set_value(joint, phy_joint_frequency, fq);

    nextRope.parent = lastRope;
    
    if (!instance_exists(target))
    for(var i = 0; i < instance_number(objMovable); i++)
    {
        var t = instance_find(objMovable, i);
        if(physics_test_overlap(nextRope.x, nextRope.y, phy_rotation, t))
        {
            target = t;                                
            break;
        }
    }
    if (instance_exists(target))
    {
        var dstx = (nextRope.x - target.x);
        var dsty = (nextRope.y - target.y);

        joint = physics_joint_distance_create(nextRope, target, nextRope.x, nextRope.y, target.x + dstx, target.y + dsty, false);
        physics_joint_set_value(joint, phy_joint_damping_ratio, damp);
        physics_joint_set_value(joint, phy_joint_frequency, fq);
        break;
    }
}
