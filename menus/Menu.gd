extends Control

func _on_options_button_pressed():
	#var options = load("res://Menus/Options.tscn").instance()
	#get_tree().current_scene.add_child(options)
	pass


func _on_quit_button_pressed():
	get_tree().quit()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/Main.tscn")


func _on_leaderboards_pressed():
	#var options = load("res://Menus/Options.tscn").instance()
	#get_tree().current_scene.add_child(options)
	pass
