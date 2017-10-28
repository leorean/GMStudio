var _x = argument0; var _y = argument1;

if (ds_grid_get(global.B1, _x, _y) == noone || ds_grid_get(global.B2, _x, _y) != 0) exit;

ds_grid_set(global.B2, _x, _y, 1);

if (_x - 1 >= 0) markBlock(_x-1, _y);
if (_x + 1 <= ds_grid_width(global.B2) - 1) markBlock(_x+1, _y);
if (_y - 1 >= 0) markBlock(_x, _y-1);
if (_y + 1 <= ds_grid_height(global.B2) - 1) markBlock(_x, _y+1);

