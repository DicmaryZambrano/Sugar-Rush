extends Label

func _process(delta):
	text = "Ingedients = "
	for ingredient in $"../../Player".inventory:
		text += ingredient
