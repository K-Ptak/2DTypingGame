extends Panel

@export var score_panel_scene: PackedScene

func _ready():
	draw_highscores_to_ui()

func _on_exit_leaderboard_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%LeaderboardBox.visible = !%LeaderboardBox.visible

func draw_highscores_to_ui():
	for i in %ScoreContainer.get_child_count():
		if get_child(i) != null:
			%ScoreContainer.get_child(i).queue_free()
	
	draw_margin_panels()
	var index : int = 0
	for score in DataManagement.save_data.highscores:
			var score_panel = score_panel_scene.instantiate()
			score_panel.get_child(0).text = DataManagement.save_data.names[index]
			print(DataManagement.save_data.names[index])
			score_panel.get_child(1).text = DataManagement.save_data.time[index]
			print(DataManagement.save_data.time[index])
			score_panel.get_child(2).texture = draw_character_img(index)
			score_panel.get_child(3).text = score
			score_panel.get_child(4).texture = draw_win(index)
			%ScoreContainer.add_child(score_panel)
			index += 1
	draw_margin_panels()

func draw_character_img(index):
	match DataManagement.save_data.characters[index]:
		1:
			return load("res://assets/GUI/wizard_icon.png")
		2:
			return load("res://assets/GUI/ranger_icon.png")
		3:
			return load("res://assets/GUI/warrior_icon.png")
			
func draw_win(index):
	match DataManagement.save_data.win[index]:
		true:
			return load("res://assets/GUI/crown_icon.png")
		false:
			return null
			
func draw_margin_panels():
	var score_panel = score_panel_scene.instantiate()
	score_panel.get_child(0).text = " "
	score_panel.get_child(1).text = " "
	%ScoreContainer.add_child(score_panel)
