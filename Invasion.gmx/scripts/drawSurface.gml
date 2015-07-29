/*draw_zoomed_surface(x,y,surface,scale)

   0 - the centered x location to draw the surface
   1 - the centered y location to draw the surface
   2 - the surface to draw
   3 and 4 - the scale to draw the surface (1 = normal scale)
*/
var xoffset = (surface_get_width(argument2)*argument3)/2;
var yoffset = (surface_get_height(argument2)*argument4)/2;

//var xoffset = (window_get_width()*argument3)/2;
//var yoffset = (window_get_height()*argument4)/2;

draw_surface_ext(argument2,argument0-xoffset,argument1-yoffset,argument3,argument4,0,c_white,1);
