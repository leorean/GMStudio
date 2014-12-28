with(objRope)
    instance_destroy();
physics_joint_delete(joint);
joint = -1;
rope = noone;
ropeOrig = noone;
canThrowRope = true;
ropeCount = 0;
attached = false;

