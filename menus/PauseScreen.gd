extends Panel


func _on_resume_button_pressed():
	print("test")
	%Player/GUI/PauseScreen.visible = true
	get_tree().paused = false
