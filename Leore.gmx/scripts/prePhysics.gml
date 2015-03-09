colL = collision_point(bbox_left-1,y,objCollider,true,true);
colR = collision_point(bbox_right+1,y,objCollider,true,true);
colD = collision_line(bbox_left+3,bbox_bottom+1,bbox_right-3,bbox_bottom+1,objCollider,true,true);
colU = collision_point(x,bbox_top-1,objCollider,true,true);
onGround = (place_meeting(x,y+1,objCollider) && colD)
    || ((place_meeting(x,y+3,objSlopeL) || place_meeting(x,y+3,objSlopeR)) && onSlope);
   
if (onGround)
    isJumped = false;