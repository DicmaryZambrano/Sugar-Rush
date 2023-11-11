extends Node2D

@onready var player = $"../Player"
var Strawberry = preload("res://Scenes/strawberry.tscn")
var ypositions = [104,120,136,152,168]
var spawnCount = 0
var maxSpawnCount = 5

func _on_timer_timeout():
	if spawnCount >= maxSpawnCount:
		return
		
	var StrawberrySpawn = Strawberry.instantiate()
	var rng = RandomNumberGenerator.new()
	var intx = ypositions[rng.randi_range(0,(len(ypositions)-1))]
	ypositions.erase(intx)
	var inty = 144
	StrawberrySpawn.position = Vector2(intx,inty)
	add_child(StrawberrySpawn)
	StrawberrySpawn.itemCollected.connect(_on_strawberry_collected)
	spawnCount += 1

func _on_strawberry_collected(position: Vector2):
	print(ypositions)
	spawnCount -= 1
	ypositions.append(position.x)
	print(position.x)
	print(ypositions)
