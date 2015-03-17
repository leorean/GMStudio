var xx = floor(argument0);
var yy = floor(argument1);
var txt = argument2;
var c1 = argument3;
var c2 = argument4;

draw_set_color(c2);
for (var i = -1; i<2; i++)
for (var j = -1; j<3; j++)
{
    draw_text(xx+i,yy+j,txt);
}

draw_set_color(c1);

draw_text(xx,yy,txt);

draw_set_color(c_white);
