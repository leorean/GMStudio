if (!instance_exists(weapon))
{
    weapon = instance_create(x+sign(dir)*5,y,objWeapon);
    weapon.phy_rotation = 0;
}

weapon.phy_position_x = phy_position_x+sign(dir)*5;
weapon.dir = dir;
if (joint != -1)
    physics_joint_delete(joint);
joint = physics_joint_revolute_create(self,weapon,x+sign(dir)*5,y,-120,120,false,0,0,false,true);

