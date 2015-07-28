var bulX = x + sign(dir)*6 + xVel;
        var bulY = y + 8 + yVel;
        var bulletSpeed = 5;
        var bulletGrav = .08;
        var proj = instance_create(bulX,bulY,objPlayerProjectile);
        
        instance_create(bulX,bulY,objEffect);
        
        var res_angle = point_direction(bulX,bulY,mouse_x,mouse_y);
        var try_angle = res_angle;
        var found = false;
        var tx = mouse_x; var ty = mouse_y;
        
        var try_dir = sign(ty-bulY)*-sign(dir);
        
        if (true)
        {
            while (!found)
            {
                var dstx=abs(x-mouse_x);
                var ix = bulX;
                var iy = bulY;
                var ixVel = lengthdir_x(bulletSpeed,try_angle); var iyVel = lengthdir_y(bulletSpeed,try_angle);
                for(var i=0;i<dstx;i++)
                {
                    iyVel += bulletGrav;
                    ix += ixVel;
                    iy += iyVel;
                    
                    if (in(ix,tx-2,tx+2) && in(iy,ty-2,ty+2))
                    {
                        found = true;
                        break;
                    }
                }
                try_angle += sign(try_dir)*4;
                if (abs(try_angle-res_angle)>180) break;
            }
            if (found)
                res_angle = try_angle;
            
            proj.angle = res_angle;
            proj.xVel = lengthdir_x(bulletSpeed,proj.angle);
            proj.yVel = lengthdir_y(bulletSpeed,proj.angle);
            proj.yGrav = bulletGrav;
            
        }
