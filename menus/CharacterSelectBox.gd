extends Panel

func _on_exit_character_select_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%CharacterSelectBox.visible = !%CharacterSelectBox.visible


func _on_character_wizard_pressed():
	GlobalVars.characterSelected = 1
	GlobalVars.hasSpell = true
	start_game()


func _on_character_ranger_pressed():
	GlobalVars.characterSelected = 2
	GlobalVars.hasSpell = false
	start_game()


func _on_character_warrior_pressed():
	GlobalVars.characterSelected = 3
	GlobalVars.hasSpell = false
	start_game()


func start_game():
	if(GlobalVars.characterSelected!=0):
		get_tree().change_scene_to_file("res://levels/Main.tscn")
