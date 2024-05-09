extends Panel

func _on_exit_settings_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%SettingsBox.visible = !%SettingsBox.visible

func _on_test_sound_button_pressed():
	%TestSound.play()
