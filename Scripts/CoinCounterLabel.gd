extends Label


func _process(delta):
	#get the points from the Game singleton and displays them
	text = "x " + str(Game.Points)
