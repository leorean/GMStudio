var nbrs; var nk = 0;

for (var ni = -1; ni <= 1; ni++)
for (var nj = -1; nj <= 1; nj++)
{
    if (abs(ni) != abs(nj))
    {
        var nbr = instance_place(argument0.x+ni*TILE,argument0.y+nj*TILE,objPath);
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
