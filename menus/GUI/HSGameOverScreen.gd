extends Panel

func _on_quit_button_pressed():
	get_tree().paused = !get_tree().paused
	get_tree().quit()


func _on_main_menu_button_pressed():
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://menus/Menu.tscn")

func _on_hs_save_button_pressed():
	DataManagement.save_data.time.insert(0, GlobalVars.tempTime)
	DataManagement.save_data.characters.insert(0, GlobalVars.characterSelected)
	DataManagement.save_data.highscores.insert(0, %UserScore.text)
	DataManagement.save_data.names.insert(0, %PlayerName.text)
	DataManagement.save_data.save()
	%HSSaveSound.play()
	%HSSaveButton.disabled = !%HSSaveButton.disabled
