extends Node

func readFile():
	var file = FileAccess.open("res://assets/dictionaries/words_alpha.txt", FileAccess.READ)
	var content: Array = []
	
	while !file.eof_reached():
		var line: String = file.get_line()
		content.append(line)
	return content

var words = readFile()

func get_prompt() -> String:
	var word = words.pick_random()
	
	return word
