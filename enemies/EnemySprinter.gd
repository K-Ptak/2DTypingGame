extends Enemy

class_name EnemySprinter

const SPEED = 200
@export var SCORE = 25

func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
	rotation = velocity.angle()
	handleCollision()
