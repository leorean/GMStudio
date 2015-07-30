//double nullstellensucher(double v0, double g, double alpha1, double alpha2, double x1, double y1, double x0, double y0)
var v0 = argument0;
var g = argument1;
var alpha1 = argument2;
var alpha2 = argument3;
var x1 = argument4;
var y1 = argument5;
var x0 = argument6;
var y0 = argument7;

var alpha=alpha1;
var alpha_1=alpha1;
var alpha_2=alpha2;
//bisektion, regula falsi
var i;
var maxi=1000;    //maximale iterationsanzahl
var f, f1, f2;
for(i=0; i<maxi; i++)
{
    f1=funktion(v0,g,alpha_1,x1,y1,x0,y0);
    f2=funktion(v0,g,alpha_2,x1,y1,x0,y0);
    alpha = alpha_1 - ((alpha_2 - alpha_1)/(f2 - f1)) * f1;
    f=funktion(v0,g,alpha,x1,y1,x0,y0);
    if((power(f,2)) < 0.001) break;  //abbruchkriterium
    else{
        if(((f1<0)&&(f2<0))||((f1>0)&&(f2<0))){     //neuen punkt waehlen
            alpha_1 = alpha;
        }
        else{
            alpha_2 = alpha;
        }
    }
}
if (i == maxi) return 0;
else return alpha;


