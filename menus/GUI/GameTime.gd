extends Panel


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var miliseconds: int = 0
var win_condition: int = 1
var win: bool = false
@export var green = Color("#27fa14")

func _process(delta) -> void:
	if!%PauseScreen.visible && minutes < win_condition:
		time += delta
		@warning_ignore("narrowing_conversion")
		miliseconds = fmod(time, 1) * 100
		@warning_ignore("narrowing_conversion")
		seconds = fmod(time, 60)
		@warning_ignore("narrowing_conversion")
		minutes = fmod(time, 3600) / 60
		$Minutes.text = "%02d:" % minutes
		$Seconds.text = "%02d." % seconds
		$Miliseconds.text = "%03d" % miliseconds
	elif minutes >= win_condition:
		$Minutes.text = "%02d:" % win_condition
		$Seconds.text = "%02d." % 00
		$Miliseconds.text = "%03d" % 00
		$Minutes.set("theme_override_colors/font_color",green)
		$Seconds.set("theme_override_colors/font_color",green)
		$Miliseconds.set("theme_override_colors/font_color",green)
		if win == false:
			%WinFanfareSound.play()
			win = true

func stop() -> void:
	set_process(false)

func format_time() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, miliseconds]
