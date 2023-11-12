extends Node2D
class_name CollectablesSpawner

@export var collectable : PackedScene
@export var ypositions : Array
@export var xpositions : Array
@export var maxSpawnCount : int
@export var collectableKey: String
var spawnCount : int

func _on_timer_timeout():
	#creates a new collectable based on
	#the entered parameters
	if spawnCount >= maxSpawnCount:
		return

	if xpositions.is_empty() or ypositions.is_empty():
		return

	var inst_collectable = collectable.instantiate()
	var intx = xpositions.pick_random()
	var inty = ypositions.pick_random()

	xpositions.erase(intx)
	ypositions.erase(inty)

	inst_collectable.position = Vector2(intx, inty)
	add_child(inst_collectable)
	inst_collectable.itemCollected.connect(_on_item_collected)
	spawnCount += 1

func _on_item_collected(obj_position: Vector2):
	spawnCount -= 1
	xpositions.append(obj_position.x)
	ypositions.append(obj_position.y)
	Game.Inventory[collectableKey] += 1
	$AudioStreamPlayer2D.play()

