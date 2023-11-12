extends Node2D

@onready var label = $Label

const BASE_TEXT = "[E] to "

var active_areas = []
var interactable = true

func add_area(area: InteractionArea):
	#add a new area to the area list to organize
	active_areas.push_back(area)

func remove_area(area: InteractionArea):
	#remove an area from the area list
	var index = active_areas.find(area)
	if index != -1:
		active_areas.remove_at(index)

func _process(delta):
	#detect if the label should be shown
	if active_areas.size() > 0 && interactable:
		active_areas.sort_custom(_sort_by_player_distance)
		label.text = BASE_TEXT + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= 16
		label.global_position.x -= label.size.x / 2
		label.show()
	else:
		label.hide()
		
func _sort_by_player_distance(area1, area2):
	#custom sorting so the closest area to the player gets trigered
	var area1_to_player = Game.Player.global_position.distance_to(area1.global_position)
	var area2_to_player = Game.Player.global_position.distance_to(area2.global_position)
	
	return area1_to_player < area2_to_player

func _input(event):
	#call the interaction function inside the interactive area
	#wen E is pressed
	if event.is_action_pressed("act") && interactable:
		if active_areas.size() > 0:
			interactable = false
			label.hide()
			
			await active_areas[0].interact.call()
			
			interactable = true
