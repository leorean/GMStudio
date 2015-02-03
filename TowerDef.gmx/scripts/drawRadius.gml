var a,b,c,d;
a = argument0;
b = argument1;
c = argument2;
d = argument3;

draw_set_color(d);

draw_set_alpha(.3);
draw_circle(a,b,c-.5,1);
draw_circle(a,b,c+.5,1);

draw_set_alpha(1);
draw_circle(a,b,c,1);

