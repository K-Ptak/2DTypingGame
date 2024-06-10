extends CharacterBody2D

class_name EnemyProjectile

const SPEED = 1000
@export var SCORE = 0
var rng = RandomNumberGenerator.new()
var v1 = rng.randf_range(-1,1)
var v2 = rng.randf_range(-1,1)

func _physics_process(_delta):
	move_and_collide(Vector2(v1,v2) * SPEED * _delta)


func _on_timer_timeout():
	queue_free()
