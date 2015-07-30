//++++GUI++++
display_set_gui_size(.5*window_get_width(),.5*window_get_height());
draw_set_alpha(1);
draw_set_color(c_white);

draw_set_font(fntHUD);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (instance_exists(player))
{
    for (i = 0; i < player.hp;i++)
    {
        draw_sprite_part(sprGfx,-1,15*TILE,0,TILE,TILE,i*TILE,0);
    }
    draw_set_font(global.fntSPG);
    draw_text(0,TILE,string(player.hp)+"/"+string(global.hp));
}

display_set_gui_size(surface_get_width(surf),surface_get_height(surf));
    
