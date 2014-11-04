//PLAYER ROUTINE

//INPUT HANDLING ...
if ((keyUpPressed || mouseLeftPressed) && jumpPerformed < 2)
{
        jumpPerformed += 1;

        if(jumpPerformed == 2)
        {
            playSound(sfxDoubleJump);
            t = instance_create(x,y,objEffectDust);
            t.type = 1;
        } else
            playSound(sfxJump);

        jumpVel = 1.2;

        yVel = -jumpVel*jumpVelMax;
        state = JUMP;
}

/*if (mouseRightPressed)
{
    if (state == ATTACK)
        state = JUMP;
    else
        state = ATTACK;
}*/

if (keyRightPressed)
    state = ATTACK;

if (keyDown)
    state = IDLE;
else if (state == IDLE)
    state = RUN;

if (state == ATTACK)
{
    if (mouseRightPressed || (mouseLeftPressed && jumpPerformed >=2))
        state = JUMP;
} else
{
    if (mouseRightPressed)
        state = ATTACK;
}

if (mouseBoth)
    state = IDLE;
/*
//swipe gesture registration
if (touchPressed && !on)
{
    onX = min(max(mouse_x,0),WIDTH);
    onY = min(max(mouse_y,0),HEIGHT);
    on = true;
}
if (touchReleased && on && !off)
{
    offX = min(max(mouse_x,0),WIDTH);
    offY = min(max(mouse_y,0),HEIGHT);
    off = true;
}

//key input
if (keyUpPressed || keyRightPressed)
{on = true; off = true}

if (touch) off = true;
//recognize gestures here:
if (on && off)
{
    offAngle = point_direction(onX,onY,offX,offY);

    //condition for vertical upward gesture: JUMPING
    if ((keyUpPressed || in(offAngle,45,45+90)) && jumpPerformed < 2)
    {
        jumpPerformed += 1;

        if(jumpPerformed == 2)
        {
            t = instance_create(x,y,objEffectDust);
            t.type = 1;
        }

        jumpVel = 1.2;

        yVel = -jumpVel*jumpVelMax;
        state = JUMP;
    }

    //condition for horizontal gesture: DASHING
    if (keyRightPressed || (in(offAngle,360-30,360) || in(offAngle,0,30)))
    {
        objPlayer.state = ATTACK;
    }
    
    //SLOW DOWN AND STOP MOVING
    //if ((touch && state != JUMP && mouse_x < WIDTH-2*TILE && mouse_y < HEIGHT-2*TILE)
    //    || (keyDown && state != JUMP))
    //    state = IDLE;

    on = false;
    off = false;
}

if (!touch)
{
    onX = -1;
    onY = -1;
    offX = -1;
    offY = -1;
}*/


//local variables && flags
cx = x+TILE*.5;
cy = y+TILE*.5;
onGround = false;

//onPlatform = state != DEAD && (collision_line(bbox_left-global.xSpeed,bbox_bottom+max(yVel,1),bbox_right-global.xSpeed,bbox_bottom+max(yVel,1),objPlatform,true,true)
//    && yVel > 0);

//if (onPlatform)
//    onGround = true;

//ENEMY INTERACTION

//DEATH
if (y+TILE > room_height || x < 0)
    alive = false;

if (!alive)
{
    //DIE IMPULSE
    if (state != DEAD)
    {
        yVel = -3;
        alarm[0] = alarm0;
        fCur = choose(0,1,2);
        playSound(sfxDie);
        repeat(50)
            spawnParticle(x+random(TILE),y+random(TILE),c_white);//make_color_hsv(246,248,103));
        t = instance_create(x,y,objEffectDust);
        t.type = 2;

        //currently does nothing
        loadProgress();
        saveProgress();
    }
    global.hasControl = false;
    state = DEAD;
}

if (state == DEAD)
{
    global.xSpeed = 0;
    if (!alarm[0])
    {
        instance_create(0,0,objGameOverMenu);
        global.gameOver = true;
        //room_restart();
    }
}
else //IF NOT DEAD
{

    //SCORE COUNTING
    //*0.0625 = 1 / TILE
    global.curScore = 10*floor(global.distance*0.0625) + global.addScore;

    //ATTACKING
    if (state == ATTACK)
    {

        if (global.timer mod 5 == 0)
        {
            playSound(sfxDash);
            t = instance_create(x-TILE*.5,y,objEffectDust);
            t.type = 3;
        }
        //.005 = 1/WIDTH*2
        xVel = 2*(1-(x*.005));
        
        yVel = 0;
        yGrav = 0;

        //dash through destroyblock

        pow = max(pow - 1, 0);
        if (pow == 0 && enemy == noone)
            state = JUMP;
    } else
    {
        //.0025 = 1/WIDTH
        pow = min(pow+2*(1-(x*.0025)),maxPow);
        yGrav = yGravDefault;
    }
        
    
    if (onGround && yVel > 0 && state != ATTACK)
    {
        combo = 0;
        y = floor(y);
        jumpPerformed = 0;
        if (state != IDLE)
            state = RUN;
    }    

    if (x > WIDTH-TILE) x = WIDTH-TILE;
/*
    if (place_free(x+ceil(global.xSpeed)+xVel,y))//!place_meeting(x+ceil(global.xSpeed) + xVel,y, objSolid))
    {
        x += xVel;

        //jump further
        if (state == JUMP)
            xVel = max(xVel,0);

        if (state != IDLE)
        {
            if (x < xO)
            {
                if (xVel < global.xSpeed)
                    xVel = min(xVel + 2*xAcc, global.xSpeed*.3); //% faster than scroll speed
            }
            else
            {
                if (xVel > 0)
                    xVel *= xFric;
        
                if (x > xO + global.xSpeed*1.5)
                    xVel = max(xVel - xAcc, -global.xSpeed*.5);//% slower than scroll speed
            }
        } else //IDLE SPEED HERE
            xVel = max(xVel - 4*xAcc, -global.xSpeed);
    } else
    {
        if (state == ATTACK)
            if (!place_meeting(x+ceil(global.xSpeed) + xVel,y, objDestroyBlock))
                state = JUMP;
        xVel = -global.xSpeed;
        x -= ceil(global.xSpeed);
    }
    */
}

//yVel += yGrav;

if (state == DEAD)
    yGrav = yGravDefault;

//yCollision();

if (statePrev == JUMP && (state == IDLE || state == RUN))
    playSound(sfxOnGround);


yVel = 0;
xVel = 0;

    
//prev/end variables
fCur = (fCur+fSpeed) mod fMax;

if (state != statePrev && state != DEAD)
    fCur = 0;

if (!global.pause)
    statePrev = state;

