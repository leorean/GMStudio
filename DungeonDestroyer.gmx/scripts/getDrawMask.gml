var _c = 0;

/*var _bl = instance_place(x - TILE, floor(y), objBlock);
var _br = instance_place(x + TILE, floor(y), objBlock);
var _bu = instance_place(x, floor(y) - TILE, objBlock);
var _bd = instance_place(x, floor(y) + TILE, objBlock);*/

/*var _ = 2;
var _bl = collision_rectangle(x - TILE + _, y + _, x - _, y + TILE - _, objBlock, false, true);
var _br = collision_rectangle(x + _, y + _, x + TILE - _, y + TILE - _, objBlock, false, true);
var _bu = collision_rectangle(x + _, y - TILE + _, x + TILE - _, y - _, objBlock, false, true);
var _bd = collision_rectangle(x + _, y + _, x + TILE - _, y + TILE - _, objBlock, false, true);*/

var _bl = collision_point(x - 8, y + 8, objBlock, false, true);
var _br = collision_point(x + TILE + 8, y + 8, objBlock, false, true);
var _bu = collision_point(x + 8, y - 8, objBlock, false, true);
var _bd = collision_point(x + 8, y + TILE + 8, objBlock, false, true);

if (_bl && !_bl.falling && !_bl.broken && _bl.type == type && _bl.subType == subType) _c += 1;
if (_br && !_br.falling && !_br.broken && _br.type == type && _br.subType == subType) _c += 2;
if (_bu && !_bu.falling && !_bu.broken && _bu.type == type && _bu.subType == subType) _c += 4;
if (_bd && !_bd.falling && !_bd.broken && _bd.type == type && _bd.subType == subType) _c += 8;

switch(_c)
{
    case 1: return 2;
    case 2: return 1;
    case 4: return 4;
    case 8: return 3;

    case 3: return 9;
    case 5: return 5;
    case 6: return 6;
    case 7: return 11;
    case 9: return 7;
    case 10: return 8;
    case 11: return 13;
    case 12: return 10;
    case 13: return 12;
    case 14: return 14;
    case 15: return 15;
}

return 0;
