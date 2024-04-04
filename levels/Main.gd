extends Node2D

@onready var enemy_container = $EnemyContainer

var active_enemy = null
var current_letter_index: int = -1

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

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		print(typed_event)
		var key_typed = typed_event.as_text_keycode()
		print("Key typed %s" % key_typed)
		if active_enemy == null:
			find_new_active_enemy(key_typed)
		else:
			var prompt = active_enemy.get_prompt()
			var next_character = prompt.substr(current_letter_index, 1)
			print("next_character %s" % next_character)
			if key_typed == next_character:
				print("successfully typed %s" % key_typed)
				current_letter_index += 1
				active_enemy.set_next_character(current_letter_index)
				if current_letter_index == prompt.length():
					print("Done")
					current_letter_index = -1
					active_enemy.queue_free()
					$EnemyDeathSound.play()
					active_enemy = null
			else:
				print("incorrectly typed %s instead of %s" % [key_typed, next_character])
