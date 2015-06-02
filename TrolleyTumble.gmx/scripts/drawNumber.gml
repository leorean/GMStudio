var fnt_text = string(argument0);
var fnt_x = argument1;
var fnt_y = argument2;
var fnt_align = argument3; //align text left, right, centered
var fnt_size = argument4; //1...3?

var fnt_color = c_white;
var fnt_alpha = 1;

if (argument_count==7)
{
    fnt_color = argument5;
    fnt_alpha = argument6;
}

var fnt_nx = fnt_x;//x for each char

var fnt_w,fnt_h,fnt_o,fnt_d;
var fnt_length = string_length(fnt_text);

fnt_w = .5*TILE;
fnt_h = TILE;

for (i = 0; i < fnt_length; i++)
{
    switch (string_char_at(fnt_text,i+1))
    {
        case "m":
            fnt_d = 10;
        break;
        case "x":
            fnt_d = 11;
        break;
        case "-":
            fnt_d = 12;
        break;
        case "+":
            fnt_d = 13;
        break;
        case "%":
            fnt_d = 14;
        break;
        default:
            fnt_d = real(string_char_at(fnt_text,i+1));
        break;
    }
        
    switch(fnt_align)
    {
        case fa_left:
            fnt_nx = fnt_x + i*fnt_w*fnt_size;
        break;
        case fa_middle:
            fnt_nx = fnt_x + (i-fnt_length/2)*fnt_w*fnt_size;
        break;
        case fa_right:
            fnt_nx = fnt_x + (i-fnt_length)*fnt_w*fnt_size;
        break;
    }
    draw_sprite_part_ext(sprFontNumbers,-1,fnt_d*fnt_w,0,fnt_w,fnt_h,fnt_nx,fnt_y,fnt_size,fnt_size,fnt_color,fnt_alpha);
}
