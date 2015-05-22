//++++used to spawn soldiers, dwarfs++++
var se_type = argument0;
var se_numb = argument1;

for (i = 1; i < (se_numb+1); i++)
{
    var se_obj = instance_create(WIDTH/2,-2*TILE,se_type);
    se_obj.tx = i/(se_numb+1)*WIDTH;
    se_obj.x = se_obj.x;
    se_obj.ty = HEIGHT/2+3*TILE*sign(i%2==0 && se_numb>2);
    
}
