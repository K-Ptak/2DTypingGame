extends Resource
class_name SaveData

@export var highscores = []
@export var names = []
@export var characters = []
@export var time = []
@export var win = []

const SAVE_PATH : String = "user://leaderboards.tres"

func save():
	ResourceSaver.save(self, SAVE_PATH)
	
static func load_or_create():
	var res:SaveData
	if FileAccess.file_exists(SAVE_PATH):
		res = load(SAVE_PATH) as SaveData
	else:
		res = SaveData.new()
	return res
