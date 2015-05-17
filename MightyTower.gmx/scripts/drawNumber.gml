var fnt_text = string(argument0);
var fnt_x = argument1;
var fnt_y = argument2;
var fnt_align = argument3; //align text left, right, centered
var fnt_size = argument4; //fnt_big, fnt_small

var fnt_nx = fnt_x;//x for each char

var fnt_w,fnt_h,fnt_o;
var fnt_length = string_length(fnt_text);

if (fnt_size == fnt_big)
{
    fnt_w = TILE;
    fnt_h = 2*TILE;
    fnt_o = 4*TILE;
}
if (fnt_size == fnt_small)
{
    fnt_w = .5*TILE;
    fnt_h = TILE;
    fnt_o = 6*TILE;
}

for (i = 0; i < fnt_length; i++)
{
    dg = real(string_char_at(fnt_text,i+1));
    if (string_char_at(fnt_text,i+1) == "s" || string_char_at(fnt_text,i+1) == "m")
        dg = 10;
    
    switch(fnt_align)
    {
        case fa_left:
            fnt_nx = i*fnt_w;
        break;
        case fa_middle:
            fnt_nx = fnt_x + (i-fnt_length/2)*fnt_w;
        break;
        case fa_right:
            fnt_nx = fnt_x + (i-fnt_length)*fnt_w;
        break;
    }
    draw_sprite_part(sprGraphics,-1,19*TILE+dg*fnt_w,fnt_o,fnt_w,fnt_h,fnt_nx,fnt_y);
}
