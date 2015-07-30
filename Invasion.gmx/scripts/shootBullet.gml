var alpha1_rad;
var alpha2_rad;
var x0 = argument0;
var y0 = argument1;
var x1 = argument2;
var y1 = argument3;
var v0 = argument4;         //meter pro sec
var g = argument5;//9.81;         //meter pro sec^2
var alpha;
alpha1_rad = arctan2((y1-y0),(x1-x0));       //1. startwert fuer winkel (1. wert wurde so gewaelt dass bei v0 --> unendlich das ziel erreicht wird)
alpha2_rad = alpha1_rad + pi/8;       //2. startwert fuer winkel wurde deutlich groesser als der 1. gewaehlt

var stop = 0;
for(var k=0; (stop <1) && (k < 40); k++){         //40 inkremente (erhoehung von v0) als abbruchkriterium
    alpha = nullstellensucher(v0, g, alpha1_rad, alpha2_rad, x1, y1, x0, y0);   //gleichungsloeser fuer alpha
    if (alpha == 0) v0 = v0 + 0.1;          //wenn v0 zu klein gewaehlt (ziel nicht erreichbar), erhoehe v0 um 0.1
    else stop = 1;
}

proj = instance_create(x0,y0,objPlayerProjectile);
proj.alpha = alpha;
proj.xVel = lengthdir_x(v0,alpha);
proj.yVel = lengthdir_y(v0,alpha);
proj.yGrav = g;

