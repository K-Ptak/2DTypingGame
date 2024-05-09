extends Node

var save_data:SaveData

func _ready():
	save_data = SaveData.load_or_create()
	print(save_data)
	print(save_data.highscores)
	print(save_data.names)
