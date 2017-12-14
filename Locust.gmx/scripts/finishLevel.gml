// 1 == L1, and so on..
global.level = max(global.level, argument0);

// index starts with 0, so - 1
var entry = ds_list_find_value(global.levels, argument0 - 1);
entry[3] = max(entry[3], global.stars);
ds_list_replace(global.levels, argument0 - 1, entry);

