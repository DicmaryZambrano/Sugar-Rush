extends Node2D


func _on_timer_timeout():
	if Game.Points >= Game.HighestScore:
		Game.HighestScore = Game.Points
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	Utils.saveGame()
	Game.Points = 0
	Game.Inventory["Cake"] = 0
	Game.Inventory["Strawberry"] = 0
	self.queue_free
