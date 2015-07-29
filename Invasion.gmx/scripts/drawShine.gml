draw_set_blend_mode(bm_add);
var s,var ss;
ss=argument2;
s=ss*1.2;draw_sprite_part_ext(sprGfx,-1,15*TILE,TILE,4*TILE,4*TILE,argument0-2*s*TILE,argument1-2*s*TILE,s,s,c_white,.05);
s=ss*.9;draw_sprite_part_ext(sprGfx,-1,15*TILE,TILE,4*TILE,4*TILE,argument0-2*s*TILE,argument1-2*s*TILE,s,s,c_white,.05);
s=ss*.8;draw_sprite_part_ext(sprGfx,-1,15*TILE,TILE,4*TILE,4*TILE,argument0-2*s*TILE,argument1-2*s*TILE,s,s,c_white,.1);
s=ss*.65;draw_sprite_part_ext(sprGfx,-1,15*TILE,TILE,4*TILE,4*TILE,argument0-2*s*TILE,argument1-2*s*TILE,s,s,c_white,.2);

draw_set_blend_mode(bm_normal);

