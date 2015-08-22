cx = view_xview[0] + offx;
cy = view_yview[0] + offy;
x = cx;
y = cy;

for (var i = 0; i < 5; i++)
    if(in(device_mouse_x_to_gui(i)+view_xview[0],0,WIDTH/2+view_xview[0]))//if (in(device_mouse_x(i),bbox_left,bbox_right)&&in(device_mouse_y(i),bbox_top,bbox_bottom))
        if(device_mouse_check_button(i,mb_left))
        {
            dev = i;
        }
    
if (!device_mouse_check_button(dev,mb_left))
    dev = -1;

kLeft = false;
kRight = false;
kUp = false;
kDown = false;

    
if (dev>-1)
{
    if (offx == -1000 && offy == -1000)
    {
        offx = device_mouse_x_to_gui(dev);//-view_xview[0];
        offy = device_mouse_y_to_gui(dev);//-view_yview[0];
    }
    var angle = point_direction(cx,cy,device_mouse_x_to_gui(dev)+view_xview[0],device_mouse_y_to_gui(dev)+view_yview[0]);
    var rad_angle = ((angle / 180) * pi);
        
    sx = cx + (cos(rad_angle)) * min(abs(cx-device_mouse_x_to_gui(dev)-view_xview[0]),radius);
    sy = cy -(sin(rad_angle)) * min(abs(cy-device_mouse_y_to_gui(dev)-view_yview[0]),radius);
    
    if (in(angle,315,360) || in(angle,0,45))
        kRight = true;
        
    if (in(angle,45,135))
        kUp = true;
        
    if (in(angle,135,225))
        kLeft = true;
        
    if (in(angle,225,315))
        kDown = true;

    //diagonal
        //if (in(angle,30,60) || in(angle,120,150) || in(angle,210,240) || in(angle,300,330))
    //    diag = true;
    if (in(angle,30,60))
        {kRight = true;kUp = true}
    if (in(angle,120,150))
        {kLeft = true;kUp = true}
    if (in(angle,210,240))
        {kLeft = true;kDown = true}
    if (in(angle,300,330))
        {kRight = true;kDown = true}

    
} else //feather back
{
    offx = -1000;
    offy = -1000;
    sx -= (sx - cx) / 4;
    sy -= (sy - cy) / 4;
}

forceX = min(abs(cx - sx) / (radius-.5*TILE),1);
forceY = min(abs(cy - sy) / (radius-.5*TILE),1);

draw_text(x,y,forceX);
