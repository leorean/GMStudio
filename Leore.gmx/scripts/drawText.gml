var px,py,txt,col1,col2,fnt;

px = round(argument0);
py = round(argument1);
txt = argument2;
col1 = argument3;
col2 = argument4;
fnt = argument5;

draw_set_font(fnt);

if (col2 != c_none)
{
    draw_set_color(col2);
    
    draw_text(px-1,py-1,txt);
    draw_text(px,py-1,txt);
    draw_text(px+1,py-1,txt);
    
    draw_text(px-1,py,txt);
    draw_text(px+1,py,txt);
    
    draw_text(px-1,py+1,txt);
    draw_text(px,py+1,txt);
    draw_text(px+1,py+1,txt);
    
    draw_text(px-1,py+2,txt);
    draw_text(px,py+2,txt);
    draw_text(px+1,py+2,txt);
}

draw_set_color(col1);

draw_text(floor(px),floor(py),txt);