extends Node2D

@onready var enemy_container = $EnemyContainer

var active_enemy = null
var current_letter_index: int = -1
var enemyPool = [
preload("res://enemies/EnemyBasic.tscn"),
preload("res://enemies/EnemySprinter.tscn"),
preload("res://enemies/EnemySlow.tscn"),
preload("res://enemies/EnemyRobot.tscn")
]

	
func _on_enemy_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	%PathFollow2D.progress = rng.randi_range(0, 3664)
	var instance = enemyPool.pick_random().instantiate()
	
	instance.global_position = %Marker2D.global_position
	enemy_container.add_child(instance)

func find_new_active_enemy(typed_character: String):
	for enemy in enemy_container.get_children():
		var prompt = enemy.get_prompt()
		var next_character = prompt.substr(0, 1)
		if next_character == typed_character:
			print("found new enemy that starts with %s" % next_character)
			active_enemy = enemy
			current_letter_index = 1
			active_enemy.set_next_character(current_letter_index)
			return

var controlls = ["Up", "Down", "Left", "Right"]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		#print(typed_event)
		var key_typed = typed_event.as_text_keycode()
		#print("Key typed %s" % key_typed)
		if active_enemy == null:
			find_new_active_enemy(key_typed)
		elif key_typed == "Delete":
			active_enemy.reset_prompt()
			active_enemy = null
		else:
			var prompt = active_enemy.get_prompt()
			var next_character = prompt.substr(current_letter_index, 1)
			#print("next_character %s" % next_character)
			if key_typed == next_character:
				#print("successfully typed %s" % key_typed)
				current_letter_index += 1
				active_enemy.set_next_character(current_letter_index)
				if current_letter_index == prompt.length():
					print("Done")
					current_letter_index = -1
					%Player/GUI/CanvasLayer/PlayerScore/Score.on_enemy_defeat(active_enemy.SCORE)
					active_enemy.queue_free()
					$EnemyDeathSound.play()
					active_enemy = null
			else:
				if !controlls.has(key_typed) :
					print("incorrectly typed %s instead of %s" % [key_typed, next_character])


func _on_soundtrack_finished():
	$Soundtrack.play()
