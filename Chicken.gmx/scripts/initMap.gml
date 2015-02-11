var i,j,tile;
for (j = 0; j < room_height/TILE; j++)
for (i = 0; i < room_width/TILE; i++)
{
    tile = tile_layer_find(D.TILES,i*TILE,j*TILE);
    
    if (tile != -1)
    {
        //ADD SLOPES (top row in tileset is the slope row):
        /*
        if (tile_get_top(tile) == 0)
        {
            if (tile_get_left(tile) % (4*TILE) == 2*TILE)
            {
                instance_create(i*TILE,j*TILE,objSlopeR);
                i++;
            }
            else if (tile_get_left(tile) % (4*TILE) == 0)
            {
                instance_create(i*TILE,j*TILE,objSlopeL);
                i++;
            }
            
        }*/
        /*
        //regular colliders
        if (tile_get_top(tile) > 0 && tile_get_top(tile) < 9*TILE)
        {
            instance_create(i*TILE,j*TILE,objCollider);
        }
        */
    }
}