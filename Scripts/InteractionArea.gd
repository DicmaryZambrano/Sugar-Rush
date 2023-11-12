extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass
	

func _on_body_entered(body):
	#add self to the interaction manager
	InteractionManager.add_area(self)


func _on_body_exited(body):
	#remove self from the interaction manager
	InteractionManager.remove_area(self)
