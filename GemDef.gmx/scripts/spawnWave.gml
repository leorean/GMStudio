var i = 0;
var _ = -4*TILE;

/*var _count = 15 + (argument0 div 2) * 5 + (argument0 div 3) * 8;
var _leader = argument0;

for (i = 0; i < _count; i++)
{
    var type = min(i div 20, 3);
    ds_queue_enqueue(global.enemyQueue, array(type, _leader));
    _leader = -1;
}
*/

var _leader = argument0 + 1;
var _wave = global.waves[argument0];
for (i = 0; i < array_length_1d(_wave); i++)
{    
    ds_queue_enqueue(global.enemyQueue, array(_wave[i], _leader));
    _leader = -1;
}
/*
var _leader = argument0;
var type = 4;
ds_queue_enqueue(global.enemyQueue, array(type, _leader));
_leader = -1;
*/

