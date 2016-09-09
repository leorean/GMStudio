
var _rnds =  -1;
var _spwn =  noone;

while (!instance_exists(_spwn))
{
    _rnds = irandom(instance_number(objSpawn));
    _spwn = instance_find(objSpawn, _rnds);
}

var _spwnp = instance_create(_spwn.x - lengthdir_x(TILE,_spwn.angle),
    _spwn.y - lengthdir_y(TILE,_spwn.angle), objNpc);
_spwnp.angle = _spwn.angle;

// calculate if npc should be protector, and which type

if (securityCount > global.kills)
{
    //var chance = 1 / max(levelPopulation - global.kills, 1);
    
    //show_debug_message(chance);
    
    if(true)//if (random(100) < chance*100)
    {
        // decide type
        var _i = 0;
        while (levelSecurity[_i] <= 0)
        {
            _i = irandom(array_length_1d(levelSecurity) - 1);
        }

        _spwnp.violent = true;
        _spwnp.type = _i;
        _spwnp.hp = global.npcHp * (_i+1) * 1.5;
        levelSecurity[_i]--;
        securityCount--;
        
        show_debug_message(securityCount);
    }
}
