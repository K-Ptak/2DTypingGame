extends Panel


func _on_main_menu_button_pressed():
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://menus/Menu.tscn")
