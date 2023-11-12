extends Label

@onready var timer = $"Timer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(int(timer.time_left))
