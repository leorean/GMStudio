for (i = 0; i <= maxIndex; i+=1)
    {
        if (btn[i].active)
            index = i;
    }    
if(keyboard_check_pressed(vk_down) || keyboard_check_pressed(vk_right))
{
    global.mouseVisible = false;
    index = min(index+1,maxIndex);
}

if(keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_left))
{
    global.mouseVisible = false;
    index = max(index-1,0);
}
