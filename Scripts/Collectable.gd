extends Node2D
class_name Collectable
signal itemCollected(position: Vector2)

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self,"_on_interact")

func _on_interact():
	#emits a signal to any listening node
	#no notify the current position of the item
	#and if it has been collected
	emit_signal("itemCollected",position)
	var tween = get_tree().create_tween()
	var tween1 = get_tree().create_tween()
	tween.tween_property(self,"position", position- Vector2(0,20),0.2)
	tween1.tween_property(self,"modulate:a", 0, 0.1)
	tween.tween_callback(self.queue_free)
