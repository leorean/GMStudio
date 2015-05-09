//////////////// Circulair movement script ////////////////////
//
// Copyright Simon Donkers 27-1-2005
// www.simondonkers.com - gmmentor@simondonkers.com
//
// A script to make an object move in a perfect circle
// argument0 is x coordinate of center
// argument1 is y coordinate of center
// argument2 is radius of circle
// argument3 is angular speed. Positive is
// clockwise, negative counterclockwise
// This is the corner to turn a step. For instance
// 5 means it will turn around in 360/5 = 72 steps
// This script requires GM 5.1 or higher
//
/////////////////////////////////////////////////////
dir_now := point_direction(argument0,argument1,x,y);
dir_new := (dir_now + argument3 + 360)mod(360);
x := lengthdir_x(argument2,dir_new) + argument0;
y := lengthdir_y(argument2,dir_new) + argument1;