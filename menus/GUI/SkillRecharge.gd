extends Sprite2D

var recharge = 60

func _ready():
	if(GlobalVars.hasSpell):
		visible = true
	else:
		visible = false

func _process(_delta):
	%CountdownLabel.text = str(round(%CountdownTimer.time_left))

func SkillRecharge():
	$RechargePanel/SkillAudio.play()
	$SpellLabel.visible = !$SpellLabel.visible
	$SpacebarLabel.visible = !$SpacebarLabel.visible
	$RechargePanel.visible = !$RechargePanel.visible
	$RechargePanel/ExplosionEffect.emitting = !$RechargePanel/ExplosionEffect.emitting
	%CountdownTimer.start(recharge)
	
func _on_countdown_timer_timeout():
	$RechargePanel.visible = !$RechargePanel.visible
	$SpellLabel.visible = !$SpellLabel.visible
	$SpacebarLabel.visible = !$SpacebarLabel.visible

func fast_recharge(time):
	%CountdownTimer.start(%CountdownTimer.time_left/time)
	$RechargePanel/BatteryPickupSound.play()
