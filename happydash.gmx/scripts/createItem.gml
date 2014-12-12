//createItem(x, y, index, name, description, maxtier, pricearray, locked, tier);
var it,a,b,i,n,desc,mt,p,l,t;
a = argument0;
b = argument1;
i = argument2;
n = argument3;
desc = argument4;
p = argument5;
l = argument6;
t = argument7;
h = argument8;

it = instance_create(a,b,objShopItem);
it.index = i;
it.name = n;
it.description = desc;
it.maxTier = array_length_1d(p);

for (k = 0; k < array_length_1d(p); k+=1)
{
    it.price[k] = p[k];
}
it.price[array_length_1d(p)] = "MAXED";

it.locked = l;
it.tier = t;
it.unlockText = h;

return it;
