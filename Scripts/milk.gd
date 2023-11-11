extends Node2D
signal itemCollected

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self,"_on_interact")

func _on_interact():
	emit_signal("itemCollected")
	var tween = get_tree().create_tween()
	var tween1 = get_tree().create_tween()
	tween.tween_property(self,"position", position- Vector2(0,20),0.2)
	tween1.tween_property(self,"modulate:a", 0, 0.1)
	
	tween.tween_callback(self.queue_free)
