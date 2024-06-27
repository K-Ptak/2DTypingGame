extends Node2D

@onready var enemy_container = $EnemyContainer

func _ready():
	if (get_tree().paused == true):
		get_tree().paused = !get_tree().paused	

	GlobalVars.win = false
	
var active_enemies = []
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
	
func screen_clear():
	for enemy in enemy_container.get_children():
		%Player/GUI/CanvasLayer/PlayerScore/Score.on_enemy_defeat(enemy.SCORE)
		if enemy.SCORE == 2500:
			enemy.queue_free()
			%Player/GUI/CanvasLayer/PlayerLife.player_win()
		enemy.queue_free()
		
func delete_all_entities():
	for enemy in enemy_container.get_children():
		enemy.queue_free()
	%Player/Sprite2D.visible = !%Player/Sprite2D.visible

func find_new_active_enemy(typed_character: String):
	active_enemies.clear()
	for enemy in enemy_container.get_children():
		if enemy.name != "EnemyProjectile":
			var prompt = enemy.get_prompt()
			var next_character = prompt.substr(0, 1)
			if next_character == typed_character:
				active_enemies.append(enemy)
	
	for enemy in active_enemies:
		if enemy.name != "EnemyProjectile":
			current_letter_index = 1
			enemy.set_next_character(current_letter_index)

var controlls = ["Up", "Down", "Left", "Right"]

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.is_pressed():
		var typed_event = event as InputEventKey
		var key_typed = typed_event.as_text_keycode()
		if active_enemies.is_empty():
			find_new_active_enemy(key_typed)
		elif key_typed == "Delete" or key_typed == "Backspace":
			if !active_enemies.is_empty():
				for enemy in active_enemies:
					enemy.reset_prompt()
				active_enemies.clear()
				
		else:
			for enemy in active_enemies:
				print(enemy.name)
				if !active_enemies.is_empty():
					if enemy.name != "EnemyProjectile":
						var prompt = enemy.get_prompt()
						var next_character = prompt.substr(current_letter_index, 1)
						if key_typed == next_character:
							current_letter_index += 1
							enemy.set_next_character(current_letter_index)
							if current_letter_index == prompt.length():
								current_letter_index = -1
								%Player/GUI/CanvasLayer/PlayerScore/Score.on_enemy_defeat(enemy.SCORE)
								if enemy.SCORE == 2500:
									enemy.queue_free()
									%Player/GUI/CanvasLayer/PlayerLife.player_win()
								enemy.queue_free()
								$EnemyDeathSound.play()
								active_enemies.erase(enemy)
								for x in active_enemies:
									x.reset_prompt()
								active_enemies.clear()
						else:
							if !controlls.has(key_typed):
								print("incorrectly typed %s instead of %s" % [key_typed, next_character])

func _on_soundtrack_finished():
	$Soundtrack.play()
