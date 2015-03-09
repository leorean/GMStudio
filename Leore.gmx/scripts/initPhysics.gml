colL = false;
colR = false;
colU = false;
colD = false;
onSlope = false;
onGround = false;
w = abs(sprite_get_bbox_right(sprite_index)-sprite_get_bbox_left(sprite_index));
h = abs(sprite_get_bbox_bottom(sprite_index)-sprite_get_bbox_top(sprite_index));