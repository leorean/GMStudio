//level, vit, str, dex, luk
var _level = argument0;
var _vit = argument1;
var _str = argument2;
var _dex = argument3;
var _luk = argument4;

global.maxHp = (30 + 13 * _vit) + (5 * (_vit div 3));
global.hp = global.maxHp;
global.dmg = 3 + (2 * _str) + (4 * (_str div 5)) + (5 * (_str div 8));
global.critDmg = 1.5 + (_luk * .1);
global.dodge = 0 + log2(_dex) * .3 + log2(_dex div 5) * .2 + log2(_dex div 10) * .2;
global.def = _level;
global.level = _level;
