extends Label
class_name ItemCounterLabel

@export var item_key: String

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# display an item depending of the item key
	var item_number = Game.Inventory[item_key]
	self.text = "x " + str(item_number)
