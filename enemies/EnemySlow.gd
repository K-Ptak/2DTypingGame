extends Enemy

class_name EnemySlow

const SPEED = 50
@export var SCORE = 5

func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
	handleCollision()
