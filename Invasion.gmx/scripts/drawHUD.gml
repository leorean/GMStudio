//++++GUI++++

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_font(global.fntHudTiny);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(0,HEIGHT,fps);

//++++draw HP++++
for (i = 0; i < global.maxHp;i++)
    draw_sprite_part(sprGfx,-1,16*TILE,0,TILE,TILE,i*TILE,0);
for (i = 0; i < global.hp;i++)
    draw_sprite_part(sprGfx,-1,15*TILE,0,TILE,TILE,i*TILE,0);

//draw_sprite_part(sprGfx,-1,15*TILE,0,6*TILE,TILE,-.5*TILE,0);
//draw_sprite_part(sprGfx,-1,16*TILE,TILE,4*TILE*(global.hp/global.maxHp),TILE,.5*TILE,0);

draw_set_font(global.fntHudSmall);
draw_set_halign(fa_right);draw_set_valign(fa_top);
draw_text(WIDTH,0,"$: "+string(global.coins));

//+++++
//display_set_gui_size(surface_get_width(surf),surface_get_height(surf));
    
