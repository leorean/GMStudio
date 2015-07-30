//double funktion(double v0, double g, double alpha, double x1, double y1, double x0, double y0)
var v0 = argument0;
var g = argument1;
var alpha = argument2;
var x1 = argument3;
var y1 = argument4;
var x0 = argument5;
var y0 = argument6;

var f;
f = power(v0,2) * (2*(y1-y0)*power((cos(alpha)), 2) - sin(2*alpha) * (x1-x0))+g*power((x1-x0), 2);
return f;

