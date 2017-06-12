var str = argument0;
var objects = string_split(argument0, ";");

for (i = 0; i < array_length_1d(objects); i++)
{
    var p = string_split(objects[i], ",");
    
    var obj = instance_create(0, 0, objObstacle);
    obj.type = real(p[0]);
    obj.vel = real(p[1]);
    obj.angle = real(p[2]);
    obj.dist = real(p[3]);
    
    /*for(i = 0; i < string_length(str); i++)
    {
        
    }*/
}
