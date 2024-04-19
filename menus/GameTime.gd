extends Panel


var time: float = 0.0
var minutes: int = 0
var seconds: int = 0
var miliseconds: int = 0

func _process(delta) -> void:
	time += delta
	miliseconds = fmod(time, 1) * 100
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$Miliseconds.text = "%03d" % miliseconds

func stop() -> void:
	set_process(false)

func format_time() -> String:
	return "%02d:%02d.%03d" % [minutes, seconds, miliseconds]
