if (invincible && alive)
{
    draw_sprite_part(sprGraphics,-1,0,4*TILE,2*TILE,TILE/2,argument0,argument1);
    draw_sprite_part(sprGraphics,-1,0,4.5*TILE,2*TILE*(hp/maxHp),TILE/2,argument0,argument1);    
}
