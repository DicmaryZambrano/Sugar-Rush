extends Node

const SAVE_PATH = "res://savegame.bin"

func _ready():
	loadGame()

func saveGame():
	var file = FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	var data: Dictionary = {
		"HighestScore": Game.HighestScore,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH,FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.HighestScore = current_line["HighestScore"]
	else:
		saveGame()
