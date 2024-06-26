extends Panel

func _on_exit_tutorial_button_pressed():
	%ButtonBox.visible = !%ButtonBox.visible
	%TutorialBox.visible = !%TutorialBox.visible
	%TutorialButton.visible = !%TutorialButton.visible
	%TutorialBackground.visible = !%TutorialBackground.visible
