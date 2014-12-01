//drawText(x,y,text,color);
_x = argument0;
_y = argument1;
_t = argument2;
_c1 = argument3;
_c2 = argument4;

draw_set_font(fntButton);
draw_set_color(_c2);

draw_text(_x-1,_y-1,_t);
draw_text(_x,_y-1,_t);
draw_text(_x+1,_y-1,_t);

draw_text(_x-1,_y,_t);
//draw_text(_x,_y,_t);
draw_text(_x+1,_y,_t);

draw_text(_x-1,_y+1,_t);
draw_text(_x,_y+1,_t);
draw_text(_x+1,_y+1,_t);

draw_text(_x-1,_y+2,_t);
draw_text(_x,_y+2,_t);
draw_text(_x+1,_y+2,_t);


draw_set_color(_c1);

draw_text(_x,_y,_t);

