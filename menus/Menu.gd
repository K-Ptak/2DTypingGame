extends Control

func _on_options_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%SettingsBox.visible = !%SettingsBox.visible


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%CharacterSelectBox.visible = !%CharacterSelectBox.visible


func _on_leaderboards_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%LeaderboardBox.visible = !%LeaderboardBox.visible


func _on_soundtrack_finished():
	$Soundtrack.play()


func _on_exit_settings_button_pressed():
	_on_options_button_pressed()


func _on_tutorial_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%TutorialBox.visible = !%TutorialBox.visible
	%TutorialButton.visible = !%TutorialButton.visible
	%TutorialBackground.visible = !%TutorialBackground.visible
