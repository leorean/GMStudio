if ((bbox_left < argument2.bbox_right-argument0 
    && bbox_right > argument2.bbox_left-argument0)
    || (bbox_top < argument2.bbox_bottom-argument1 
    && bbox_bottom > argument2.bbox_top-argument1))
        return true;
else
    return false;