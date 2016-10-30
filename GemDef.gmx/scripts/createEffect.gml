global.effectPool[global.effectIndex].x = argument0;
global.effectPool[global.effectIndex].y = argument1;
global.effectPool[global.effectIndex].type = argument2;
global.effectIndex = (global.effectIndex + 1) % array_length_1d(global.effectPool);

