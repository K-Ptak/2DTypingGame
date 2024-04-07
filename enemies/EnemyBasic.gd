extends Enemy

class_name EnemyBasic

const SPEED = 100
const SCORE = 100

func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
