extends Camera2D

@export var tile_map : TileMap 

func _ready():
	#gets the boundries of the tile map and limits the movement
	#of the camera based on that
	var visibleArea = tile_map.get_used_rect();
	var tileSize = tile_map.cell_quadrant_size;
	var upperLeftCorner = visibleArea.position * tileSize;
	var lowerRightCorner = (visibleArea.position + visibleArea.size) * tileSize;
	
	limit_left = tile_map.position.x + upperLeftCorner.x;
	limit_top = tile_map.position.y + upperLeftCorner.y;
	limit_right = tile_map.position.x + lowerRightCorner.x;
	limit_bottom = tile_map.position.y + lowerRightCorner.y;
