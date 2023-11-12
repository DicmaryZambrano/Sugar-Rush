extends StaticBody2D

@onready var message = $Message

var interactable = false

func _ready():
	message.hide()

func _input(event):
	if event.is_action_pressed("act") && interactable:
		eat()	

func eat():
	#eats a cake and gives the player points
	if Game.Inventory["Cake"] >= 1:
		Game.Inventory["Cake"] -= 1
		Game.Points += 100
		$AudioStreamPlayer2D.play()

func _on_body_entered(body):
	message.show()
	interactable = true


func _on_body_exited(body):
	message.hide()
	interactable = false
