extends Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#add points from Game singleton
	text = "x " + str(Game.Points)
