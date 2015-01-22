ini_open(working_directory + global.saveFile);
ini_write_string('Options','sfx',string(global.mute));
ini_write_string('Options','mode',string(global.mode));
ini_write_string('Options','playerSelected',string(global.playerSelected));
ini_close();
