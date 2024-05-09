extends Sprite2D

func _process(_delta):
	%CountdownLabel.text = str(round(%CountdownTimer.time_left))

func SkillRecharge():
	$RechargePanel/SkillAudio.play()
	$RechargePanel.visible = !$RechargePanel.visible
	$RechargePanel/ExplosionEffect.emitting = !$RechargePanel/ExplosionEffect.emitting
	%CountdownTimer.start()
	


func _on_countdown_timer_timeout():
	$RechargePanel.visible = !$RechargePanel.visible
