extends Control

var heart_size: int = 64

func player_damaged():
	if $Hearts.size.x != heart_size:
		$Hearts.size.x = $Hearts.size.x - heart_size
	else:
		#On death
		$Hearts.size.x = $Hearts.size.x - heart_size
	
func player_healed():
	$Hearts.size.x = $Hearts.size.x + heart_size
