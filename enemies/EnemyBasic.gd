extends Enemy

class_name EnemyBasic

const SPEED = 100
@export var SCORE = 10

func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
	handleCollision()
