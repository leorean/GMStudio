//level, vit, str, dex, luk
var _level = argument0;
var _vit = argument1;
var _str = argument2;
var _dex = argument3;
var _luk = argument4;

objPlayer.maxHp = (30 + 13 * _vit) + (5 * (_vit div 3));
objPlayer.hp = objPlayer.maxHp;
objPlayer.dmg = 3 + (2 * _str) + (4 * (_str div 5)) + (5 * (_str div 8));
objPlayer.critDmg = 1.5 + (_luk * .1);
objPlayer.dodge = 0 + log2(_dex) * .3 + log2(_dex div 5) * .2 + log2(_dex div 10) * .2;
objPlayer.def = _level;
objPlayer.level = _level;
