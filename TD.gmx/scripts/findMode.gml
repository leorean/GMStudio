var a = argument0;

if (array_length_1d(a) == 0)
    return -1;

var maxValue, maxCount;
maxCount = 0;

for (var i = 0; i < array_length_1d(a); ++i) {
    var count = 0;
    for (var j = 0; j < array_length_1d(a); ++j) {
        if (a[j] == a[i] && a[i]!= -1) ++count;
    }
    if (count > maxCount) {
        maxCount = count;
        maxValue = a[i];
    }
}

return maxValue;
