with(objPencilOverlay) instance_destroy();
for (var _i = -32; _i < 32; _i+= 8)
for (var _j = -40; _j < 32; _j+= 8)
{
    instance_create(x + WIDTH/2 + _i, y + HEIGHT/2 + _j, objPencilOverlay);
}

/*repeat(100)
{
    instance_create(x + WIDTH/2 - 32 + random(64),
        y + HEIGHT/2 - 32 + random(64), objPencilOverlay);
}*/
