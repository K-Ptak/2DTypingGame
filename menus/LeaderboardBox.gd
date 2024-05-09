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
			score_panel.get_child(1).text = score
			%ScoreContainer.add_child(score_panel)
			index += 1
	draw_margin_panels()

func draw_margin_panels():
	var score_panel = score_panel_scene.instantiate()
	score_panel.get_child(0).text = " "
	score_panel.get_child(1).text = " "
	%ScoreContainer.add_child(score_panel)
