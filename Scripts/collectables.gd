extends Node2D
class_name Collectables

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")
@export var collectable: Node2D
@export var ypositions: Array
@export var spawnCount: int
@export var maxSpawnCount: int

func _on_timer_timeout():
	if spawnCount >= maxSpawnCount:
		return
		
	var inst_collectable = collectable.instantiate()
	var rng = RandomNumberGenerator.new()
	var intx = ypositions[rng.randi_range(0,(len(ypositions)-1))]
	ypositions.erase(intx)
	var inty = 144
	inst_collectable.position = Vector2(intx,inty)
	add_child(inst_collectable)
	inst_collectable.itemCollected.connect(_on_item_collected)
	spawnCount += 1

func _on_item_collected(position: Vector2):
	print(ypositions)
	spawnCount -= 1
	ypositions.append(position.x)
	print(position.x)
	print(ypositions)
