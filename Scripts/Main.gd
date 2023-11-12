extends Node2D



func _on_play_pressed():
	#start the game
	get_tree().change_scene_to_file("res://Scenes/kitchen.tscn")

func _on_quit_pressed():
	get_tree().quit()
