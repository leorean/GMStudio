//drawText(x,y,text,color);
var px,py,txt,col1,col2,fnt,wdh;

px = argument0;
py = argument1;
txt = argument2;
col1 = argument3;
col2 = argument4;
fnt = argument5;
wdh = argument6;

draw_set_font(fnt);

if (col2 != c_none)
{
    draw_set_color(col2);
    
    draw_text_ext(px-1,py-1,txt,-1,wdh);
    draw_text_ext(px,py-1,txt,-1,wdh);
    draw_text_ext(px+1,py-1,txt,-1,wdh);
    
    draw_text_ext(px-1,py,txt,-1,wdh);
    draw_text_ext(px+1,py,txt,-1,wdh);
    
    draw_text_ext(px-1,py+1,txt,-1,wdh);
    draw_text_ext(px,py+1,txt,-1,wdh);
    draw_text_ext(px+1,py+1,txt,-1,wdh);
    
    draw_text_ext(px-1,py+2,txt,-1,wdh);
    draw_text_ext(px,py+2,txt,-1,wdh);
    draw_text_ext(px+1,py+2,txt,-1,wdh);
}

draw_set_color(col1);

draw_text_ext(floor(px),floor(py),txt,-1,wdh);
