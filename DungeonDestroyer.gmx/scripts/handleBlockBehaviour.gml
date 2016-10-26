if (!ballSpeedAdjusted)
{
    ballSpd = min(ballSpd + .02, 5);
    
    combo++;
    var t = instance_create(x, y, objText);
    t.text = combo * 100;                
    score += combo * 100;
}
