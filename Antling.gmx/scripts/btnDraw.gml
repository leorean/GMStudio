a = view_xview[0];
b = view_yview[0];

cx = a + offX; cy = b + offY;

x = cx;
y = cy;

//bg:
draw_sprite_part_ext(sprGfx,-1,10*TILE,6*TILE,3*TILE,3*TILE,cx-w/2,cy-h/2+pressing,1,1,c_white,.2+pressing*.2)

//shadow:
draw_sprite_part_ext(sprGfx,-1,10*TILE+argument0*3*TILE,3*TILE,3*TILE,3*TILE,cx-w/2,cy-h/2+1,1,1,c_black,.3);
//btn:
draw_sprite_part_ext(sprGfx,-1,10*TILE+argument0*3*TILE,3*TILE,3*TILE,3*TILE,cx-w/2,cy-h/2+pressing,1,1,c_white,1);

