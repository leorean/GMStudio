if (!ballSpeedAdjusted)
{
    combo++;
    var t = instance_create(argument0.x + 16, argument0.y + 16, objText);

    var _v;
    if (argument0.hp == 0)
        _v = 50;
    else
        _v = 15;
        
    t.text = string(_v * combo);
    
    score += combo * _v;
    
    t.size = 1.5;// + min(combo div 10, 4);    
}
