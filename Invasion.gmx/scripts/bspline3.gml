/*
**  Usage:
**      bspline3(t,nknots,knotarray)
**
**  Arguments:
**      t            interval [0 to 1], real
**      nknots       number of points in the spline, real
**      knotarray    name of a local array [0 to nknots-1], string
**
**  Returns:
**      if (t) is 0, returns knot[0], if (t) is 1, returns knot[nknots-1],
**      for other values of (t), interpolates smoothly between knot[0]
**      to knot[nknots-1]. Because the spline is a quadratic polynomial,
**      there must be at least three knots.
**
*/
{
    var t,nknots,knotarray,nspans,span,knot,c2,c1,c0;
    t = argument0;
    nknots = argument1;
    knotarray = argument2;
    nspans = nknots;
    if (nspans < 2) return 0; // ERROR: too few knots
    t = median(0,t,1) * nspans;
    span = floor(t);
    if (span >= nknots - 1) span = nknots - 1;
    t -= span;
    knot[0] = knotarray[max(0,span-1)];//variable_local_array_get(knotarray,max(0,span-1));
    knot[1] = knotarray[span];//variable_local_array_get(knotarray,span);
    knot[2] = knotarray[min(nknots-1,span+1)];//variable_local_array_get(knotarray,min(nknots-1,span+1));
    c2 = knot[0] - 2 * knot[1] + knot[2];
    c1 = 2 * knot[1] - 2 * knot[0];
    c0 = knot[0] + knot[1];
    return 0.5 * ((c2 * t + c1) * t + c0);
}