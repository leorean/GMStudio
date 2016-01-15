var nbrs; var nk = 0;

for (var ni = -1; ni <= 1; ni++)
for (var nj = -1; nj <= 1; nj++)
{
    if (abs(ni) != abs(nj))
    {
        var nbr = collision_point(argument0.cx+ni*TILE,argument0.cy+nj*TILE,objPath,false,true);
        if (nbr != noone)
        {
            nbrs[nk] = nbr;
            nk++;
        }
    }
}

if (nk == 0) //no neighbours
    return noone;

return nbrs;
