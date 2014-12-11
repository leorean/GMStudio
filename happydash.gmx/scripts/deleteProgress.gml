if file_exists(working_directory + global.saveFile)
   file_delete(working_directory + global.saveFile);

//clear scores
for (i = 0; i < global.scoreCount; i+=1)
    global.scores[i] = 0;
    
global.wallet = 0;

saveProgress();
loadProgress();
