extends Sprite2D

var recharge = 60

func _process(_delta):
	%CountdownLabel.text = str(round(%CountdownTimer.time_left))

func SkillRecharge():
	$RechargePanel/SkillAudio.play()
	$RechargePanel.visible = !$RechargePanel.visible
	$RechargePanel/ExplosionEffect.emitting = !$RechargePanel/ExplosionEffect.emitting
	%CountdownTimer.start(recharge)
	
func _on_countdown_timer_timeout():
	$RechargePanel.visible = !$RechargePanel.visible

func fast_recharge(time):
	%CountdownTimer.start(%CountdownTimer.time_left/time)
	$RechargePanel/BatteryPickupSound.play()
