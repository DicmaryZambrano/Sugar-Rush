extends Node2D


func _on_timer_timeout():
	if Game.Points >= Game.HighestScore:
		Game.HighestScore = Game.Points
		print(Game.HighestScore)
	Utils.saveGame()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Game.Points = 0
	Game.Inventory["Cake"] = 0
	Game.Inventory["Strawberry"] = 0
	self.queue_free
