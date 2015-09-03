var a = argument0;

if (array_length_1d(a) == 0)
    return -1;

var maxValue, maxCount;
maxCount = 0;

for (var i = 0; i < array_length_1d(a); ++i) {
    var count = 0;
    for (var j = 0; j < array_length_1d(a); ++j) {
        if (a[j] == a[i]) ++count;
    }
    if (count > maxCount) {
        maxCount = count;
        maxValue = a[i];
    }
}

return maxValue;
/*
var modeMap;
for(var i = 0; i < array_length_1d(array); i++)
    modeMap[i] = -1;

var maxEl = array[0];
var maxCount = 1;
for(var i = 0; i < array_length_1d(array); i++)
{
    var el = array[i];
    if(modeMap[el] == -1)
        modeMap[el] = 1;
    else
        modeMap[el]++;
    if(modeMap[el] > maxCount)
    {
        maxEl = el;
        maxCount = modeMap[el];
    }
}
return maxEl;*/

