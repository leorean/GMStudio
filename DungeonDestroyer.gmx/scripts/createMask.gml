_msk = sprite_duplicate(argument0);
sprite_delete(argument0);

sprite_collision_mask(_msk, -argument1/2, argument1/2, 0, 2, 0, TILE, 1, 0);
mask_index = _msk;
return _msk;
