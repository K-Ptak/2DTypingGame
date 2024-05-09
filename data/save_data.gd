extends Resource
class_name SaveData

@export var highscores = []
@export var names = []
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
