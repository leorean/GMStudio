var arr, arrInd;

for (arrInd = 0; arrInd < ds_list_size(argument0); arrInd +=1)
    arr[arrInd] = ds_list_find_value(argument0,arrInd);

ds_list_destroy(argument0);

return arr;
