extends Node2D

@onready var message = $Message
var interactable = false

func _ready():
	message.hide()

func _input(event):
	#if the oven can be interacted with call bake and give the player a cake
	if event.is_action_pressed("act") && interactable:
		bake()

func _on_body_entered(body):
	message.show()
	interactable = true


func _on_body_exited(body):
	message.hide()
	interactable = false

func bake():
	#Access the inventory on Game singleton
	if Game.Inventory["Strawberry"] >= 5:
		Game.Inventory["Strawberry"] -= 5 #subtract 5 strawberries
		Game.Inventory["Cake"] += 1 #add one cake
		$AudioStreamPlayer2D.play()
