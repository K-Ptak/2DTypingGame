extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 72
var height = 40
#var speed = 50
#var vel = Vector2()

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()


func _process(delta):
	generate_chunk(position)
	#vel = Vector2()
	#vel = Vector2(speed, 0)
	#self.translate(vel * delta)

func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y)*10
			var temp = temperature.get_noise_2d(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y)*10
			var alt = altitude.get_noise_2d(tile_pos.x - width/2 + x, tile_pos.y - height/2 + y)*10
			set_cell(0, Vector2i(tile_pos.x - width/4 + x, tile_pos.y - height/4 + y), 0, Vector2(round((moist+10)/5), round((temp+10)/5)))
