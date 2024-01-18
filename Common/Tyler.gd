class_name Tyler extends TileMap

const highlight_tile_atlas_coords = Vector2i(0, 3)
const ground_layers = [1, 2]
const highlight_layer = 4
@export var character : WorldCharacter
var highlight_exception := Vector2i.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
#	set_cell(1, Vector2i(0, 0), -1, highlight_tile_atlas_coords)
	
	character.global_position = global_position + map_to_local(Vector2i.ZERO)
	
	var character_grid_pos = local_to_map(character.to_local(character.global_position))
	highlight_exception = character_grid_pos
	highlight_range(character_grid_pos, 2)


func highlight_range(start_grid_pos : Vector2i, range : int):
	if range < 1:
		return
	
	var adjacent_directions = [Vector2i.LEFT, Vector2i.DOWN, Vector2i.UP, Vector2i.RIGHT]
	for direction in adjacent_directions:
		var tile_coordinates = start_grid_pos + direction
		if tile_coordinates == highlight_exception:
			continue
		highlight_range(tile_coordinates, range - 1)
		
		var can_highlight : bool = true
		for ground_layer in ground_layers:
			var tiledata = get_cell_tile_data(ground_layer, tile_coordinates)
			if tiledata and tiledata.get_custom_data("Blocking"):
				can_highlight = false
		
		if can_highlight:
			set_cell(highlight_layer, tile_coordinates, 0, highlight_tile_atlas_coords)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init():
	print("Tyler initialized")

func test_func(message: String):
	print(message)
