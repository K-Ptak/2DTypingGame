extends CharacterBody2D

@export var speed = 400


func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	#print(position.x, position.y) <- Current position of player

func _physics_process(_delta):
	get_input()
	move_and_slide()
