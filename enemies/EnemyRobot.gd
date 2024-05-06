extends Enemy

class_name EnemyRobot

const SPEED = 300
@export var SCORE = 50


func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
	handleCollision()
