/*

This isn't code, it's my way of adding a readMe file.

So you're probably wondering "why don't we just use a 
sprite that is just a blue circle in png format with no
black border?".

Good question. So if you create a 16x16 circle sprite 
(any color will work), and remove the blending that I 
set in the draw event of obj_water, you'll notice that
when the water groups up you can see a black outline 
around each and every single "water drop". Go ahead, test it.
This is caused by your graphics card, and I won't go into 
great detail on why this happens, but basically the
graphics card is making up colors to compensate for something
that isn't there.

You can also make your water seem more realistic by making the 
sprite smaller, but don't forget to change the radius in obj_water.

I thoroughly commented what everything in obj_water does,
but if you have any questions feel free to ask at:

gmlwaffle.proboards.com

Enjoy!

*/
