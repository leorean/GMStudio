pressed = false;
pressing = false;
delay = max(delay-1,0);
for (i = 0; i < 5; i++)
{
    if (in(device_mouse_x(i),cx-w/2,cx+w/2) && in(device_mouse_y(i),cy-h/2,cy+h/2))
    {
        if (device_mouse_check_button(i,mb_left))
        {
            pressing = true;
            if (!delay)
            {
                pressed = true;
                delay = maxDelay;
            }
            break;
        } else
        {
            pressing = false;
            pressed = false;
            delay = 0;            
        }
    } else
    {
        if (pressing && !device_mouse_check_button(i,mb_left))
            delay = 0;            
    }
}