extends Control

var heart_size: int = 64

func player_damaged():
	if $Hearts.size.x != heart_size:
		$PlayerHurtSound.play()
		$Hearts.size.x = $Hearts.size.x - heart_size
	else:
		get_tree().change_scene_to_file("res://menus/Death_screen.tscn")
	
func player_healed():
	$Hearts.size.x = $Hearts.size.x + heart_size
