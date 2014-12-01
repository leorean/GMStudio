//PLAYER ROUTINE

//INPUT HANDLING
if (true)
{
    if (keyUpPressed)
    {
        performJump();
    }
    
    if (keyDown)
        state = IDLE;
    else if (state == IDLE)
        state = RUN;
    
    if (keyRightPressed)
    {
        if (state == ATTACK)
            state = JUMP;
        else
            state = ATTACK;
    }
}

//local variables && flags
cx = x+TILE*.5;
cy = y+TILE*.5;
if (yVel >= 0)
    onGround = place_meeting(x-2-global.xSpeed,y+max(1,yVel),objAny);//position_meeting(x-global.xSpeed,y+max(1,yVel),objSolid);//place_meeting(x-global.xSpeed,y+max(1,yVel),objSolid);
else
    onGround = false;

//ENEMY INTERACTION
if(state != DEAD)
    enemy = instance_place(x+xVel,y+yVel,objEnemy);
else
    enemy = noone;
if (instance_exists(enemy))
if(in(x,enemy.x-TILE,enemy.x+TILE)) //just to be safe..
{
    //enemies who are not killable
    if (real(object_get_parent(enemy.object_index)) != real(objLivingEnemy))
    {
        if (enemy.state != DEAD)
        {
            if (global.powerUp != POW_3)//player ain't invincible
                alive = false;
            else
            {
                with (enemy)
                {
                    instance_create(x,y,objEffectDust);
                    playSound(sfxDestroyBlock,1);
                    instance_destroy();
                }
            }
        }
    } else //enemies who are killable
    {
        if (enemy.alive)
        {
            if (state == ATTACK || (yVel <= 0 && y > enemy.y) || (y < enemy.y))
            {
                //jump on enemies
                if (state != ATTACK)
                {
                    //if (yVel >= 0 || y < enemy.y)
                    yVel = min(yVel,-3);
                    //xVel = 0;
                    state = JUMP;
                }
    
                jumpPerformed = 0;
    
                killEnemy(enemy);
            }
            if (enemy.state != DEAD)
            {
                if (global.powerUp != POW_3)
                    alive = false;
                else
                    killEnemy(enemy);
            }
        }
    }

}

//DEATH
if (y+TILE > HEIGHT+1.5*TILE || x < 0)
    alive = false;

if (!alive)
{
    //DIE IMPULSE
    if (state != DEAD)
    {
        yVel = -3;
        alarm[0] = alarm0;
        fCur = choose(0,1,2);
        playSound(sfxDie,1);
        repeat(50)
            spawnParticle(x+random(TILE),y+random(TILE),COLOR_FLESH);
        t = instance_create(x,y,objEffectDust);
        t.type = 2;

        saveProgress();
        loadProgress();
    }
    global.hasControl = false;
    state = DEAD;
}

if (state == DEAD && !global.gameOver)
{
    global.xSpeed = 0;
    if (!alarm[0])
    {
        if (!instance_exists(objGameOverMenu))
            instance_create(0,0,objGameOverMenu);
        global.gameOver = true;
    }
}
else //IF NOT DEAD
{

    //COLLECT COINS
        //collectCoin();
    
    //DESTROY BLOCKS BY JUMPING
    destroyBlock = instance_place(x,y-5/*max(3,abs(1.5*yVel))*/,objDestroyBlock);
    if (instance_exists(destroyBlock) && state != RUN)
    {
        destroyBlock.state = DEAD;
        doCombo();
    }

    //SCORE COUNTING
    //*0.0625 = 1 / TILE
    global.curScore = 10*floor(global.distance*0.0625) + global.addScore;

    //POWER UP no. 4 (shooting)
    if (global.powerUp == POW_4)
    {
        if (global.timer mod 10 == 0)
            instance_create(cx,cy,objProjectilePlayer1);
    }
    
    //ATTACKING
    if (state == ATTACK)
    {

        if (global.timer mod 5 == 0)
        {
            playSound(sfxDash,1);//1+random(.2));
            t = instance_create(x/*-TILE*.5*/,y,objEffectDust);
            t.depth = depth+1;
            t.type = 3;
        }
        //.005 = 1/WIDTH*2
        xVel = 2*(1-(x*.005));
        
        yVel = 0;
        yGrav = 0;

        //dash through destroyblock
        db = instance_place(x + max(xVel+ceil(global.xSpeed),global.xSpeedMax),y,objDestroyBlock);
        if (db != noone)
        {
            doCombo();
            db.state = DEAD;
            db = noone;
        }
        pow = max(pow - 1, 0+(global.powerUp == POW_2));
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
        if (global.powerUp == POW_NONE)
        {
            if (combo >= 10)
            {
                playSound(sfxComboBreak,1);
                t = instance_create(cx,y,objText);
                t.text = "Combo Break";
                t.xVel = -2;
                t.yVel = -2.5;
                t.yGrav = .15;
            }
            combo = 0;
        }
        y = floor(y);
        jumpPerformed = 0;
        if (state != IDLE)
            state = RUN;
    }    

    if (x > WIDTH-TILE) x = WIDTH-TILE;

    if (place_free(x+ceil(global.xSpeed)+xVel,y))//!place_meeting(x+ceil(global.xSpeed) + xVel,y, objSolid))
    {
        x += xVel;

        //jump further
        if (state == JUMP)
            xVel = max(xVel,0);

        if (state != ATTACK)
        {
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
            {
                xVel = min(max(xVel - 8*xAcc, -global.xSpeed),0);
            }
        }
    } else
    {
        if (state == ATTACK)
            if (!place_meeting(x+ceil(global.xSpeed) + xVel,y, objDestroyBlock))
                state = JUMP;
        xVel = 0;
        move_outside_solid(180,TILE);
    }
}

yVel += yGrav;

if (state == DEAD)
{
    yGrav = yGravDefault;
    if (y > HEIGHT+TILE)
    {
        yVel = 0;
        y = HEIGHT+TILE;
    }
}

yCollision();

//prev/end variables
fCur = min((fCur+fSpeed) mod fMax, fMax);

if (state != statePrev && state != DEAD)
    fCur = 0;

if (!global.pause)
    statePrev = state;
