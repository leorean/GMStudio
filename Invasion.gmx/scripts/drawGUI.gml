//++++GUI++++

draw_set_alpha(1);
draw_set_color(c_white);

draw_set_font(global.fntHudTiny);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text(0,HEIGHT,fps);


if (instance_exists(player))
{
    for (i = 0; i < player.hp;i++)
    {
        draw_sprite_part(sprGfx,-1,15*TILE,0,TILE,TILE,i*TILE,0);
    }
}

draw_set_font(global.fntHudSmall);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(WIDTH,HEIGHT,"$: "+string(global.coins));

//+++++
//display_set_gui_size(surface_get_width(surf),surface_get_height(surf));
    
