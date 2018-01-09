with(argument0)
{
    if (in(phy_position_x, view_xview - 128, view_xview + view_wview + 128) && in(phy_position_y, view_yview - 128, view_yview + view_hview + 128))
        visible = true;
    else
        visible = false;
}

