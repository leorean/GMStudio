var a,b,n,r, color;

r = 3;
w = choose(1,2);
n = max(
    max(abs(argument0-argument2),abs(argument1-argument3)) div 4
    , 3);

a[0] = argument0;
b[0] = argument1;
a[n] = argument2;
b[n] = argument3;
color = argument4;

for (i = 1; i <= n; i+=1)
{
    a[i] = a[0] + i/n*(a[n]-a[0]) - r + random(2*r);
    b[i] = b[0] + i/n*(b[n]-b[0]) - r + random(2*r);

    draw_set_color(color);    
    draw_line_width(a[i-1],b[i-1],a[i],b[i],w);
    
}

draw_set_color(c_white);
