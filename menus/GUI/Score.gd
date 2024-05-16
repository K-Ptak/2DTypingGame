extends Label

@export var score = 0
@export var multiplier = 1


func on_enemy_defeat(new_score):
	score += new_score * multiplier
	multiplier += 1
	var zeroes = ""
	
	if str(score).length() < 7:
		var bufor = 0
		while(str(score).length() + bufor < 7):
			bufor += 1
		
		for z in bufor:
			zeroes += "0"
		
	
	
	%Score.text = "%s%s" % [zeroes,score]
	%Multiplier.text = "x%s" % multiplier 

func reset_multiplier():
	multiplier = 1

func double_multiplier():
	multiplier *= 2
	%Multiplier.text = "x%s" % multiplier
	%DoublePickupSound.play()
