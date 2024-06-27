extends Enemy

class_name EnemyBoss

const SPEED = 400
@export var SCORE = 2500
var projectile = preload("res://enemies/EnemyProjectile.tscn")

func _physics_process(_delta):
	move_and_collide(global_position.direction_to(get_node("/root/Main/Player").position) * SPEED * _delta)
	rotation = velocity.angle()
	handleCollision()

func _on_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	%ProjectilePath.progress = rng.randi_range(0, 3664)
	var instance = projectile.instantiate()
	
	instance.global_position = %ProjectileSpawn.global_position
	get_parent().add_child(instance)

