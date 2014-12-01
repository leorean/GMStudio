//drawText(x,y,text,color);
var a,b,t,c1,c2;

a = argument0;
b = argument1;
t = argument2;
c1 = argument3;
c2 = argument4;

draw_set_font(fntButton);
draw_set_color(c2);

draw_text(a-1,b-1,t);
draw_text(a,b-1,t);
draw_text(a+1,b-1,t);

draw_text(a-1,b,t);
draw_text(a+1,b,t);

draw_text(a-1,b+1,t);
draw_text(a,b+1,t);
draw_text(a+1,b+1,t);

draw_text(a-1,b+2,t);
draw_text(a,b+2,t);
draw_text(a+1,b+2,t);


draw_set_color(c1);

draw_text(a,b,t);
