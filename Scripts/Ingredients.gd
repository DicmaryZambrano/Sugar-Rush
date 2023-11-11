extends Node2D


var Strawberry = preload("res://Scenes/strawberry.tscn")
var positions = [104,120,152]

func _on_timer_timeout():
	var StrawberrySpawn = Strawberry.instantiate()
	var rng = RandomNumberGenerator.new()
	var intx = rng.randi_range(104,152)
	var inty = 128
	cherryTem.position = Vector2(ranintx,raninty)
	add_child(cherryTem)
